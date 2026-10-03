# Implementation Phase Prompt

Execute the Implementation phase of the Agentic SDLC.

## Task

Build the Todo application according to the approved requirements, architecture, and implementation plan.

## Instructions

1. **Read All Approved Documents**
   - Open `requirements.md` - understand FR-001, FR-002, FR-003
   - Open `architecture.md` - understand the three-file architecture
   - Open `design-review.md` - confirm approval status
   - Open `impl-plan.md` - review the task list and dependencies

2. **Prepare Implementation**
   - Identify the tasks from impl-plan.md
   - Understand the dependency order
   - Plan to implement in the correct sequence

3. **Implement index.html**
   - Create `todo-app/index.html`
   - Add HTML5 structure (doctype, html, head, body)
   - Add page title
   - Add input field with ID for JavaScript access
   - Add "Add" button with ID
   - Add container (ul or div) for displaying todos with ID
   - Link to `styles.css` in the head
   - Link to `app.js` before closing body tag

4. **Implement app.js**
   - Create `todo-app/app.js`
   - Declare array variable to store todos
   - Implement `addTodo()`:
     - Read input value
     - Create todo object with unique ID and text
     - Add to array
     - Clear input field
     - Call renderTodos()
   - Implement `editTodo(id)`:
     - Find todo by ID
     - Prompt user for new text (or use inline editing)
     - Update todo text in array
     - Call renderTodos()
   - Implement `deleteTodo(id)`:
     - Find todo by ID
     - Remove from array
     - Call renderTodos()
   - Implement `renderTodos()`:
     - Clear the list container
     - Loop through todos array
     - Create DOM elements for each todo (text, Edit button, Delete button)
     - Append to container
   - Add event listener for Add button click → addTodo()
   - Add event listeners for Edit buttons → editTodo(id)
   - Add event listeners for Delete buttons → deleteTodo(id)
   - Initialize app on DOMContentLoaded

5. **Implement styles.css**
   - Create `todo-app/styles.css`
   - Add basic layout styles (container, spacing)
   - Style the input field (width, padding, border)
   - Style buttons (Add, Edit, Delete) with colors and padding
   - Style the todo list (list-style, spacing)
   - Style todo items (layout, spacing between text and buttons)
   - Keep styling minimal and functional

6. **Verify Scope**
   - Check that ONLY Add, Edit, Delete functionality is implemented
   - Ensure no persistence, authentication, or extra features added
   - Verify the code matches the approved architecture

7. **Test Implementation**
   - Verify the HTML structure is correct
   - Verify CSS and JS files are properly linked
   - Verify the application logic is complete
   - Mentally trace through Add, Edit, Delete flows

8. **Validate Requirements**
   - FR-001 (Add Todo): Can users add todos? ✅
   - FR-002 (Edit Todo): Can users edit todos? ✅
   - FR-003 (Delete Todo): Can users delete todos? ✅

9. **Stop**
   - Do NOT modify approved SDLC documents
   - Do NOT add features outside scope
   - Report implementation completion status
