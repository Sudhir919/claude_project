---
name: design-review
description: Execute the Design Review phase of the Agentic SDLC
agent: design-review
---

# Design Review Phase Skill

## Purpose

Validate that the proposed architecture satisfies all approved functional requirements, adheres to simplicity principles, and is implementable and testable.

## Inputs

- **requirements.md**: The approved functional requirements (FR-001, FR-002, FR-003)
- **architecture.md**: The proposed architecture to be reviewed
- **CLAUDE.md**: Project SDLC rules, scope constraints, and simplicity principles

## Process

1. Read requirements.md and architecture.md
2. Verify requirement coverage (all FRs addressed)
3. Check requirement-to-component traceability
4. Assess architectural complexity
5. Verify scope adherence (no scope creep)
6. Check completeness (no missing requirements)
7. Assess testability
8. Identify risks and concerns
9. Make approval decision
10. Generate design-review.md

## Outputs

- **design-review.md**: The design review report containing:
  - Review summary
  - Requirement coverage analysis
  - Traceability verification results
  - Complexity assessment
  - Scope verification
  - Testability assessment
  - Risk identification
  - Approval decision with rationale

## Review Criteria

### 1. Requirement Coverage
**Check:** Does the architecture address all functional requirements?

- FR-001 (Add Todo) must be fully addressed
- FR-002 (Edit Todo) must be fully addressed
- FR-003 (Delete Todo) must be fully addressed

**Pass:** All requirements have corresponding architectural components  
**Fail:** One or more requirements are missing or partially addressed

### 2. Traceability
**Check:** Is the requirement-to-component mapping complete and correct?

- Each FR must map to specific components
- The mapping must be accurate and verifiable
- The traceability table must be complete

**Pass:** Complete and accurate traceability  
**Fail:** Missing mappings or incorrect traceability

### 3. Complexity Assessment
**Check:** Is the architecture unnecessarily complex?

Look for over-engineering:
- Unnecessary frameworks (React, Angular, Vue, etc.)
- Unnecessary backend services or servers
- Unnecessary databases or persistence layers
- Unnecessary REST APIs or GraphQL
- Unnecessary authentication or authorization
- Unnecessary build tools or bundlers
- Unnecessary state management libraries

**Pass:** Architecture uses minimal necessary components  
**Fail:** Architecture includes unnecessary complexity

### 4. Scope Verification
**Check:** Does the architecture introduce functionality outside approved scope?

Look for scope creep:
- Additional product features (completion status, priorities, due dates, search, filtering, categories)
- Technical features not required (logging, monitoring, analytics, error tracking)
- Infrastructure not required (CI/CD, deployment pipelines, containerization)

**Pass:** Architecture addresses only approved requirements  
**Fail:** Architecture includes out-of-scope functionality

### 5. Completeness
**Check:** Are all design elements clearly defined?

- Component responsibilities are clear
- Data flow is documented
- Technology choices are justified
- All acceptance criteria can be satisfied

**Pass:** Design is complete and unambiguous  
**Fail:** Missing or unclear design elements

### 6. Testability
**Check:** Can the requirements be verified through testing?

For each requirement:
- FR-001: Can we verify that a todo is added to the list?
- FR-002: Can we verify that a todo is edited and displays updated text?
- FR-003: Can we verify that a todo is removed from the list?

**Pass:** All requirements are testable with the proposed design  
**Fail:** Design makes requirements difficult or impossible to test

### 7. Feasibility
**Check:** Can this architecture actually be implemented?

- Technology choices are appropriate
- Component interactions are realistic
- No fundamental technical blockers

**Pass:** Architecture is implementable  
**Fail:** Architecture has fundamental feasibility issues

## Approval Criteria

### APPROVED
All criteria pass:
- ✅ All requirements covered
- ✅ Traceability complete and correct
- ✅ Architecture is appropriately simple
- ✅ No scope creep
- ✅ Design is complete
- ✅ Requirements are testable
- ✅ No blocking feasibility issues

### APPROVED WITH CONCERNS
Most criteria pass but minor non-blocking issues exist:
- Minor ambiguities that can be resolved during implementation
- Small complexity issues that don't fundamentally violate simplicity
- Minor risks that can be mitigated

### NOT APPROVED
One or more blocking issues:
- ❌ One or more requirements not addressed
- ❌ Significant over-engineering detected
- ❌ Scope creep detected
- ❌ Design is not testable
- ❌ Blocking feasibility issues

## Success Criteria

The Design Review phase is complete when:
1. `design-review.md` exists
2. All review criteria have been evaluated
3. Requirement coverage is verified
4. Traceability is checked
5. Complexity is assessed
6. Scope is verified
7. Testability is assessed
8. Risks are identified
9. An approval decision is documented with rationale
