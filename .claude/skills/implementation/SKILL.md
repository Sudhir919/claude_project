---
name: implementation
description: Execute the Implementation phase of the Agentic SDLC
agent: implementation
---

# Implementation Phase Skill

## Purpose

Build the Todo application according to the approved requirements, architecture, design review, and implementation plan, implementing only the approved Add, Edit, and Delete functionality.

## Inputs

- **requirements.md**: The approved functional requirements (FR-001, FR-002, FR-003)
- **architecture.md**: The approved architecture (index.html, styles.css, app.js)
- **design-review.md**: The design review with approval decision
- **impl-plan.md**: The implementation plan with task list and dependencies
- **CLAUDE.md**: Project SDLC rules and scope constraints

## Process

1. Read all approved documents (requirements, architecture, design-review, impl-plan)
2. Review task list and dependencies from impl-plan.md
3. Create `todo-app/` directory structure
4. Implement `todo-app/index.html` (structure, input, buttons, list container)
5. Implement `todo-app/app.js` (data structure, functions, event listeners)
6. Implement `todo-app/styles.css` (layout and styling)
7. Verify all files are properly linked
8. Validate implementation against requirements
9. Verify no scope creep occurred

## Outputs

- **todo-app/index.html**: The HTML file with UI structure
- **todo-app/styles.css**: The CSS file with styling
- **todo-app/app.js**: The JavaScript file with application logic

## Implementation Guidelines

### Directory Structure
```
todo-app/
├── index.html
├── styles.css
└── app.js
```

### index.html Requirements
**Must include:**
- HTML5 doctype and structure
- Page title
- Input field (type="text") with ID
- "Add" button with ID
- Todo list container (ul or div) with ID
- Link to styles.css in `<head>`
- Link to app.js before closing `</body>`

**Must NOT include:**
- External frameworks or libraries
- Backend API calls
- Authentication forms
- Unnecessary form fields

### app.js Requirements
**Must include:**
- Todos array (in-memory storage)
- `addTodo()` function that:
  - Reads input value
  - Creates todo with unique ID and text
  - Adds to array
  - Clears input
  - Calls renderTodos()
- `editTodo(id)` function that:
  - Finds todo by ID
  - Gets new text from user (prompt or inline)
  - Updates array
  - Calls renderTodos()
- `deleteTodo(id)` function that:
  - Finds todo by ID
  - Removes from array
  - Calls renderTodos()
- `renderTodos()` function that:
  - Clears container
  - Creates DOM elements for each todo
  - Adds Edit and Delete buttons per todo
  - Appends to container
- Event listeners for Add, Edit, Delete actions
- Initialization on DOMContentLoaded

**Must NOT include:**
- localStorage or persistence
- Backend API calls
- Authentication logic
- External libraries
- Features outside approved scope

### styles.css Requirements
**Must include:**
- Basic layout styles
- Input field styling
- Button styling (Add, Edit, Delete)
- Todo list styling
- Todo item styling

**Should be:**
- Simple and functional
- Readable and clean
- Minimal (no elaborate animations or effects)

## Requirement Traceability

### FR-001: Add Todo
**Implementation:**
- HTML: Input field + Add button
- JS: addTodo() function + event listener
- CSS: Styling for input and Add button

**Validation:** User can type text and click Add to create a todo

### FR-002: Edit Todo
**Implementation:**
- HTML: Edit button per todo (created by renderTodos)
- JS: editTodo(id) function + event listener
- CSS: Styling for Edit button

**Validation:** User can click Edit on a todo and modify its text

### FR-003: Delete Todo
**Implementation:**
- HTML: Delete button per todo (created by renderTodos)
- JS: deleteTodo(id) function + event listener
- CSS: Styling for Delete button

**Validation:** User can click Delete on a todo to remove it

## Scope Control

### Allowed Implementation
✅ HTML structure for UI  
✅ Input field and Add button  
✅ Todo list display with Edit and Delete buttons  
✅ In-memory todo array  
✅ addTodo(), editTodo(), deleteTodo(), renderTodos() functions  
✅ Event listeners for user interactions  
✅ Basic CSS styling  

### Prohibited Implementation
❌ localStorage or any persistence  
❌ Backend services or APIs  
❌ Database integration  
❌ Authentication or user management  
❌ Completion status or checkboxes  
❌ Search or filtering functionality  
❌ Categories, priorities, or due dates  
❌ External frameworks (React, Angular, Vue)  
❌ Build tools or bundlers  
❌ Any features not in requirements.md  

### Validation Rule
For every line of code, ask: "Is this required to implement FR-001, FR-002, or FR-003?"
- If YES: Include it
- If NO: Don't write it

## Validation Criteria

### Functional Completeness
- ✅ FR-001 (Add Todo) is fully implemented and functional
- ✅ FR-002 (Edit Todo) is fully implemented and functional
- ✅ FR-003 (Delete Todo) is fully implemented and functional

### Architectural Compliance
- ✅ Three files created: index.html, styles.css, app.js
- ✅ Files are properly linked
- ✅ No additional files or dependencies

### Scope Compliance
- ✅ Only approved functionality implemented
- ✅ No persistence added
- ✅ No frameworks used
- ✅ No backend or API added
- ✅ No additional features

### Code Quality
- ✅ Code is clean and readable
- ✅ Code is simple and minimal
- ✅ Code follows approved architecture
- ✅ No over-engineering

## Success Criteria

The Implementation phase is complete when:
1. `todo-app/index.html` exists with proper structure
2. `todo-app/styles.css` exists with basic styling
3. `todo-app/app.js` exists with all required functions
4. Files are properly linked together
5. All three functional requirements are implemented
6. No features outside approved scope are present
7. Implementation matches approved architecture
8. Code is minimal and functional
