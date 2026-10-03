# PR Preparation Phase Prompt

Execute the PR Preparation phase of the Agentic SDLC.

## Task

Create pull request artifacts including PR description and changelog after verification has passed.

## Instructions

1. **Read All Documents**
   - Open `requirements.md` - understand FR-001, FR-002, FR-003
   - Open `architecture.md` - understand the approved architecture
   - Open `design-review.md` - review approval decision
   - Open `impl-plan.md` - review implementation plan
   - Open `code-review.md` - review code review results
   - Open `verification.md` - verify verification completion and result
   - Open `docs/user-story.md` - review acceptance criteria

2. **Read Implementation Files**
   - Open `todo-app/index.html` - review HTML structure
   - Open `todo-app/app.js` - review JavaScript logic
   - Open `todo-app/styles.css` - review CSS styling

3. **Verify Prerequisites**
   - Confirm verification.md exists
   - Confirm verification decision is PASS
   - Confirm all functional requirements passed verification (FR-001, FR-002, FR-003)
   - Confirm all acceptance criteria are satisfied (AC-1, AC-2, AC-3)
   - If verification is not PASS, PR preparation cannot proceed

4. **Create PR Description (PR.md)**
   - Write a clear PR title (under 70 characters)
   - Write a summary section:
     - What was implemented (Todo application with Add, Edit, Delete)
     - Why it was implemented (based on user story)
     - How it was implemented (architecture approach)
   - List functional requirements implemented:
     - FR-001: Add Todo ✅
     - FR-002: Edit Todo ✅
     - FR-003: Delete Todo ✅
   - List acceptance criteria satisfied:
     - AC-1: Add Todo behavior ✅
     - AC-2: Edit Todo behavior ✅
     - AC-3: Delete Todo behavior ✅
   - Describe architecture:
     - Three-file browser-based application
     - Vanilla JavaScript with in-memory storage
     - No frameworks or external dependencies
   - Include verification results:
     - Verification Status: PASS
     - Functional Requirements: 3/3 verified
     - Acceptance Criteria: 3/3 satisfied
     - Architecture: Compliant
     - Scope: Compliant
   - Summarize test evidence:
     - Number of test scenarios verified
     - Edge cases tested
     - Integration tests verified
   - List SDLC artifacts created:
     - requirements.md
     - architecture.md
     - design-review.md
     - impl-plan.md
     - code-review.md
     - verification.md
   - List files changed:
     - todo-app/index.html
     - todo-app/app.js
     - todo-app/styles.css
   - Add attribution per session guidelines

5. **Create Changelog (CHANGELOG.md)**
   - Follow standard changelog format (Keep a Changelog)
   - Assign version number: 1.0.0 (initial release)
   - Include release date (today's date)
   - Organize changes by category:
     - **Added:**
       - Add Todo functionality (FR-001)
       - Edit Todo functionality (FR-002)
       - Delete Todo functionality (FR-003)
       - HTML structure with input field and list container
       - Vanilla JavaScript implementation with in-memory storage
       - Basic CSS styling
     - **Architecture:**
       - Browser-based client-side application
       - Three-file structure (HTML, CSS, JavaScript)
       - No external dependencies or frameworks
     - **Verification:**
       - All functional requirements verified
       - All acceptance criteria satisfied
       - Architecture and scope compliant

6. **SDLC Summary**
   - Summarize the complete Agentic SDLC process:
     - Phase 1: Requirements - Extracted FR-001, FR-002, FR-003 from user story
     - Phase 2: Architecture - Designed three-file vanilla JavaScript architecture
     - Phase 3: Design Review - Approved architecture with 0 issues
     - Phase 4: Implementation Planning - Created 10-task implementation plan
     - Phase 5: Implementation - Built Todo application per plan
     - Phase 6: Code Review - Approved with 0 defects
     - Phase 7: Verification - PASS with 54+ verification points
     - Phase 8: PR Preparation - Created PR and changelog
   - Confirm traceability chain:
     - User Story (Confluence) → AC-1, AC-2, AC-3
     - AC-1 → FR-001 → Implementation → Verification
     - AC-2 → FR-002 → Implementation → Verification
     - AC-3 → FR-003 → Implementation → Verification

7. **Generate Output**
   - Create `PR.md` with complete PR description
   - Create `CHANGELOG.md` with versioned changelog

8. **Stop**
   - Do NOT modify implementation code
   - Do NOT modify SDLC documents
   - Do NOT create git commits
   - Do NOT push code
   - Report PR preparation completion status
