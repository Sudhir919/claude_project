---
name: pr-preparation
description: Execute the PR Preparation phase of the Agentic SDLC
agent: pr-preparation
---

# PR Preparation Phase Skill

## Purpose

Create pull request artifacts including PR description and changelog after verification has passed, completing the Agentic SDLC process.

## Inputs

- **requirements.md**: The approved functional requirements (FR-001, FR-002, FR-003)
- **architecture.md**: The approved architecture specification
- **design-review.md**: The design review with approval decision
- **impl-plan.md**: The implementation plan
- **code-review.md**: The code review report with decision
- **verification.md**: The verification report with PASS/FAIL decision
- **docs/user-story.md**: The user story with acceptance criteria (AC-1, AC-2, AC-3)
- **todo-app/index.html**: The implemented HTML file
- **todo-app/app.js**: The implemented JavaScript file
- **todo-app/styles.css**: The implemented CSS file

## Process

1. Read all approved SDLC documents
2. Read all implementation files
3. Verify verification status (must be PASS)
4. Create PR description (PR.md)
5. Create changelog (CHANGELOG.md)
6. Summarize complete SDLC process

## Outputs

- **PR.md**: The pull request description containing:
  - PR title
  - Summary of implementation
  - Functional requirements implemented
  - Acceptance criteria satisfied
  - Architecture description
  - Verification results
  - Test plan summary
  - SDLC artifacts list
  - Files changed
  - Attribution
  
- **CHANGELOG.md**: The changelog containing:
  - Version number (1.0.0 for initial release)
  - Release date
  - Added features with FR references
  - Architecture decisions
  - Verification results

## Prerequisites

The following conditions must be true before PR Preparation can proceed:

- ✅ verification.md exists
- ✅ Verification decision is PASS
- ✅ All functional requirements passed verification (FR-001, FR-002, FR-003)
- ✅ All acceptance criteria are satisfied (AC-1, AC-2, AC-3)
- ✅ Architecture is compliant
- ✅ Scope is compliant

If any prerequisite is not met, PR preparation cannot proceed.

## PR Description Components

### 1. PR Title
- Clear and concise (under 70 characters)
- Describes the feature being added
- Example: "Add Todo Application with Add, Edit, Delete features"

### 2. Summary
- 1-3 paragraphs describing:
  - What was implemented
  - Why it was implemented (user story context)
  - How it was implemented (architecture approach)

### 3. Functional Requirements Implemented
List all functional requirements with checkmarks:
- FR-001: Add Todo ✅
- FR-002: Edit Todo ✅
- FR-003: Delete Todo ✅

### 4. Acceptance Criteria Satisfied
List all acceptance criteria with checkmarks:
- AC-1: Add Todo behavior ✅
- AC-2: Edit Todo behavior ✅
- AC-3: Delete Todo behavior ✅

### 5. Architecture
Brief description of:
- Three-file browser-based application
- Vanilla JavaScript implementation
- In-memory storage
- No frameworks or external dependencies

### 6. Verification Results
Summary of verification status:
- Verification Status: PASS
- Functional Requirements: 3/3 verified
- Acceptance Criteria: 3/3 satisfied
- Architecture: Compliant
- Scope: Compliant
- Verification Points: 54+ all passing

### 7. Test Plan Summary
Brief summary of:
- Number of test scenarios verified
- Edge cases tested
- Integration tests verified
- End-to-end scenarios validated

### 8. SDLC Artifacts
List all artifacts created during the SDLC:
- requirements.md
- architecture.md
- design-review.md
- impl-plan.md
- code-review.md
- verification.md

### 9. Files Changed
List all implementation files:
- todo-app/index.html
- todo-app/app.js
- todo-app/styles.css

### 10. Attribution
Include attribution per session guidelines:
```
🤖 Generated with [Claude Code](https://claude.com/claude-code)
```

## Changelog Components

### Format
Follow [Keep a Changelog](https://keepachangelog.com/en/1.0.0/) format with [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

### Version Number
- Use 1.0.0 for initial release
- Follow semantic versioning (MAJOR.MINOR.PATCH)

### Release Date
- Use today's date in YYYY-MM-DD format

### Categories

#### Added
List all new features with FR references:
- Add Todo functionality (FR-001)
- Edit Todo functionality (FR-002)
- Delete Todo functionality (FR-003)
- HTML structure with input field, button, and list container
- Vanilla JavaScript implementation with in-memory storage
- Basic CSS styling for clean UI
- Enter key support for adding todos
- Unique ID generation for todos
- Input validation (empty input handling)

#### Architecture
Document architecture decisions:
- Browser-based client-side application
- Three-file structure (index.html, styles.css, app.js)
- Vanilla JavaScript with no frameworks or libraries
- In-memory storage (data does not persist on refresh)
- No external dependencies

#### Verification
Document verification results:
- All functional requirements verified (FR-001, FR-002, FR-003)
- All acceptance criteria satisfied (AC-1, AC-2, AC-3)
- Architecture compliant (3 files, vanilla JS, in-memory)
- Scope compliant (no persistence, no frameworks, no out-of-scope features)
- 54+ verification points all passing
- 15+ test scenarios verified
- 7+ edge cases tested
- 5+ integration tests verified

## SDLC Process Summary

Document the complete Agentic SDLC process:

### Phase 1: Requirements
- Retrieved user story from Confluence
- Extracted functional requirements (FR-001, FR-002, FR-003)
- Mapped acceptance criteria (AC-1, AC-2, AC-3)
- Created requirements.md with traceability

### Phase 2: Architecture
- Designed three-file browser-based architecture
- Specified vanilla JavaScript with in-memory storage
- Prohibited frameworks, persistence, and out-of-scope features
- Created architecture.md

### Phase 3: Design Review
- Reviewed architecture against requirements
- Verified no scope creep
- Decision: APPROVED
- Created design-review.md

### Phase 4: Implementation Planning
- Created 10-task implementation plan
- Ordered tasks by dependencies
- Mapped tasks to functional requirements
- Created impl-plan.md

### Phase 5: Implementation
- Built HTML structure with input, button, list
- Implemented JavaScript functions (addTodo, editTodo, deleteTodo, renderTodos)
- Created CSS styling
- Created todo-app/index.html, app.js, styles.css

### Phase 6: Code Review
- Reviewed implementation against requirements and architecture
- Verified all functional requirements present
- Verified scope compliance
- Decision: APPROVED (0 defects)
- Created code-review.md

### Phase 7: Verification
- Independently verified all functional requirements with evidence
- Verified all acceptance criteria with evidence
- Verified architecture and scope compliance
- Decision: PASS (54+ verification points)
- Created verification.md

### Phase 8: PR Preparation
- Created PR description with complete summary
- Created changelog with versioned changes
- Documented complete SDLC process
- Created PR.md and CHANGELOG.md

## Traceability Chain

Document complete traceability:

**User Story → Requirements → Implementation → Verification:**

1. **AC-1 (Confluence)** → FR-001 (requirements.md) → addTodo() (app.js) → Verified PASS (verification.md)
2. **AC-2 (Confluence)** → FR-002 (requirements.md) → editTodo() (app.js) → Verified PASS (verification.md)
3. **AC-3 (Confluence)** → FR-003 (requirements.md) → deleteTodo() (app.js) → Verified PASS (verification.md)

All requirements trace from user story to verified implementation with documented evidence.

## Success Criteria

The PR Preparation phase is complete when:

1. `PR.md` exists
2. PR title is clear and concise
3. PR summary describes what, why, and how
4. All functional requirements are listed
5. All acceptance criteria are listed
6. Architecture is described
7. Verification results are included
8. Test plan summary is included
9. SDLC artifacts are listed
10. Files changed are listed
11. Attribution is included
12. `CHANGELOG.md` exists
13. Version number is assigned (1.0.0)
14. Release date is included
15. Changes are categorized (Added, Architecture, Verification)
16. References to functional requirements are included
17. SDLC process is summarized
18. Traceability is confirmed

## Constraints

- Do NOT modify requirements.md
- Do NOT modify architecture.md
- Do NOT modify design-review.md
- Do NOT modify impl-plan.md
- Do NOT modify code-review.md
- Do NOT modify verification.md
- Do NOT modify implementation files (index.html, app.js, styles.css)
- Do NOT add new requirements or features
- Do NOT create git commits or push code
- STOP after PR.md and CHANGELOG.md are complete
