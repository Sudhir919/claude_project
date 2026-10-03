# Verification Phase Prompt

Execute the Verification phase of the Agentic SDLC.

## Task

Independently verify that the implemented Todo application satisfies all functional requirements, acceptance criteria, and complies with the approved architecture and scope after code review approval.

## Instructions

1. **Read All Documents**
   - Open `requirements.md` - understand FR-001, FR-002, FR-003
   - Open `architecture.md` - understand the approved architecture
   - Open `design-review.md` - review approval decision
   - Open `impl-plan.md` - review implementation plan
   - Open `code-review.md` - verify code review completion and decision
   - Open `docs/user-story.md` - review acceptance criteria

2. **Read Implementation Files**
   - Open `todo-app/index.html` - review HTML structure
   - Open `todo-app/app.js` - review JavaScript logic
   - Open `todo-app/styles.css` - review CSS styling

3. **Verify Code Review Status**
   - Confirm code-review.md exists
   - Confirm code review decision is APPROVED
   - Confirm no unresolved critical or major defects
   - If code review is not APPROVED, verification cannot proceed (FAIL)

4. **Verify FR-001: Add Todo**
   - **Evidence Points:**
     - Input field exists in HTML (`#todoInput`)
     - Add button exists in HTML (`#addBtn`)
     - `addTodo()` function exists in app.js
     - Function validates empty input
     - Function creates todo with unique ID
     - Function adds todo to array
     - Function clears input after adding
     - Function calls renderTodos()
     - Event listener connects button to function
   - **Test Scenarios:**
     - Scenario 1: Add valid todo → todo appears in list
     - Scenario 2: Add empty input → no todo added
     - Scenario 3: Add multiple todos → all appear with unique IDs
   - **Verification:** ✅ PASS or ❌ FAIL with reason

5. **Verify FR-002: Edit Todo**
   - **Evidence Points:**
     - Edit buttons created for each todo
     - `editTodo(id)` function exists in app.js
     - Function finds todo by ID
     - Function prompts for new text
     - Function validates new text
     - Function updates todo in array
     - Function calls renderTodos()
     - Event listeners connect buttons to function
   - **Test Scenarios:**
     - Scenario 1: Edit existing todo → text updates
     - Scenario 2: Cancel edit → no change
     - Scenario 3: Edit with empty text → no change
   - **Verification:** ✅ PASS or ❌ FAIL with reason

6. **Verify FR-003: Delete Todo**
   - **Evidence Points:**
     - Delete buttons created for each todo
     - `deleteTodo(id)` function exists in app.js
     - Function removes todo by ID
     - Function updates array
     - Function calls renderTodos()
     - Event listeners connect buttons to function
   - **Test Scenarios:**
     - Scenario 1: Delete existing todo → todo removed
     - Scenario 2: Delete one of multiple todos → correct one removed
     - Scenario 3: Multiple deletes → all work independently
   - **Verification:** ✅ PASS or ❌ FAIL with reason

7. **Verify AC-1: Add Todo**
   - **Criterion:** "Given the Todo application is open, when the user enters a todo item and selects Add, then the todo item should be added to the list."
   - **Evidence:** Input field + Add button + addTodo() + renderTodos() = todo appears in list
   - **Verification:** ✅ SATISFIED or ❌ NOT SATISFIED with reason

8. **Verify AC-2: Edit Todo**
   - **Criterion:** "Given a todo item exists in the list, when the user selects Edit and updates the todo, then the todo item should display the updated text."
   - **Evidence:** Edit button + editTodo() + prompt + update + renderTodos() = updated text displayed
   - **Verification:** ✅ SATISFIED or ❌ NOT SATISFIED with reason

9. **Verify AC-3: Delete Todo**
   - **Criterion:** "Given a todo item exists in the list, when the user selects Delete, then the todo item should be removed from the list."
   - **Evidence:** Delete button + deleteTodo() + filter + renderTodos() = todo removed
   - **Verification:** ✅ SATISFIED or ❌ NOT SATISFIED with reason

10. **Verify Architecture**
    - Three files: index.html, styles.css, app.js ✅/❌
    - Vanilla JavaScript (no frameworks) ✅/❌
    - In-memory storage (let todos = []) ✅/❌
    - Files properly linked ✅/❌
    - No external dependencies ✅/❌

11. **Verify Scope**
    - Only approved features present (Add, Edit, Delete) ✅/❌
    - No persistence (localStorage, database) ✅/❌
    - No frameworks (React, Angular, Vue) ✅/❌
    - No authentication ✅/❌
    - No completion status, search, filtering, categories, priorities ✅/❌

12. **Make Verification Decision**
    - **PASS:** All requirements verified, all acceptance criteria satisfied, architecture compliant, scope compliant
    - **FAIL:** One or more verifications failed

13. **Generate Output**
    - Create `verification.md` with:
      1. Verification Summary
      2. Code Review Status Check
      3. Functional Requirements Verification (FR-001, FR-002, FR-003)
      4. Acceptance Criteria Verification (AC-1, AC-2, AC-3)
      5. Architecture Verification
      6. Scope Verification
      7. Evidence Summary
      8. Final Verification Decision

14. **Stop**
    - Do NOT modify implementation code
    - Do NOT modify SDLC documents
    - Do NOT proceed to PR Preparation
    - Report verification completion status
