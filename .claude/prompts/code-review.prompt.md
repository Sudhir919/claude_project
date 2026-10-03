# Code Review Phase Prompt

Execute the Code Review phase of the Agentic SDLC.

## Task

Review the implemented Todo application code to verify it satisfies all functional requirements, follows the approved architecture, and contains no defects.

## Instructions

1. **Read All Documents**
   - Open `requirements.md` - understand FR-001, FR-002, FR-003
   - Open `architecture.md` - understand the approved architecture
   - Open `design-review.md` - review approval decision
   - Open `impl-plan.md` - review implementation plan
   - Open `docs/user-story.md` - review acceptance criteria

2. **Read All Implementation Files**
   - Open `todo-app/index.html` - review HTML structure
   - Open `todo-app/app.js` - review JavaScript logic
   - Open `todo-app/styles.css` - review CSS styling

3. **Verify Functional Correctness**
   - **FR-001 (Add Todo):**
     - Check input field exists with correct ID
     - Check Add button exists with correct ID
     - Check `addTodo()` function exists
     - Verify function reads input value
     - Verify function creates todo with unique ID
     - Verify function adds to todos array
     - Verify function clears input
     - Verify function calls renderTodos()
     - Check event listener connects Add button to addTodo()
   - **FR-002 (Edit Todo):**
     - Check Edit buttons are rendered for each todo
     - Check `editTodo(id)` function exists
     - Verify function finds todo by ID
     - Verify function gets new text from user
     - Verify function updates todo text
     - Verify function calls renderTodos()
     - Check event listeners connect Edit buttons to editTodo()
   - **FR-003 (Delete Todo):**
     - Check Delete buttons are rendered for each todo
     - Check `deleteTodo(id)` function exists
     - Verify function removes todo by ID
     - Verify function updates todos array
     - Verify function calls renderTodos()
     - Check event listeners connect Delete buttons to deleteTodo()

4. **Check Rendering Logic**
   - Verify `renderTodos()` function exists
   - Check function clears the list container
   - Check function loops through todos array
   - Check function creates DOM elements for each todo
   - Check function adds Edit and Delete buttons
   - Check function appends to container

5. **Verify File Linking**
   - Check HTML links to styles.css in `<head>`
   - Check HTML links to app.js before `</body>`
   - Verify file references are correct

6. **Test Edge Cases**
   - Check empty input handling (should not add empty todos)
   - Check multiple todos work independently
   - Check todo IDs are unique
   - Check correct todo is edited/deleted

7. **Verify Scope Compliance**
   - Check NO localStorage or persistence
   - Check NO backend API calls
   - Check NO database integration
   - Check NO external frameworks (React, Angular, Vue)
   - Check NO authentication
   - Check NO completion status, search, filtering, categories, priorities

8. **Verify Architecture Compliance**
   - Check three files: index.html, styles.css, app.js
   - Check vanilla JavaScript (no frameworks)
   - Check in-memory storage (todos array)
   - Check no additional files or dependencies

9. **Assess Code Quality**
   - Check code readability
   - Check for unnecessary complexity
   - Check for obvious bugs or defects
   - Check proper use of HTML, CSS, JavaScript

10. **Identify Issues**
    - List any defects found
    - List any missing functionality
    - List any scope violations
    - List any architecture violations
    - Categorize severity (blocking vs. minor)

11. **Make Decision**
    - **APPROVED:** All requirements met, no blocking issues
    - **REWORK REQUIRED:** Defects, missing functionality, or violations found

12. **Generate Output**
    - Create `code-review.md` with:
      1. Review Summary
      2. Functional Verification (FR-001, FR-002, FR-003)
      3. Acceptance Criteria Verification (AC-1, AC-2, AC-3)
      4. Architecture Compliance Check
      5. Scope Compliance Check
      6. Code Quality Assessment
      7. Issues Found (if any)
      8. Review Decision
      9. Required Fixes (if rework needed)

13. **Stop**
    - Do NOT modify implementation code
    - Do NOT modify SDLC documents
    - Do NOT proceed to Verification phase
    - Report code review completion status
