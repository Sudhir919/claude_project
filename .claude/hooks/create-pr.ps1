#Requires -Version 5.1
<#
.SYNOPSIS
    Claude Code Stop Hook for Automated GitHub PR Creation

.DESCRIPTION
    This hook runs after Claude Code stops and creates a GitHub PR if:
    - .claude/pr-authorized.json exists with proper authorization
    - All SDLC artifacts are validated
    - Verification passed
    - Code review approved
    - HITL Gate #3 approved
    - PR preparation complete

.PARAMETER DryRun
    Validate all conditions and show what would happen without creating PR

.NOTES
    This hook is idempotent and safe to run multiple times.
    It will not create duplicate PRs or commits.
#>

param(
    [switch]$DryRun
)

# Set error action preference
$ErrorActionPreference = "Stop"

# Project root directory
$ProjectRoot = $PSScriptRoot | Split-Path | Split-Path
$AuthFile = Join-Path $ProjectRoot ".claude\pr-authorized.json"

# ============================================================
# STEP 1: CHECK AUTHORIZATION FILE
# ============================================================

Write-Host "[INFO] Checking for PR authorization..." -ForegroundColor Blue

if (-not (Test-Path $AuthFile)) {
    Write-Host "[INFO] No PR authorization file found at: $AuthFile" -ForegroundColor Blue
    Write-Host "[INFO] Hook will not create PR. This is normal behavior." -ForegroundColor Blue
    exit 0
}

Write-Host "[SUCCESS] Found PR authorization file" -ForegroundColor Green

# ============================================================
# STEP 2: READ AND VALIDATE AUTHORIZATION
# ============================================================

Write-Host "[INFO] Reading authorization file..." -ForegroundColor Blue

try {
    $Authorization = Get-Content $AuthFile -Raw | ConvertFrom-Json
} catch {
    Write-Host "[ERROR] Failed to parse authorization file: $_" -ForegroundColor Red
    exit 1
}

Write-Host "[INFO] Validating authorization conditions..." -ForegroundColor Blue

$RequiredFields = @{
    "authorized" = $true
    "verification" = "PASS"
    "code_review" = "APPROVED"
    "hitl_gate_3" = "APPROVED"
    "pr_preparation" = "COMPLETE"
}

$ValidationFailed = $false

foreach ($field in $RequiredFields.Keys) {
    $expectedValue = $RequiredFields[$field]
    $actualValue = $Authorization.$field

    if ($actualValue -ne $expectedValue) {
        Write-Host "[ERROR] Authorization validation failed: $field = '$actualValue' (expected: '$expectedValue')" -ForegroundColor Red
        $ValidationFailed = $true
    } else {
        Write-Host "[SUCCESS] $field = $actualValue" -ForegroundColor Green
    }
}

if ($ValidationFailed) {
    Write-Host "[ERROR] Authorization file is invalid. PR will not be created." -ForegroundColor Red
    exit 1
}

Write-Host "[SUCCESS] Authorization validated successfully" -ForegroundColor Green

# ============================================================
# STEP 3: VALIDATE SDLC ARTIFACTS
# ============================================================

Write-Host "[INFO] Validating SDLC artifacts..." -ForegroundColor Blue

$RequiredArtifacts = @(
    "requirements.md",
    "architecture.md",
    "design-review.md",
    "impl-plan.md",
    "code-review.md",
    "verification.md",
    "PR.md",
    "CHANGELOG.md"
)

foreach ($artifact in $RequiredArtifacts) {
    $artifactPath = Join-Path $ProjectRoot $artifact
    if (-not (Test-Path $artifactPath)) {
        Write-Host "[ERROR] Required artifact missing: $artifact" -ForegroundColor Red
        exit 1
    }
    Write-Host "[SUCCESS] $artifact exists" -ForegroundColor Green
}

# ============================================================
# STEP 4: VALIDATE VERIFICATION STATUS
# ============================================================

Write-Host "[INFO] Validating verification status..." -ForegroundColor Blue

$VerificationPath = Join-Path $ProjectRoot "verification.md"
$VerificationContent = Get-Content $VerificationPath -Raw

if ($VerificationContent -notmatch "PASS") {
    Write-Host "[ERROR] Verification did not PASS" -ForegroundColor Red
    exit 1
}

Write-Host "[SUCCESS] Verification status: PASS" -ForegroundColor Green

# ============================================================
# STEP 5: VALIDATE CODE REVIEW STATUS
# ============================================================

Write-Host "[INFO] Validating code review status..." -ForegroundColor Blue

$CodeReviewPath = Join-Path $ProjectRoot "code-review.md"
$CodeReviewContent = Get-Content $CodeReviewPath -Raw

if ($CodeReviewContent -notmatch "APPROVED") {
    Write-Host "[ERROR] Code review not APPROVED" -ForegroundColor Red
    exit 1
}

Write-Host "[SUCCESS] Code review status: APPROVED" -ForegroundColor Green

# ============================================================
# STEP 6: CHECK GIT REPOSITORY
# ============================================================

Write-Host "[INFO] Checking git repository..." -ForegroundColor Blue

Push-Location $ProjectRoot

try {
    $null = git rev-parse --git-dir 2>&1
    if ($LASTEXITCODE -ne 0) {
        Write-Host "[ERROR] Not a git repository" -ForegroundColor Red
        exit 1
    }
    Write-Host "[SUCCESS] Git repository found" -ForegroundColor Green
} catch {
    Write-Host "[ERROR] Git is not available" -ForegroundColor Red
    exit 1
}

# ============================================================
# STEP 7: CHECK GITHUB CLI
# ============================================================

Write-Host "[INFO] Checking GitHub CLI..." -ForegroundColor Blue

try {
    $null = gh --version 2>&1
    if ($LASTEXITCODE -ne 0) {
        Write-Host "[ERROR] GitHub CLI (gh) is not available" -ForegroundColor Red
        exit 1
    }
    Write-Host "[SUCCESS] GitHub CLI found" -ForegroundColor Green
} catch {
    Write-Host "[ERROR] GitHub CLI (gh) is not installed" -ForegroundColor Red
    exit 1
}

# Check gh authentication
Write-Host "[INFO] Checking GitHub CLI authentication..." -ForegroundColor Blue

try {
    $null = gh auth status 2>&1
    if ($LASTEXITCODE -ne 0) {
        Write-Host "[ERROR] GitHub CLI is not authenticated. Run: gh auth login" -ForegroundColor Red
        exit 1
    }
    Write-Host "[SUCCESS] GitHub CLI authenticated" -ForegroundColor Green
} catch {
    Write-Host "[ERROR] Failed to check GitHub CLI authentication" -ForegroundColor Red
    exit 1
}

# ============================================================
# STEP 8: CALCULATE BRANCH NAME
# ============================================================

$Timestamp = Get-Date -Format "yyyyMMdd-HHmmss"
$BranchName = "sdlc/todo-app-$Timestamp"

Write-Host "[INFO] Target branch: $BranchName" -ForegroundColor Blue

# ============================================================
# STEP 9: CHECK FOR EXISTING PR
# ============================================================

Write-Host "[INFO] Checking for existing PRs..." -ForegroundColor Blue

try {
    $ExistingPRs = gh pr list --head $BranchName --json number,url 2>&1 | ConvertFrom-Json

    if ($ExistingPRs.Count -gt 0) {
        $ExistingPR = $ExistingPRs[0]
        Write-Host "[WARN] PR already exists for branch: $BranchName" -ForegroundColor Yellow
        Write-Host "[INFO] Existing PR URL: $($ExistingPR.url)" -ForegroundColor Blue

        if ($DryRun) {
            Write-Host "[DRY-RUN] Would return existing PR URL and exit" -ForegroundColor Cyan
        }

        Pop-Location
        exit 0
    }

    Write-Host "[SUCCESS] No existing PR found" -ForegroundColor Green
} catch {
    # If gh pr list fails, continue (might be first PR)
    Write-Host "[INFO] Could not check for existing PRs (this is OK for first PR)" -ForegroundColor Blue
}

# ============================================================
# STEP 10: CHECK CURRENT BRANCH
# ============================================================

Write-Host "[INFO] Checking current branch..." -ForegroundColor Blue

$CurrentBranch = git branch --show-current

if ($CurrentBranch -match "^sdlc/todo-app-") {
    Write-Host "[INFO] Already on SDLC branch: $CurrentBranch" -ForegroundColor Blue
    Write-Host "[INFO] Reusing current branch instead of creating new one" -ForegroundColor Blue
    $BranchName = $CurrentBranch
} elseif ($CurrentBranch -eq "main" -or $CurrentBranch -eq "master") {
    Write-Host "[WARN] Currently on $CurrentBranch branch. Will create feature branch." -ForegroundColor Yellow
}

# ============================================================
# STEP 11: DRY RUN SUMMARY
# ============================================================

if ($DryRun) {
    Write-Host "" -ForegroundColor Cyan
    Write-Host "==========================================" -ForegroundColor Cyan
    Write-Host "DRY RUN - NO CHANGES WILL BE MADE" -ForegroundColor Cyan
    Write-Host "==========================================" -ForegroundColor Cyan
    Write-Host "" -ForegroundColor Cyan
    Write-Host "All validations passed. Would perform:" -ForegroundColor Cyan
    Write-Host "" -ForegroundColor Cyan
    Write-Host "1. Fetch latest from origin/main" -ForegroundColor Cyan
    Write-Host "2. Create feature branch: $BranchName" -ForegroundColor Cyan
    Write-Host "3. Stage SDLC artifacts and todo-app/" -ForegroundColor Cyan
    Write-Host "4. Commit with message: 'feat: implement todo application through agentic SDLC'" -ForegroundColor Cyan
    Write-Host "5. Push branch to origin" -ForegroundColor Cyan
    Write-Host "6. Create PR targeting main" -ForegroundColor Cyan
    Write-Host "7. Use PR.md as PR body" -ForegroundColor Cyan
    Write-Host "" -ForegroundColor Cyan
    Write-Host "==========================================" -ForegroundColor Cyan

    Pop-Location
    exit 0
}

# ============================================================
# STEP 12: FETCH LATEST FROM ORIGIN
# ============================================================

Write-Host "[INFO] Fetching latest from origin..." -ForegroundColor Blue

try {
    git fetch origin 2>&1 | Out-Null
    if ($LASTEXITCODE -ne 0) {
        Write-Host "[ERROR] Failed to fetch from origin" -ForegroundColor Red
        exit 1
    }
    Write-Host "[SUCCESS] Fetched from origin" -ForegroundColor Green
} catch {
    Write-Host "[ERROR] Failed to fetch from origin: $_" -ForegroundColor Red
    exit 1
}

# ============================================================
# STEP 13: CREATE FEATURE BRANCH
# ============================================================

Write-Host "[INFO] Creating feature branch from origin/main..." -ForegroundColor Blue

# Check if we're already on the target branch
if ($CurrentBranch -eq $BranchName) {
    Write-Host "[SUCCESS] Already on target branch: $BranchName" -ForegroundColor Green
} else {
    # Check if branch already exists
    $BranchExists = git branch --list $BranchName

    if ($BranchExists) {
        Write-Host "[WARN] Branch $BranchName already exists locally" -ForegroundColor Yellow
        Write-Host "[INFO] Checking out existing branch..." -ForegroundColor Blue

        try {
            git checkout $BranchName 2>&1 | Out-Null
            if ($LASTEXITCODE -ne 0) {
                Write-Host "[ERROR] Failed to checkout existing branch" -ForegroundColor Red
                exit 1
            }
        } catch {
            Write-Host "[ERROR] Failed to checkout existing branch: $_" -ForegroundColor Red
            exit 1
        }
    } else {
        $null = git checkout -b $BranchName origin/main 2>&1
        if ($LASTEXITCODE -ne 0) {
            Write-Host "[ERROR] Failed to create feature branch" -ForegroundColor Red
            exit 1
        }
        Write-Host "[SUCCESS] Created branch: $BranchName" -ForegroundColor Green
    }
}

# ============================================================
# STEP 14: STAGE FILES
# ============================================================

Write-Host "[INFO] Staging SDLC artifacts and application files..." -ForegroundColor Blue

$FilesToStage = @(
    "requirements.md",
    "architecture.md",
    "design-review.md",
    "impl-plan.md",
    "code-review.md",
    "verification.md",
    "PR.md",
    "CHANGELOG.md",
    "todo-app/",
    "docs/"
)

foreach ($file in $FilesToStage) {
    $filePath = Join-Path $ProjectRoot $file
    if (Test-Path $filePath) {
        $prevErrorAction = $ErrorActionPreference
        $ErrorActionPreference = 'Continue'
        git add $file 2>&1 | Out-Null
        $ErrorActionPreference = $prevErrorAction
        if ($LASTEXITCODE -eq 0) {
            Write-Host "[SUCCESS] Staged: $file" -ForegroundColor Green
        }
    }
}

# Check if there are changes to commit
$StatusOutput = git status --porcelain

if (-not $StatusOutput) {
    Write-Host "[INFO] No changes to commit (already committed)" -ForegroundColor Cyan
} else {
    # ============================================================
    # STEP 15: CREATE COMMIT
    # ============================================================

    Write-Host "[INFO] Creating commit..." -ForegroundColor Blue

    $CommitMessage = @'
feat: implement todo application through agentic SDLC

Implemented Todo application with Add, Edit, and Delete functionality
following the complete Agentic SDLC process.

All HITL gates approved and verification passed.

Co-Authored-By: Claude Code <noreply@anthropic.com>
'@

    try {
        git commit -m $CommitMessage 2>&1 | Out-Null
        if ($LASTEXITCODE -ne 0) {
            Write-Host "[ERROR] Failed to create commit" -ForegroundColor Red
            exit 1
        }
        Write-Host "[SUCCESS] Commit created" -ForegroundColor Green
    } catch {
        Write-Host "[ERROR] Failed to create commit: $_" -ForegroundColor Red
        exit 1
    }
}

# ============================================================
# STEP 16: PUSH TO ORIGIN
# ============================================================

Write-Host "[INFO] Pushing branch to origin..." -ForegroundColor Blue

try {
    $prevErrorAction = $ErrorActionPreference
    $ErrorActionPreference = 'Continue'
    git push -u origin $BranchName 2>&1 | Out-Null
    $ErrorActionPreference = $prevErrorAction
    if ($LASTEXITCODE -ne 0) {
        Write-Host "[ERROR] Failed to push branch" -ForegroundColor Red
        exit 1
    }
    Write-Host "[SUCCESS] Pushed branch: $BranchName" -ForegroundColor Green
} catch {
    Write-Host "[ERROR] Failed to push branch: $_" -ForegroundColor Red
    exit 1
}

# ============================================================
# STEP 17: CREATE PULL REQUEST
# ============================================================

Write-Host "[INFO] Creating GitHub Pull Request..." -ForegroundColor Blue

$PRBodyPath = Join-Path $ProjectRoot "PR.md"
$PRTitle = "feat: implement todo application through agentic SDLC"

try {
    $PROutput = gh pr create --title $PRTitle --body-file $PRBodyPath --base main --head $BranchName 2>&1

    if ($LASTEXITCODE -ne 0) {
        Write-Host "[ERROR] Failed to create PR" -ForegroundColor Red
        exit 1
    }

    Write-Host "[SUCCESS] Pull Request created successfully!" -ForegroundColor Green
    Write-Host "" -ForegroundColor Green
    Write-Host "PR URL: $PROutput" -ForegroundColor Green
    Write-Host "" -ForegroundColor Green

} catch {
    Write-Host "[ERROR] Failed to create PR: $_" -ForegroundColor Red
    exit 1
}

# ============================================================
# STEP 18: CLEANUP
# ============================================================

# Return to original branch/state
Pop-Location

Write-Host "==========================================" -ForegroundColor Green
Write-Host "PR automation completed successfully!" -ForegroundColor Green
Write-Host "==========================================" -ForegroundColor Green

exit 0
