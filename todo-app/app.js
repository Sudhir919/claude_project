// Todo data structure (in-memory array)
let todos = [];
let nextId = 1;

// Add a new todo
function addTodo() {
    const input = document.getElementById('todoInput');
    const text = input.value.trim();

    if (text === '') {
        return;
    }

    const todo = {
        id: nextId++,
        text: text
    };

    todos.push(todo);
    input.value = '';
    renderTodos();
}

// Edit an existing todo
function editTodo(id) {
    const todo = todos.find(t => t.id === id);

    if (!todo) {
        return;
    }

    const newText = prompt('Edit todo:', todo.text);

    if (newText !== null && newText.trim() !== '') {
        todo.text = newText.trim();
        renderTodos();
    }
}

// Delete a todo
function deleteTodo(id) {
    todos = todos.filter(t => t.id !== id);
    renderTodos();
}

// Render all todos to the DOM
function renderTodos() {
    const todoList = document.getElementById('todoList');
    todoList.innerHTML = '';

    todos.forEach(todo => {
        const li = document.createElement('li');

        const span = document.createElement('span');
        span.textContent = todo.text;
        span.className = 'todo-text';

        const editBtn = document.createElement('button');
        editBtn.textContent = 'Edit';
        editBtn.className = 'edit-btn';
        editBtn.onclick = () => editTodo(todo.id);

        const deleteBtn = document.createElement('button');
        deleteBtn.textContent = 'Delete';
        deleteBtn.className = 'delete-btn';
        deleteBtn.onclick = () => deleteTodo(todo.id);

        li.appendChild(span);
        li.appendChild(editBtn);
        li.appendChild(deleteBtn);

        todoList.appendChild(li);
    });
}

// Initialize the application
document.addEventListener('DOMContentLoaded', () => {
    const addBtn = document.getElementById('addBtn');
    const todoInput = document.getElementById('todoInput');

    addBtn.addEventListener('click', addTodo);

    todoInput.addEventListener('keypress', (e) => {
        if (e.key === 'Enter') {
            addTodo();
        }
    });

    renderTodos();
});
