---
name: implementation-planning
description: Execute the Implementation Planning phase of the Agentic SDLC
agent: implementation-planning
---

# Implementation Planning Phase Skill

## Purpose

Create a detailed, dependency-ordered implementation task list that breaks down the approved architecture into specific, actionable tasks while maintaining traceability to functional requirements.

## Inputs

- **requirements.md**: The approved functional requirements (FR-001, FR-002, FR-003)
- **architecture.md**: The approved architecture with components and design
- **design-review.md**: The design review report with approval decision
- **CLAUDE.md**: Project SDLC rules and scope constraints

## Process

1. Read requirements.md, architecture.md, and design-review.md
2. Verify architecture was approved
3. Identify all implementation tasks for each component
4. Map tasks to functional requirements
5. Identify task dependencies
6. Order tasks by dependencies
7. Verify scope (no out-of-scope tasks)
8. Verify completeness (all requirements covered)
9. Generate impl-plan.md

## Outputs

- **impl-plan.md**: The implementation plan containing:
  - Implementation overview
  - Detailed task list with IDs and descriptions
  - Task dependencies (graph or table)
  - Suggested implementation order
  - Requirement traceability (task → FR mapping)
  - Any blocked tasks or prerequisites

## Task Identification Guidelines

### Component-Based Breakdown

**index.html tasks:**
- Create HTML structure
- Add input field for todo text
- Add "Add" button
- Add todo list container
- Add "Edit" and "Delete" buttons per todo item
- Link CSS and JavaScript files

**styles.css tasks:**
- Create layout styles
- Style input field
- Style buttons (Add, Edit, Delete)
- Style todo list
- Style todo items
- Add responsive design (optional, if in architecture)

**app.js tasks:**
- Create todo data structure (array)
- Implement `addTodo()` function
- Implement `editTodo(id)` function
- Implement `deleteTodo(id)` function
- Implement `renderTodos()` function
- Add event listeners for Add button
- Add event listeners for Edit buttons
- Add event listeners for Delete buttons
- Initialize application on page load

### Task Granularity

**Good task (specific):** "Implement addTodo() function that creates todo object with unique ID and adds to array"

**Bad task (vague):** "Implement JavaScript logic"

Tasks should be:
- Specific and actionable
- Testable or verifiable
- Completable in a reasonable time
- Atomic (one clear responsibility)

## Task Ordering Rules

### Dependency Principles

1. **Foundation First**: HTML structure before JavaScript logic
2. **Data Before Logic**: Data structures before functions that use them
3. **Logic Before Integration**: Functions before event listeners that call them
4. **Structure Before Style**: HTML before CSS (CSS can be parallel)

### Typical Dependency Chain

```
Task 1: Create HTML structure
  └─> Task 2: Add input field and buttons
        └─> Task 3: Add todo list container
              └─> Task 4: Create todo data structure in JS
                    ├─> Task 5: Implement renderTodos()
                    ├─> Task 6: Implement addTodo()
                    ├─> Task 7: Implement editTodo()
                    └─> Task 8: Implement deleteTodo()
                          └─> Task 9: Add event listeners
                                └─> Task 10: Test integration

Task 11: Create CSS styles (can start after Task 1, parallel to JS tasks)
```

### Parallel vs. Sequential

**Sequential (must be ordered):**
- HTML structure → Event listeners
- Data structure → Functions that use it
- Functions → Event listeners that call them

**Parallel (can be done simultaneously):**
- CSS styling and JavaScript logic (after HTML exists)
- Multiple independent functions (addTodo, editTodo, deleteTodo)

## Requirement Traceability

Each task must map to one or more functional requirements:

**FR-001 (Add Todo):**
- Tasks for input field (HTML)
- Tasks for Add button (HTML)
- Task for addTodo() function (JS)
- Task for Add event listener (JS)
- Task for renderTodos() function (JS)

**FR-002 (Edit Todo):**
- Tasks for Edit button per item (HTML)
- Task for editTodo() function (JS)
- Task for Edit event listeners (JS)
- Task for renderTodos() update (JS)

**FR-003 (Delete Todo):**
- Tasks for Delete button per item (HTML)
- Task for deleteTodo() function (JS)
- Task for Delete event listeners (JS)
- Task for renderTodos() update (JS)

Verify: Every functional requirement has corresponding tasks.

## Scope Control

### Allowed Tasks
Tasks that implement the approved architecture for:
- Add Todo functionality
- Edit Todo functionality
- Delete Todo functionality
- Supporting tasks (data structure, rendering, event handling)

### Prohibited Tasks
Do NOT create tasks for:
- Persistence (localStorage, database, backend)
- Authentication or authorization
- Completion status or checkboxes (unless in approved requirements)
- Search, filtering, or sorting
- Categories, priorities, or due dates
- Backend services or APIs
- Additional features not in requirements

### Validation
For each task, ask: "Is this required to implement FR-001, FR-002, or FR-003?"
- If YES: Include the task
- If NO: Remove the task

## Validation Criteria

### Completeness
- ✅ All functional requirements have corresponding tasks
- ✅ All architectural components have implementation tasks
- ✅ No gaps in the task list

### Correctness
- ✅ Task dependencies are correct and complete
- ✅ Task order respects dependencies
- ✅ No circular dependencies

### Scope
- ✅ All tasks implement approved functionality only
- ✅ No tasks for features outside requirements
- ✅ Tasks align with approved architecture

### Traceability
- ✅ Every task maps to a requirement or architectural component
- ✅ Every requirement is covered by tasks
- ✅ Traceability table is complete

### Actionability
- ✅ Tasks are specific and actionable
- ✅ Tasks are testable or verifiable
- ✅ Tasks are appropriately sized

## Success Criteria

The Implementation Planning phase is complete when:
1. `impl-plan.md` exists
2. All implementation tasks are identified
3. Task dependencies are documented
4. Tasks are ordered correctly
5. All functional requirements map to tasks
6. No out-of-scope tasks exist
7. Task list is complete (no gaps)
8. Tasks are specific and actionable
