// Data Layer: In-memory data structure
let todos = [];
let nextId = 1;

// Data Layer: Add Todo Data Operation
function addTodoToData(text) {
    const todo = {
        id: nextId++,
        text: text
    };
    todos.push(todo);
    return todo;
}

// Data Layer: Update Todo Data Operation
function updateTodoInData(id, newText) {
    const todo = todos.find(t => t.id === id);
    if (todo) {
        todo.text = newText;
        return true;
    }
    return false;
}

// Data Layer: Delete Todo Data Operation
function deleteTodoFromData(id) {
    const index = todos.findIndex(t => t.id === id);
    if (index !== -1) {
        todos.splice(index, 1);
        return true;
    }
    return false;
}

// Rendering Logic: Render Todos Function
function renderTodos() {
    const todoList = document.getElementById('todoList');
    todoList.innerHTML = '';

    todos.forEach(todo => {
        const todoItem = document.createElement('div');
        todoItem.className = 'todo-item';

        const todoText = document.createElement('span');
        todoText.className = 'todo-text';
        todoText.textContent = todo.text;

        const editButton = document.createElement('button');
        editButton.className = 'edit-button';
        editButton.textContent = 'Edit';
        editButton.dataset.id = todo.id;

        const deleteButton = document.createElement('button');
        deleteButton.className = 'delete-button';
        deleteButton.textContent = 'Delete';
        deleteButton.dataset.id = todo.id;

        todoItem.appendChild(todoText);
        todoItem.appendChild(editButton);
        todoItem.appendChild(deleteButton);

        todoList.appendChild(todoItem);
    });
}

// Application Logic: Add Todo Logic Function
function addTodo() {
    const input = document.getElementById('todoInput');
    const text = input.value.trim();

    if (text === '') {
        return; // Don't add empty todos
    }

    addTodoToData(text);
    renderTodos();
    input.value = '';
    input.focus();
}

// Application Logic: Edit Todo Logic Function
function editTodo(id) {
    const todo = todos.find(t => t.id === id);
    if (!todo) return;

    const newText = prompt('Edit todo:', todo.text);

    if (newText !== null && newText.trim() !== '') {
        updateTodoInData(id, newText.trim());
        renderTodos();
    }
}

// Application Logic: Delete Todo Logic Function
function deleteTodo(id) {
    deleteTodoFromData(id);
    renderTodos();
}

// Event Handling: Initialize application when DOM is ready
document.addEventListener('DOMContentLoaded', function() {
    // Add Button Event Listener
    const addButton = document.getElementById('addButton');
    addButton.addEventListener('click', addTodo);

    // Input Field Enter Key Event Listener
    const todoInput = document.getElementById('todoInput');
    todoInput.addEventListener('keypress', function(e) {
        if (e.key === 'Enter') {
            addTodo();
        }
    });

    // Edit and Delete Button Event Delegation
    const todoList = document.getElementById('todoList');
    todoList.addEventListener('click', function(e) {
        if (e.target.classList.contains('edit-button')) {
            const id = parseInt(e.target.dataset.id);
            editTodo(id);
        } else if (e.target.classList.contains('delete-button')) {
            const id = parseInt(e.target.dataset.id);
            deleteTodo(id);
        }
    });

    // Initial Render on Page Load
    renderTodos();
});
