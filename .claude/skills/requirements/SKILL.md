---
name: requirements
description: Execute the Requirements phase of the Agentic SDLC
agent: requirements
---

# Requirements Phase Skill

## Purpose

Extract functional requirements from the approved user story and produce a requirements document with complete traceability.

## Inputs

- **docs/user-story.md**: The Confluence-derived user story with acceptance criteria (source of truth)
- **CLAUDE.md**: Project SDLC rules and approved scope

## Process

1. Read `docs/user-story.md`
2. Identify the user story and all acceptance criteria
3. For each acceptance criterion, create one functional requirement
4. Maintain traceability mapping (AC → FR)
5. Define the approved scope (only features from the user story)
6. Document out-of-scope items
7. Generate `requirements.md`
8. Verify completeness and correctness

## Outputs

- **requirements.md**: The requirements document containing:
  - Scope statement
  - Functional requirements (FR-001, FR-002, FR-003, ...)
  - Acceptance criteria traceability table
  - Out of scope statement

## Validation Rules

### Completeness
- Every acceptance criterion MUST have a corresponding functional requirement
- The traceability table MUST map all ACs to FRs

### Scope Control
- Functional requirements MUST derive directly from acceptance criteria
- Do NOT add features not present in the user story
- Do NOT introduce technical implementation details
- Do NOT add persistence, authentication, or infrastructure concerns

### Traceability
- Each functional requirement MUST reference its source acceptance criterion
- Traceability MUST be bidirectional and verifiable
- The mapping MUST be one-to-one (one AC → one FR)

### Clarity
- Requirements MUST be clear and testable
- Avoid ambiguous terms like "fast", "user-friendly", "scalable"
- Use concrete actions: "add", "edit", "delete"

## Scope Control

For this project, the approved scope is:
1. Add Todo
2. Edit Todo
3. Delete Todo

Any requirement not traceable to AC-1, AC-2, or AC-3 is out of scope and MUST NOT be included.

## Traceability Rules

- **Forward traceability**: AC-1 → FR-001, AC-2 → FR-002, AC-3 → FR-003
- **Backward traceability**: Each FR cites its source AC
- **Verification**: The traceability table proves complete coverage

## Success Criteria

The Requirements phase is complete when:
1. `requirements.md` exists
2. All acceptance criteria are covered by functional requirements
3. Traceability is documented and verified
4. No scope creep has occurred
5. No clarifications are required (or they have been resolved)
