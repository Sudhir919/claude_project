---
name: verification
description: Execute the Verification phase of the Agentic SDLC
agent: verification
---

# Verification Phase Skill

## Purpose

Independently verify that the implemented Todo application satisfies all functional requirements, acceptance criteria, architecture specifications, and scope boundaries after code review approval.

## Inputs

- **requirements.md**: The approved functional requirements (FR-001, FR-002, FR-003)
- **architecture.md**: The approved architecture specification
- **design-review.md**: The design review with approval decision
- **impl-plan.md**: The implementation plan
- **code-review.md**: The code review report with decision
- **docs/user-story.md**: The user story with acceptance criteria (AC-1, AC-2, AC-3)
- **todo-app/index.html**: The implemented HTML file
- **todo-app/app.js**: The implemented JavaScript file
- **todo-app/styles.css**: The implemented CSS file

## Process

1. Read all approved SDLC documents
2. Read all implementation files
3. Verify code review status (must be APPROVED)
4. Verify FR-001 (Add Todo) with evidence
5. Verify FR-002 (Edit Todo) with evidence
6. Verify FR-003 (Delete Todo) with evidence
7. Verify AC-1 (Add Todo) with evidence
8. Verify AC-2 (Edit Todo) with evidence
9. Verify AC-3 (Delete Todo) with evidence
10. Verify architecture compliance
11. Verify scope compliance
12. Make final verification decision
13. Generate verification.md

## Outputs

- **verification.md**: The verification report containing:
  - Verification summary
  - Code review status check
  - Functional requirements verification with evidence
  - Acceptance criteria verification with evidence
  - Architecture verification
  - Scope verification
  - Evidence summary
  - Final verification decision (PASS / FAIL)

## Verification Evidence Requirements

### Evidence for FR-001: Add Todo

**Code Evidence:**
- [ ] Input field exists in HTML with correct ID
- [ ] Add button exists in HTML with correct ID
- [ ] `addTodo()` function exists in app.js
- [ ] Function validates empty input (returns early if empty)
- [ ] Function creates todo object with unique ID
- [ ] Function adds todo to array
- [ ] Function clears input field after adding
- [ ] Function calls renderTodos() to update display
- [ ] Event listener connects Add button to addTodo()
- [ ] Enter key also triggers addTodo()

**Behavioral Evidence:**
- [ ] User can type text and click Add
- [ ] Todo appears in list after Add
- [ ] Input field is cleared after Add
- [ ] Empty input does not create todo
- [ ] Multiple todos can be added with unique IDs

### Evidence for FR-002: Edit Todo

**Code Evidence:**
- [ ] Edit buttons are created dynamically for each todo
- [ ] `editTodo(id)` function exists in app.js
- [ ] Function finds todo by ID using array.find()
- [ ] Function prompts user for new text with current text shown
- [ ] Function validates new text (not null, not empty)
- [ ] Function updates todo.text in array
- [ ] Function calls renderTodos() to update display
- [ ] Event listeners connect Edit buttons to editTodo()

**Behavioral Evidence:**
- [ ] User can click Edit on any todo
- [ ] Prompt shows current todo text
- [ ] User can modify the text
- [ ] Updated text appears in list after edit
- [ ] Cancelling edit (clicking Cancel on prompt) leaves todo unchanged
- [ ] Empty text in edit prompt leaves todo unchanged
- [ ] Correct todo is edited (not a different one)

### Evidence for FR-003: Delete Todo

**Code Evidence:**
- [ ] Delete buttons are created dynamically for each todo
- [ ] `deleteTodo(id)` function exists in app.js
- [ ] Function removes todo using array.filter()
- [ ] Function updates todos array
- [ ] Function calls renderTodos() to update display
- [ ] Event listeners connect Delete buttons to deleteTodo()

**Behavioral Evidence:**
- [ ] User can click Delete on any todo
- [ ] Todo is removed from list after Delete
- [ ] Correct todo is deleted (not a different one)
- [ ] Other todos remain unchanged after one is deleted
- [ ] Multiple deletes work independently

## Acceptance Criteria Verification

### AC-1: Add Todo
**Criterion:** "Given the Todo application is open, when the user enters a todo item and selects Add, then the todo item should be added to the list."

**Verification Steps:**
1. Confirm input field is present and functional
2. Confirm Add button is present and functional
3. Confirm addTodo() function logic is correct
4. Confirm todo appears in list after Add
5. Confirm input is cleared after Add

**Pass Criteria:** All steps confirmed with code evidence and behavioral evidence

### AC-2: Edit Todo
**Criterion:** "Given a todo item exists in the list, when the user selects Edit and updates the todo, then the todo item should display the updated text."

**Verification Steps:**
1. Confirm Edit buttons appear for existing todos
2. Confirm editTodo() function logic is correct
3. Confirm prompt shows current text
4. Confirm user can modify text
5. Confirm updated text is displayed in list

**Pass Criteria:** All steps confirmed with code evidence and behavioral evidence

### AC-3: Delete Todo
**Criterion:** "Given a todo item exists in the list, when the user selects Delete, then the todo item should be removed from the list."

**Verification Steps:**
1. Confirm Delete buttons appear for existing todos
2. Confirm deleteTodo() function logic is correct
3. Confirm todo is removed from array
4. Confirm todo is removed from display

**Pass Criteria:** All steps confirmed with code evidence and behavioral evidence

## Architecture Verification Checklist

- [ ] Three files exist: index.html, styles.css, app.js
- [ ] HTML5 doctype and structure
- [ ] CSS linked in `<head>`: `<link rel="stylesheet" href="styles.css">`
- [ ] JavaScript linked before `</body>`: `<script src="app.js"></script>`
- [ ] Vanilla JavaScript (no React, Angular, Vue, jQuery, etc.)
- [ ] In-memory storage: `let todos = []`
- [ ] No external libraries or frameworks
- [ ] No build tools or bundlers
- [ ] No backend API calls (no fetch, XMLHttpRequest, axios)
- [ ] No database connections

## Scope Verification Checklist

**Approved Features (Must be present):**
- [ ] Add Todo functionality (FR-001)
- [ ] Edit Todo functionality (FR-002)
- [ ] Delete Todo functionality (FR-003)

**Prohibited Features (Must NOT be present):**
- [ ] No localStorage or sessionStorage
- [ ] No database integration
- [ ] No backend API calls
- [ ] No frameworks (React, Angular, Vue)
- [ ] No external libraries (jQuery, Lodash, etc.)
- [ ] No authentication or authorization
- [ ] No completion status or checkboxes
- [ ] No search or filtering functionality
- [ ] No categories, tags, or organization features
- [ ] No priority levels or sorting
- [ ] No due dates or scheduling
- [ ] No notifications or reminders
- [ ] No multi-user support
- [ ] No data export or import

## Verification Decision Matrix

| Verification Item | Status | Impact on Decision |
|-------------------|--------|-------------------|
| Code Review APPROVED | Required | FAIL if not met |
| FR-001 Verified | Required | FAIL if not met |
| FR-002 Verified | Required | FAIL if not met |
| FR-003 Verified | Required | FAIL if not met |
| AC-1 Satisfied | Required | FAIL if not met |
| AC-2 Satisfied | Required | FAIL if not met |
| AC-3 Satisfied | Required | FAIL if not met |
| Architecture Compliant | Required | FAIL if not met |
| Scope Compliant | Required | FAIL if not met |
| Evidence Complete | Required | FAIL if not met |

### PASS Criteria
**All of the following must be true:**
- ✅ Code review is APPROVED
- ✅ FR-001 verified working with evidence
- ✅ FR-002 verified working with evidence
- ✅ FR-003 verified working with evidence
- ✅ AC-1 satisfied with evidence
- ✅ AC-2 satisfied with evidence
- ✅ AC-3 satisfied with evidence
- ✅ Architecture compliant (3 files, vanilla JS, in-memory)
- ✅ Scope compliant (only Add/Edit/Delete, no prohibited features)
- ✅ Sufficient evidence provided for all verifications

### FAIL Criteria
**Any of the following is true:**
- ❌ Code review is not APPROVED or has unresolved defects
- ❌ One or more functional requirements not working
- ❌ One or more acceptance criteria not satisfied
- ❌ Architecture violations detected
- ❌ Scope violations detected (extra features or persistence)
- ❌ Insufficient evidence for verifications

## Evidence Documentation Guidelines

For each verification point, provide:
1. **What was checked**: Specific code location or behavior
2. **How it was checked**: Method of verification (code inspection, logic analysis)
3. **What was found**: Actual result observed
4. **Expected vs Actual**: Comparison with requirements
5. **Conclusion**: PASS or FAIL with justification

## Success Criteria

The Verification phase is complete when:
1. `verification.md` exists
2. Code review status has been verified (APPROVED)
3. All functional requirements have been verified with evidence
4. All acceptance criteria have been verified with evidence
5. Architecture compliance has been verified
6. Scope compliance has been verified
7. Evidence has been documented for all verification points
8. A clear verification decision has been made (PASS / FAIL)
9. Next steps are documented
