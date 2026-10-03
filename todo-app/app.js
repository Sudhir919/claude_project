// Data Layer: In-memory storage for todos
// Todo object structure: { id: Number, text: String }
let todos = [];

// DOM Element References
let todoInput;
let addBtn;
let todoList;

// Initialize Application
function initApp() {
    // Get DOM element references
    todoInput = document.getElementById('todoInput');
    addBtn = document.getElementById('addBtn');
    todoList = document.getElementById('todoList');

    // Add event listener for Add button
    addBtn.addEventListener('click', handleAddTodo);

    // Add event listener for Enter key on input field
    todoInput.addEventListener('keypress', (e) => {
        if (e.key === 'Enter') {
            handleAddTodo();
        }
    });

    // Initial render
    renderTodos();
}

// Handle Add Todo button click
function handleAddTodo() {
    const text = todoInput.value.trim();
    if (text) {
        addTodo(text);
        todoInput.value = '';
        todoInput.focus();
    }
}

// FR-001: Add Todo Item
function addTodo(text) {
    // Validate input
    if (!text || text.trim() === '') {
        return;
    }

    // Create new todo object with unique ID (timestamp-based)
    const newTodo = {
        id: Date.now(),
        text: text.trim()
    };

    // Add to todos array
    todos.push(newTodo);

    // Update display
    renderTodos();
}

// FR-002: Edit Todo Item
function editTodo(id, newText) {
    // Validate input
    if (!newText || newText.trim() === '') {
        return;
    }

    // Find todo by ID and update text
    const todo = todos.find(t => t.id === id);
    if (todo) {
        todo.text = newText.trim();
        renderTodos();
    }
}

// FR-003: Delete Todo Item
function deleteTodo(id) {
    // Remove todo from array by filtering out the matching ID
    todos = todos.filter(t => t.id !== id);

    // Update display
    renderTodos();
}

// Render Todos to DOM
function renderTodos() {
    // Clear existing content
    todoList.innerHTML = '';

    // Handle empty state
    if (todos.length === 0) {
        const emptyState = document.createElement('div');
        emptyState.className = 'empty-state';
        emptyState.textContent = 'No todos yet. Add one above!';
        todoList.appendChild(emptyState);
        return;
    }

    // Render each todo
    todos.forEach(todo => {
        const todoItem = document.createElement('div');
        todoItem.className = 'todo-item';

        // Todo text element
        const todoText = document.createElement('span');
        todoText.className = 'todo-text';
        todoText.textContent = todo.text;

        // Actions container
        const actionsDiv = document.createElement('div');
        actionsDiv.className = 'todo-actions';

        // Edit button
        const editBtn = document.createElement('button');
        editBtn.className = 'edit-btn';
        editBtn.textContent = 'Edit';
        editBtn.addEventListener('click', () => enterEditMode(todo.id, todoItem));

        // Delete button
        const deleteBtn = document.createElement('button');
        deleteBtn.className = 'delete-btn';
        deleteBtn.textContent = 'Delete';
        deleteBtn.addEventListener('click', () => deleteTodo(todo.id));

        // Assemble todo item
        actionsDiv.appendChild(editBtn);
        actionsDiv.appendChild(deleteBtn);
        todoItem.appendChild(todoText);
        todoItem.appendChild(actionsDiv);
        todoList.appendChild(todoItem);
    });
}

// Enter Edit Mode for a specific todo
function enterEditMode(id, todoItemElement) {
    // Find the todo
    const todo = todos.find(t => t.id === id);
    if (!todo) return;

    // Clear the todo item element
    todoItemElement.innerHTML = '';

    // Create edit input field
    const editInput = document.createElement('input');
    editInput.type = 'text';
    editInput.className = 'edit-input';
    editInput.value = todo.text;

    // Create actions container
    const actionsDiv = document.createElement('div');
    actionsDiv.className = 'todo-actions';

    // Create Save button
    const saveBtn = document.createElement('button');
    saveBtn.className = 'save-btn';
    saveBtn.textContent = 'Save';
    saveBtn.addEventListener('click', () => {
        const newText = editInput.value.trim();
        if (newText) {
            editTodo(id, newText);
        }
    });

    // Create Cancel button
    const cancelBtn = document.createElement('button');
    cancelBtn.className = 'cancel-btn';
    cancelBtn.textContent = 'Cancel';
    cancelBtn.addEventListener('click', () => renderTodos());

    // Handle Enter key to save
    editInput.addEventListener('keypress', (e) => {
        if (e.key === 'Enter') {
            const newText = editInput.value.trim();
            if (newText) {
                editTodo(id, newText);
            }
        }
    });

    // Handle Escape key to cancel
    editInput.addEventListener('keydown', (e) => {
        if (e.key === 'Escape') {
            renderTodos();
        }
    });

    // Assemble edit mode UI
    actionsDiv.appendChild(saveBtn);
    actionsDiv.appendChild(cancelBtn);
    todoItemElement.appendChild(editInput);
    todoItemElement.appendChild(actionsDiv);

    // Focus the input field
    editInput.focus();
    editInput.select();
}

// Initialize app when DOM is ready
document.addEventListener('DOMContentLoaded', initApp);
