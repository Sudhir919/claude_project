---
name: code-review
description: Execute the Code Review phase of the Agentic SDLC
agent: code-review
---

# Code Review Phase Skill

## Purpose

Review the implemented Todo application code to verify functional correctness, architecture compliance, scope adherence, and code quality before proceeding to verification.

## Inputs

- **requirements.md**: The approved functional requirements (FR-001, FR-002, FR-003)
- **architecture.md**: The approved architecture specification
- **design-review.md**: The design review with approval decision
- **impl-plan.md**: The implementation plan
- **docs/user-story.md**: The user story with acceptance criteria
- **todo-app/index.html**: The implemented HTML file
- **todo-app/app.js**: The implemented JavaScript file
- **todo-app/styles.css**: The implemented CSS file

## Process

1. Read all approved SDLC documents
2. Read all implementation files
3. Verify functional correctness for each requirement
4. Verify acceptance criteria are satisfied
5. Check for defects and issues
6. Verify scope compliance (no scope creep)
7. Verify architecture compliance
8. Assess code quality
9. Make approval decision
10. Generate code-review.md

## Outputs

- **code-review.md**: The code review report containing:
  - Review summary
  - Functional verification results
  - Acceptance criteria verification
  - Architecture compliance check
  - Scope compliance check
  - Code quality assessment
  - Issues found (if any)
  - Review decision (APPROVED / REWORK REQUIRED)
  - Required fixes (if rework needed)

## Functional Verification Checklist

### FR-001: Add Todo

**HTML Check:**
- [ ] Input field exists (`#todoInput` or similar)
- [ ] Input field has type="text"
- [ ] Add button exists (`#addBtn` or similar)

**JavaScript Check:**
- [ ] `addTodo()` function exists
- [ ] Function reads input value
- [ ] Function validates input (no empty todos)
- [ ] Function creates todo object with unique ID
- [ ] Function adds todo to array
- [ ] Function clears input field
- [ ] Function calls `renderTodos()`
- [ ] Event listener connects Add button to `addTodo()`

**Behavior Check:**
- [ ] User can type text and click Add
- [ ] Todo appears in list after Add
- [ ] Input is cleared after Add
- [ ] Empty input does not create todo

**AC-1 Satisfaction:**
"Given the Todo application is open, when the user enters a todo item and selects Add, then the todo item should be added to the list."

### FR-002: Edit Todo

**HTML Check:**
- [ ] Edit buttons are rendered for each todo (dynamically)

**JavaScript Check:**
- [ ] `editTodo(id)` function exists
- [ ] Function finds todo by ID
- [ ] Function prompts user for new text (or inline editing)
- [ ] Function validates new text
- [ ] Function updates todo text in array
- [ ] Function calls `renderTodos()`
- [ ] Event listeners connect Edit buttons to `editTodo()`

**Behavior Check:**
- [ ] User can click Edit on any todo
- [ ] User can modify the text
- [ ] Updated text is displayed in list
- [ ] Correct todo is edited

**AC-2 Satisfaction:**
"Given a todo item exists in the list, when the user selects Edit and updates the todo, then the todo item should display the updated text."

### FR-003: Delete Todo

**HTML Check:**
- [ ] Delete buttons are rendered for each todo (dynamically)

**JavaScript Check:**
- [ ] `deleteTodo(id)` function exists
- [ ] Function finds todo by ID
- [ ] Function removes todo from array
- [ ] Function calls `renderTodos()`
- [ ] Event listeners connect Delete buttons to `deleteTodo()`

**Behavior Check:**
- [ ] User can click Delete on any todo
- [ ] Todo is removed from list
- [ ] Correct todo is deleted
- [ ] Other todos remain unchanged

**AC-3 Satisfaction:**
"Given a todo item exists in the list, when the user selects Delete, then the todo item should be removed from the list."

## Defect Categories

### Critical Defects (Blocking)
- Functional requirement not working at all
- Application crashes or errors
- Data corruption or loss
- Incorrect todo modified/deleted
- Core functionality broken

### Major Defects (Should Fix)
- Edge case not handled properly
- Poor error handling
- Usability issues
- Inconsistent behavior

### Minor Defects (Nice to Fix)
- Code style inconsistencies
- Suboptimal implementation
- Minor readability issues

### Scope Violations (Blocking)
- Features outside approved requirements
- Persistence added (localStorage, database)
- External dependencies or frameworks
- Authentication or backend services

## Architecture Compliance Checklist

- [ ] Three files: index.html, styles.css, app.js
- [ ] HTML5 structure with proper doctype
- [ ] CSS linked in `<head>`
- [ ] JavaScript linked before `</body>`
- [ ] Vanilla JavaScript (no frameworks)
- [ ] In-memory storage (`let todos = []`)
- [ ] No external libraries or dependencies
- [ ] No build tools or bundlers

## Scope Compliance Checklist

**Approved Features (Should be present):**
- [ ] Add Todo functionality
- [ ] Edit Todo functionality
- [ ] Delete Todo functionality

**Prohibited Features (Should NOT be present):**
- [ ] No localStorage or sessionStorage
- [ ] No database calls
- [ ] No backend API calls (fetch, axios, etc.)
- [ ] No frameworks (React, Angular, Vue)
- [ ] No authentication or user management
- [ ] No completion status or checkboxes
- [ ] No search or filtering
- [ ] No categories, tags, or priorities
- [ ] No due dates or scheduling
- [ ] No notifications or reminders

## Code Quality Criteria

### Readability
- Code is clear and understandable
- Variable names are descriptive
- Functions have clear purposes
- Logic flow is easy to follow

### Simplicity
- Implementation is minimal
- No unnecessary complexity
- No over-engineering
- Straightforward approach

### Correctness
- Functions work as intended
- Edge cases are handled
- No obvious bugs or defects
- Logic is sound

### Maintainability
- Code is organized logically
- Functions are appropriately sized
- Easy to modify or extend
- Proper separation of concerns

## Review Decision Criteria

### APPROVED
All of the following must be true:
- ✅ FR-001 correctly implemented and working
- ✅ FR-002 correctly implemented and working
- ✅ FR-003 correctly implemented and working
- ✅ All acceptance criteria satisfied
- ✅ No critical or major defects
- ✅ No scope violations
- ✅ Architecture compliant
- ✅ Code quality acceptable

### REWORK REQUIRED
Any of the following is true:
- ❌ One or more functional requirements not working
- ❌ One or more acceptance criteria not satisfied
- ❌ Critical or major defects found
- ❌ Scope violations detected
- ❌ Architecture violations found
- ❌ Code quality unacceptable

## Common Issues to Check

1. **Empty Input Handling**: Does the code prevent adding empty todos?
2. **Unique IDs**: Does each todo have a unique ID?
3. **Correct Todo Targeted**: Do Edit/Delete operate on the correct todo?
4. **Array Mutation**: Is the todos array properly updated?
5. **Rendering**: Does `renderTodos()` correctly display all todos?
6. **Event Listeners**: Are event listeners properly attached?
7. **File Linking**: Are CSS and JS properly linked in HTML?
8. **Multiple Todos**: Can multiple todos be added, edited, deleted independently?
9. **Input Clearing**: Is the input field cleared after adding a todo?
10. **Persistence Check**: Is there NO localStorage or persistence code?

## Success Criteria

The Code Review phase is complete when:
1. `code-review.md` exists
2. All functional requirements have been verified
3. All acceptance criteria have been checked
4. Defects and issues have been identified (if any)
5. Scope compliance has been verified
6. Architecture compliance has been verified
7. Code quality has been assessed
8. A clear review decision has been made (APPROVED / REWORK REQUIRED)
9. Required fixes have been documented (if rework needed)
