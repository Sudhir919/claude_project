---
name: sdlc-orchestrator
description: Coordinate the complete Agentic SDLC workflow using specialized agents
---

# SDLC Orchestrator Skill

## Purpose

Coordinate the complete Software Development Life Cycle for the Todo Application using specialized agents, enforcing phase order and Human-in-the-Loop gates.

## When to Use

Use this skill to execute the complete SDLC from requirements through PR preparation.

## How It Works

### Phase Determination

To determine the current phase, check which artifacts exist:

1. Check for `requirements.md` - if missing, start with Requirements
2. Check for `architecture.md` - if missing after Gate #1, run Architecture
3. Check for `design-review.md` - if missing, run Design Review
4. Check for `impl-plan.md` - if missing after Gate #2, run Implementation Planning
5. Check for `todo-app/` implementation - if missing, run Implementation
6. Check for `code-review.md` - if missing, run Code Review
7. Check for `verification.md` - if missing, run Verification
8. Check for `PR.md` and `CHANGELOG.md` - if missing after Gate #3, run PR Preparation

### Agent Invocation

Invoke agents using the Agent tool with the appropriate subagent type:

**Example:**
```
Agent({
  subagent_type: "requirements",
  description: "Extract requirements from user story",
  prompt: "Execute the Requirements phase. Read docs/user-story.md and produce requirements.md."
})
```

### Required Inputs Per Phase

**Requirements:**
- Input: docs/user-story.md
- Agent: requirements
- Output: requirements.md

**Architecture:**
- Input: requirements.md
- Agent: architecture
- Output: architecture.md

**Design Review:**
- Input: requirements.md, architecture.md
- Agent: design-review
- Output: design-review.md

**Implementation Planning:**
- Input: requirements.md, architecture.md, design-review.md
- Agent: implementation-planning
- Output: impl-plan.md

**Implementation:**
- Input: requirements.md, architecture.md, design-review.md, impl-plan.md
- Agent: implementation
- Output: todo-app/

**Code Review:**
- Input: requirements.md, architecture.md, impl-plan.md, todo-app/
- Agent: code-review
- Output: code-review.md

**Verification:**
- Input: requirements.md, architecture.md, impl-plan.md, todo-app/, code-review.md
- Agent: verification
- Output: verification.md

**PR Preparation:**
- Input: requirements.md, architecture.md, design-review.md, impl-plan.md, code-review.md, verification.md, todo-app/
- Agent: pr-preparation
- Output: PR.md, CHANGELOG.md

### Artifact Verification

Before moving to the next phase, verify the artifact exists:

**Example:**
```bash
if [ -f "requirements.md" ]; then
  echo "requirements.md exists - proceed to Gate #1"
else
  echo "ERROR: requirements.md missing - Requirements phase failed"
fi
```

### Gate Enforcement

**Gate #1: After Requirements**

1. Verify requirements.md exists
2. Report to human: "Requirements phase is complete. Please review requirements.md and explicitly approve Gate #1 before Architecture begins."
3. STOP and wait for explicit approval
4. Do NOT proceed until approval received

**Gate #2: After Architecture & Design Review**

1. Verify architecture.md exists
2. Verify design-review.md exists
3. Report to human: "Architecture and Design Review are complete. Please review the artifacts and explicitly approve Gate #2 before Implementation Planning begins."
4. STOP and wait for explicit approval
5. Do NOT proceed until approval received

**Gate #3: After Verification**

1. Verify verification.md exists
2. Verify verification status is PASS
3. Report to human: "Verification passed. Please explicitly approve Gate #3 before PR Preparation."
4. STOP and wait for explicit approval
5. Do NOT proceed until approval received

### Failure Handling

If an agent fails:

1. Identify the phase that failed
2. Identify the agent that was running
3. Identify the expected artifact that is missing
4. Report the failure clearly
5. STOP - do NOT continue to later phases

**Example failure report:**
```
Phase: Architecture
Agent: architecture
Expected Artifact: architecture.md
Failure Reason: Agent completed but artifact was not created
Status: FAILED

Please resolve the issue before continuing.
```

### Status Reporting

Provide clear status updates:

**During execution:**
```
Current Phase: Implementation
Status: IN PROGRESS
Agent: implementation
Expected Output: todo-app/
```

**When blocked:**
```
Current Phase: Architecture
Status: BLOCKED
Reason: Waiting for HITL Gate #1 approval
Required Action: Human must explicitly approve Gate #1
```

**When complete:**
```
Current Phase: PR Preparation
Status: COMPLETE
Artifacts: PR.md, CHANGELOG.md
Next: Await PR authorization
```

### Traceability Preservation

Track the requirements mapping:

- AC-1 (Add Todo) → FR-001 → Add Todo implementation
- AC-2 (Edit Todo) → FR-002 → Edit Todo implementation
- AC-3 (Delete Todo) → FR-003 → Delete Todo implementation

Ensure each phase references the correct requirements and traces back to acceptance criteria.

### Scope Enforcement

Actively prevent scope creep:

**Allowed:**
- Add Todo functionality
- Edit Todo functionality
- Delete Todo functionality
- Simple HTML/CSS/JS implementation

**NOT Allowed:**
- Database integration
- Backend services
- Authentication
- User management
- localStorage
- Complex frameworks
- Additional Todo features (priority, due dates, categories, etc.)

If an agent produces output that exceeds scope, flag it and request revision.

### PR Preparation Boundary

After PR Preparation completes successfully:

1. Verify PR.md exists
2. Verify CHANGELOG.md exists
3. Verify verification.md contains "PASS"
4. Verify code-review.md contains "APPROVED"
5. Verify HITL Gate #3 was explicitly approved
6. Verify all prior artifacts exist

**Create PR Authorization File:**

Write `.claude/pr-authorized.json`:

```json
{
  "authorized": true,
  "verification": "PASS",
  "code_review": "APPROVED",
  "hitl_gate_3": "APPROVED",
  "pr_preparation": "COMPLETE"
}
```

**CRITICAL CONDITIONS for creating this file:**
- ✓ verification.md exists AND contains "PASS"
- ✓ code-review.md exists AND contains "APPROVED"
- ✓ Human explicitly approved HITL Gate #3 (not automatic)
- ✓ PR.md exists
- ✓ CHANGELOG.md exists

**Do NOT create this file if ANY condition is missing.**

After creating the authorization file, report:

"PR authorization file created. The Claude Code stop hook will automatically create the GitHub PR when this session ends."

**Do NOT execute yourself:**
- `gh pr create`
- `git push` for PR automation
- Feature branch creation for PR
- Automatic merge

The Claude Code stop hook (`.claude/hooks/create-pr.ps1`) will automatically handle PR creation.

### Recovery from Interruption

If the orchestration is interrupted:

1. Check which artifacts exist
2. Determine the last completed phase
3. Check if the current phase is blocked on a gate
4. Resume from the appropriate point
5. Do NOT re-execute completed phases unless explicitly requested

### Simple State Tracking

Track state using only the artifacts themselves:

- If artifact exists → phase is complete
- If artifact is missing → phase is not started or failed
- If waiting on gate → human approval needed

Do NOT create:
- state.json files
- State management frameworks
- Custom tracking systems
- Database state stores

The artifacts themselves ARE the state.

## Common Patterns

### Starting Fresh

1. Check for existing artifacts
2. If none exist, start with Requirements phase
3. Invoke requirements agent
4. Verify requirements.md created
5. Stop at Gate #1

### Resuming After Gate Approval

1. Human says "approved" or "proceed"
2. Check which gate was just approved
3. Move to the next phase
4. Invoke the appropriate agent
5. Verify artifact creation
6. Continue until next gate or completion

### Handling Failures

1. Agent completes but artifact is missing
2. Report failure immediately
3. Do NOT proceed to next phase
4. Wait for human to resolve issue
5. Resume when instructed

## Tips

- Always verify artifacts before proceeding
- Never skip phases
- Never auto-approve gates
- Keep status updates clear and concise
- Use existing agents - don't implement phases yourself
- Preserve traceability at every step
- Enforce scope rigorously
- Stop at gates and wait for explicit approval

## What This Skill Does NOT Cover

- Implementing application features
- Creating GitHub PRs directly
- Git push automation
- Hook implementation
- CI/CD configuration
- State management systems
- Custom SDLC frameworks
