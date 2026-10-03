# Implementation Planning Phase Prompt

Execute the Implementation Planning phase of the Agentic SDLC.

## Task

Create a detailed, dependency-ordered implementation task list based on the approved requirements, architecture, and design review.

## Instructions

1. **Read Inputs**
   - Open `requirements.md` and review functional requirements (FR-001, FR-002, FR-003)
   - Open `architecture.md` and review the approved architecture
   - Open `design-review.md` and review the approval decision
   - Confirm the architecture was approved

2. **Identify Implementation Tasks**
   - For each architectural component, identify concrete implementation tasks:
     - **index.html**: Structure, input field, buttons, todo list container
     - **styles.css**: Layout, button styles, list styles, input styles
     - **app.js**: Data structure, add/edit/delete functions, render function, event listeners
   - Ensure tasks are specific and actionable
   - Avoid vague tasks like "implement app.js" — break it down

3. **Map Tasks to Requirements**
   - For each functional requirement, identify which tasks implement it:
     - FR-001 (Add Todo): Which tasks?
     - FR-002 (Edit Todo): Which tasks?
     - FR-003 (Delete Todo): Which tasks?
   - Ensure all requirements are covered

4. **Identify Dependencies**
   - Determine task dependencies:
     - Which tasks must be completed before others?
     - Example: HTML structure before JavaScript event listeners
     - Example: Data structure before add/edit/delete functions
   - Create a dependency list or graph

5. **Order Tasks**
   - Arrange tasks in dependency order:
     1. Foundation tasks (HTML structure, JS setup)
     2. Data model tasks (todo array, data structure)
     3. Core logic tasks (add/edit/delete/render functions)
     4. UI tasks (input, buttons, list display)
     5. Integration tasks (event listeners)
     6. Styling tasks (CSS)
   - Ensure no task depends on an incomplete task

6. **Verify Scope**
   - Check that all tasks implement only approved functionality
   - Remove any tasks that add features outside scope
   - Verify tasks align with approved architecture

7. **Verify Completeness**
   - Check that all requirements are covered by tasks
   - Check that all architectural components are built by tasks
   - Ensure no gaps in the implementation plan

8. **Generate Output**
   - Create `impl-plan.md` with:
     1. Implementation Overview
     2. Task List (with IDs, descriptions, dependencies)
     3. Task Dependencies (dependency graph or table)
     4. Suggested Implementation Order
     5. Requirement Traceability (task → FR mapping)
     6. Blocked Tasks (if any)

9. **Stop**
   - Do NOT write implementation code
   - Do NOT proceed to Implementation phase
   - Report planning completion status
