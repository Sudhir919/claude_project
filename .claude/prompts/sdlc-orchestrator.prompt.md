# SDLC Orchestrator Prompt

Execute the complete Agentic Software Development Life Cycle for the Todo Application.

## Objective

Coordinate the execution of all SDLC phases using specialized agents in the correct order, enforcing Human-in-the-Loop gates, and ensuring traceability from user story to pull request.

## Source of Truth

The approved user story is located at: `docs/user-story.md`

This was retrieved from the Confluence page: **Todo Application - User Story**

**User Story:**
"As a user, I want to manage my todo items so that I can keep track of the tasks I need to complete."

**Acceptance Criteria:**
- AC-1: Add Todo - Given the application is open, when the user enters a todo and selects Add, then the item is added to the todo list.
- AC-2: Edit Todo - Given a todo exists, when the user selects Edit and updates it, then the todo displays the updated text.
- AC-3: Delete Todo - Given a todo exists, when the user selects Delete, then the todo is removed.

**Do NOT invent requirements beyond what is documented in the user story.**

## SDLC Phase Sequence

Execute phases in this exact order. Do NOT skip phases.

### 1. Requirements Phase

**Agent:** requirements  
**Input:** docs/user-story.md  
**Output:** requirements.md  

Extract functional requirements from the user story. Map acceptance criteria to functional requirements:
- AC-1 → FR-001 (Add Todo)
- AC-2 → FR-002 (Edit Todo)
- AC-3 → FR-003 (Delete Todo)

### 2. HITL Gate #1: Requirements Approval

**STOP after requirements.md is created.**

Report to the human:

"Requirements phase is complete. Please review requirements.md and explicitly approve Gate #1 before Architecture begins."

**Wait for explicit approval. Do NOT assume approval. Do NOT proceed automatically.**

### 3. Architecture Phase

**Agent:** architecture  
**Input:** requirements.md  
**Output:** architecture.md  

Design the system architecture based on approved requirements. Keep it simple - no databases, no backends, no complex frameworks.

### 4. Design Review Phase

**Agent:** design-review  
**Input:** requirements.md, architecture.md  
**Output:** design-review.md  

Validate that the architecture satisfies all requirements. Check for scope creep.

### 5. HITL Gate #2: Architecture & Design Approval

**STOP after architecture.md and design-review.md are created.**

Report to the human:

"Architecture and Design Review are complete. Please review the artifacts and explicitly approve Gate #2 before Implementation Planning begins."

**Wait for explicit approval. Do NOT proceed automatically.**

### 6. Implementation Planning Phase

**Agent:** implementation-planning  
**Input:** requirements.md, architecture.md, design-review.md  
**Output:** impl-plan.md  

Create a dependency-ordered task list for implementation. Break down the work into discrete steps.

### 7. Implementation Phase

**Agent:** implementation  
**Input:** requirements.md, architecture.md, design-review.md, impl-plan.md  
**Output:** todo-app/  

Build the Todo application according to approved architecture and plan. Implement only the three required features:
- Add Todo
- Edit Todo
- Delete Todo

### 8. Code Review Phase

**Agent:** code-review  
**Input:** requirements.md, architecture.md, impl-plan.md, todo-app/  
**Output:** code-review.md  

Review the implementation for:
- Compliance with requirements
- Compliance with architecture
- Code quality
- Security issues
- Scope adherence

### 9. Verification Phase

**Agent:** verification  
**Input:** requirements.md, architecture.md, impl-plan.md, todo-app/, code-review.md  
**Output:** verification.md  

Validate that the application meets all acceptance criteria:
- AC-1: Add Todo functionality works
- AC-2: Edit Todo functionality works
- AC-3: Delete Todo functionality works

The verification must PASS before proceeding.

### 10. HITL Gate #3: Verification Approval

**STOP after verification.md shows PASS status.**

Report to the human:

"Verification passed. Please explicitly approve Gate #3 before PR Preparation."

**Wait for explicit approval. Do NOT proceed automatically.**

### 11. PR Preparation Phase

**Agent:** pr-preparation  
**Input:** requirements.md, architecture.md, design-review.md, impl-plan.md, code-review.md, verification.md, todo-app/  
**Output:** PR.md, CHANGELOG.md  

Create pull request artifacts summarizing:
- Changes made
- Requirements satisfied
- Acceptance criteria met
- Testing performed
- Traceability map

### 12. PR Authorization

After PR.md and CHANGELOG.md are created, verify ALL conditions:

1. ✓ verification.md exists and contains "PASS"
2. ✓ code-review.md exists and contains "APPROVED"
3. ✓ HITL Gate #3 was explicitly approved by human
4. ✓ PR.md exists
5. ✓ CHANGELOG.md exists

Once ALL conditions are verified, create the authorization file:

**Write `.claude/pr-authorized.json`:**

```json
{
  "authorized": true,
  "verification": "PASS",
  "code_review": "APPROVED",
  "hitl_gate_3": "APPROVED",
  "pr_preparation": "COMPLETE"
}
```

Then report to the human:

"PR authorization file created. All SDLC phases complete. The Claude Code stop hook will automatically create the GitHub pull request when this session ends."

**CRITICAL: Do NOT create `.claude/pr-authorized.json` unless:**
- Verification explicitly shows PASS
- Code Review explicitly shows APPROVED
- Human explicitly approved HITL Gate #3
- PR Preparation is complete

**Do NOT create the GitHub PR yourself.**

The Claude Code stop hook (`.claude/hooks/create-pr.ps1`) will automatically handle:
- Validation
- Feature branch creation
- Git commit
- Git push
- `gh pr create`

## Phase Agent Responsibilities

| Agent | Responsibility |
|-------|---------------|
| requirements | Extract functional requirements from user story |
| architecture | Design system architecture from requirements |
| design-review | Validate architecture against requirements |
| implementation-planning | Create dependency-ordered implementation tasks |
| implementation | Build the approved Todo application |
| code-review | Review implementation for compliance and quality |
| verification | Validate application meets acceptance criteria |
| pr-preparation | Create PR description and changelog |

## Artifact Expectations

Verify each artifact exists and is complete before proceeding:

- requirements.md - Functional requirements mapped to ACs
- architecture.md - System design and component structure
- design-review.md - Architecture validation report
- impl-plan.md - Ordered implementation tasks
- todo-app/ - Implemented application code
- code-review.md - Code review findings and approval
- verification.md - Test results with PASS/FAIL status
- PR.md - Pull request description
- CHANGELOG.md - Summary of changes

## Failure Handling

If an agent fails or an artifact is missing:

1. STOP immediately
2. Report:
   - Current phase
   - Agent that failed
   - Expected artifact
   - Failure reason
3. Do NOT continue to subsequent phases
4. Wait for issue resolution

## Scope Restrictions

**Keep the Todo application simple.**

**DO NOT:**
- Add features beyond Add/Edit/Delete Todo
- Create databases or backends
- Add authentication or user management
- Implement localStorage or persistence
- Create React components (use vanilla JS/HTML/CSS)
- Add unnecessary dependencies or frameworks
- Create CI/CD pipelines yet
- Create GitHub Actions yet
- Execute `gh pr create` directly
- Execute `git push` for PR automation
- Skip SDLC phases
- Approve HITL gates automatically
- Invent requirements not in docs/user-story.md
- Create custom state management systems

## Traceability Chain

Maintain this traceability throughout:

```
Confluence: Todo Application User Story
    ↓
docs/user-story.md
    ↓
AC-1 (Add Todo) → FR-001 → Implementation → Verification
AC-2 (Edit Todo) → FR-002 → Implementation → Verification
AC-3 (Delete Todo) → FR-003 → Implementation → Verification
    ↓
GitHub PR (via hook)
```

Every requirement must trace back to an acceptance criterion.
Every implementation must trace to a requirement.
Every verification must validate an acceptance criterion.

## Human-in-the-Loop Gates

Three gates require explicit human approval:

1. **Gate #1** - After Requirements (before Architecture)
2. **Gate #2** - After Architecture & Design Review (before Implementation Planning)
3. **Gate #3** - After Verification (before PR Preparation)

**Never proceed past a gate without explicit human approval.**

Approval phrases like "approved", "proceed", "continue", "looks good", or "go ahead" indicate human approval.

## Status Reporting

Provide clear status updates as you progress:

- State the current phase
- Indicate status (IN PROGRESS, COMPLETE, BLOCKED, WAITING)
- If blocked, explain why
- If waiting, explain what approval is needed

Keep status updates simple and concise.

## Final Notes

- This is a demonstration of Agentic SDLC, not a complex application project
- The Todo app scope is intentionally minimal
- Focus on SDLC process correctness, not application complexity
- Preserve traceability at every step
- Enforce gates rigorously
- Use the specialized agents - do not implement phases yourself
- The GitHub PR creation will be handled by a future Claude Code hook after final authorization
