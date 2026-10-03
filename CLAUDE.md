# Todo Agentic SDLC

## Project Objective

Build a simple Todo application while demonstrating a complete
Agentic Software Development Life Cycle using Claude.

The main objective of this project is to demonstrate the SDLC process,
not to build a complex Todo application.

## Todo Application Scope

The Todo application will support only three features:

1. Add a Todo
2. Edit a Todo
3. Delete a Todo

No additional application features should be added unless explicitly
approved through the requirements process.

## SDLC Process

The project will follow these phases:

1. Requirements
2. Architecture
3. Design Review
4. Implementation Planning
5. Implementation
6. Code Review
7. Verification
8. PR Preparation

## Source of Requirements

The initial user story will be retrieved from Confluence.

The Confluence user story is the source of truth for the application
requirements.

Do not invent requirements that are not present in the approved
requirements.

## SDLC Rules

- Requirements must be completed before architecture.
- Architecture must be reviewed before implementation.
- Implementation must follow the approved requirements and architecture.
- Code review must happen before final verification.
- Verification must pass before PR preparation.
- Do not skip SDLC phases.
- Keep the Todo application simple.
- Do not add unnecessary technologies or features.

## Required SDLC Artifacts

The following artifacts should be produced during the SDLC:

- requirements.md
- architecture.md
- design-review.md
- impl-plan.md
- code-review.md
- verification.md
- PR.md
- CHANGELOG.md

## Agentic SDLC

The SDLC orchestrator coordinates the complete workflow.

Specialized agents are responsible for individual SDLC phases.

The orchestrator must maintain the correct phase order and prevent
later phases from starting when required previous artifacts or approvals
are missing.
