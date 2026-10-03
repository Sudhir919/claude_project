---
name: architecture
description: Execute the Architecture phase of the Agentic SDLC
agent: architecture
---

# Architecture Phase Skill

## Purpose

Design a simple, minimal architecture that satisfies all approved functional requirements while avoiding unnecessary complexity.

## Inputs

- **requirements.md**: The approved functional requirements (source of truth)
- **CLAUDE.md**: Project SDLC rules and scope constraints

## Process

1. Read `requirements.md`
2. Understand all functional requirements (FR-001, FR-002, FR-003)
3. Identify minimum required components
4. Define component responsibilities
5. Define data flow between components
6. Select simple, appropriate technologies
7. Maintain traceability from requirements to components
8. Generate `architecture.md`
9. Verify completeness and simplicity

## Outputs

- **architecture.md**: The architecture document containing:
  - Architecture overview
  - Component descriptions and responsibilities
  - Data flow diagrams or descriptions
  - Technology stack with justifications
  - Requirements traceability table

## Architecture Rules

### Minimalism
- Use the minimum number of components necessary
- Each component must have a clear, single responsibility
- Avoid components that don't directly support a functional requirement

### Technology Selection
- Prefer standard web technologies (HTML, CSS, JavaScript)
- Choose simple over complex
- Justify every technology choice
- Avoid frameworks unless necessary for the scope

### Simplicity Enforcement
- Default to browser-based, client-side solutions
- Do NOT add backend services unless required by requirements
- Do NOT add databases unless required by requirements
- Do NOT add REST APIs unless required by requirements
- Do NOT add authentication unless required by requirements
- Do NOT add logging, monitoring, or observability unless required
- Do NOT design for hypothetical future requirements

### Scope Control
- Design only for approved functional requirements
- Do NOT add architectural components for features not in requirements.md
- Do NOT add technical capabilities beyond what's needed

## Requirement Traceability

Each functional requirement MUST map to one or more architectural components:

- **FR-001 (Add Todo)** → Components that enable adding todos
- **FR-002 (Edit Todo)** → Components that enable editing todos
- **FR-003 (Delete Todo)** → Components that enable deleting todos

The traceability table must demonstrate complete coverage.

## Validation Criteria

### Completeness
- All functional requirements are addressed by the architecture
- Each requirement maps to specific components
- The traceability table is complete

### Simplicity
- No unnecessary components
- No over-engineered solutions
- No speculative features or infrastructure

### Feasibility
- The architecture can actually be implemented
- Technology choices are appropriate for the scope
- Component interactions are clearly defined

### Consistency
- Architecture aligns with the approved scope (Add, Edit, Delete only)
- No new product features introduced
- Design matches the simplicity intent from CLAUDE.md

## Success Criteria

The Architecture phase is complete when:
1. `architecture.md` exists
2. All functional requirements are mapped to components
3. Component responsibilities are clearly defined
4. Data flow is documented
5. Technology choices are justified
6. Traceability is complete and verified
7. Architecture is intentionally simple (no unnecessary complexity)
8. No scope creep has occurred
