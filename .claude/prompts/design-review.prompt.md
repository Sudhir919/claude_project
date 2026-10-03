# Design Review Phase Prompt

Execute the Design Review phase of the Agentic SDLC.

## Task

Review the proposed architecture against the approved requirements to verify completeness, correctness, simplicity, and testability.

## Instructions

1. **Read Inputs**
   - Open `requirements.md` and review all functional requirements
   - Open `architecture.md` and review the proposed architecture
   - Understand the approved scope: Add Todo, Edit Todo, Delete Todo

2. **Verify Requirement Coverage**
   - For each functional requirement (FR-001, FR-002, FR-003):
     - Verify it is addressed by the architecture
     - Identify which components satisfy the requirement
     - Check that the solution is complete and feasible

3. **Check Traceability**
   - Verify the traceability table in architecture.md is complete
   - Confirm all requirements map to specific components
   - Ensure the mapping is accurate and specific

4. **Assess Complexity**
   - Evaluate whether the architecture is unnecessarily complex
   - Check for over-engineering:
     - Unnecessary frameworks (React, Angular, Vue)
     - Unnecessary backend services or APIs
     - Unnecessary databases or persistence layers
     - Unnecessary authentication or authorization
     - Unnecessary infrastructure or tooling
   - Verify adherence to CLAUDE.md simplicity principles

5. **Verify Scope**
   - Check that architecture addresses ONLY the approved requirements
   - Look for scope creep:
     - Additional product features (completion status, search, filtering)
     - Technical features not required (logging, monitoring, analytics)
   - Confirm design constraints are respected

6. **Check Completeness**
   - Identify any missing requirements
   - Verify all acceptance criteria can be satisfied
   - Check that component responsibilities are clearly defined
   - Ensure data flow is documented

7. **Assess Testability**
   - Evaluate whether each requirement can be tested
   - Verify that the design allows for verification of:
     - FR-001: Can we test that todos are added?
     - FR-002: Can we test that todos are edited?
     - FR-003: Can we test that todos are deleted?
   - Identify any design decisions that complicate testing

8. **Identify Risks**
   - Technical risks or implementation challenges
   - Ambiguities in the architecture
   - Unclear design decisions
   - Feasibility concerns

9. **Make Approval Decision**
   - APPROVED: If all checks pass and no blocking issues found
   - APPROVED WITH CONCERNS: If minor issues exist but don't block implementation
   - NOT APPROVED: If blocking issues found (missing requirements, scope creep, not testable)

10. **Generate Output**
    - Create `design-review.md` with:
      1. Review Summary
      2. Requirement Coverage Analysis
      3. Traceability Verification
      4. Complexity Assessment
      5. Scope Verification
      6. Testability Assessment
      7. Risk Identification
      8. Approval Decision

11. **Stop**
    - Do NOT modify requirements.md or architecture.md
    - Do NOT write implementation code
    - Do NOT proceed to Implementation Planning
    - Report review completion status
