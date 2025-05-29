@import data.User
@param java.util.List<User> users
@param String createError
@param String searchQuery

@template.main(content = @`
    <style>
        .admin-container {
            max-width: 1000px;
            margin: 0 auto;
            padding: 20px;
        }

        h1, h2 {
            text-align: center;
            color: #2c3e50;
        }

        form {
            margin-bottom: 30px;
            background-color: #f9f9f9;
            padding: 15px;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }

        label {
            font-weight: bold;
            display: block;
            margin-top: 10px;
        }

        input[type="text"], input[type="password"], select {
            width: 100%;
            padding: 8px;
            margin-top: 5px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        button {
            background-color: #3498db;
            color: white;
            border: none;
            padding: 10px 16px;
            border-radius: 5px;
            cursor: pointer;
            margin-top: 15px;
            transition: background-color 0.3s;
        }

        button:hover {
            background-color: #2980b9;
        }

        .error-msg {
            color: red;
            margin-bottom: 10px;
            font-weight: bold;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            background-color: #fff;
            box-shadow: 0 0 8px rgba(0,0,0,0.05);
        }

        th, td {
            padding: 12px 15px;
            border-bottom: 1px solid #e0e0e0;
            text-align: left;
        }

        th {
            background-color: #f0f0f0;
            color: #333;
        }

        .action-btn {
            background-color: #27ae60;
            padding: 6px 12px;
            font-size: 14px;
        }

        .action-btn:hover {
            background-color: #219150;
        }
    </style>

    <div class="admin-container">
        <h1>👑 Панель адміністратора</h1>

        <h2>➕ Створити нового користувача</h2>

        @if(createError != null)
            <p class="error-msg">${createError}</p>
        @endif

        <form method="post" action="/admin/create">
            <label>Ім’я користувача:</label>
            <input type="text" name="username" required />

            <label>Пароль:</label>
            <input type="password" name="password" required />

            <label>Роль:</label>
            <select name="role">
                <option value="USER">USER</option>
                <option value="ADMIN">ADMIN</option>
            </select>

            <button type="submit">Створити користувача</button>
        </form>

        <h2>📋 Список користувачів</h2>

        <form method="get" action="/admin/search" style="margin-bottom: 15px;">
            <input
                    type="text"
                    name="query"
                    placeholder="Пошук..."
                    value="${searchQuery != null ? searchQuery : ""}"
                    style="padding: 5px; width: 250px; border: 1px solid #ccc; border-radius: 4px;"
            />
            <button type="submit" style="padding: 6px 12px; background-color: #3498db; color: white; border: none; border-radius: 4px; cursor: pointer;">
                🔍
            </button>
        </form>

        <table>
            <thead>
            <tr>
                <th style="white-space: nowrap;">
                    ID
                    <span style="margin-left: 5px;">
            <a href="/admin?sortField=id&sortDir=asc" style="text-decoration:none; font-size: 0.8em; margin-right: 3px;">⬆️</a>
            <a href="/admin?sortField=id&sortDir=desc" style="text-decoration:none; font-size: 0.8em;">⬇️</a>
        </span>
                </th>
                <th style="white-space: nowrap;">
                    Username
                    <span style="margin-left: 5px;">
            <a href="/admin?sortField=username&sortDir=asc" style="text-decoration:none; font-size: 0.8em; margin-right: 3px;">⬆️</a>
            <a href="/admin?sortField=username&sortDir=desc" style="text-decoration:none; font-size: 0.8em;">⬇️</a>
        </span>
                </th>
                <th style="white-space: nowrap;">
                    Role
                    <span style="margin-left: 5px;">
            <a href="/admin?sortField=role&sortDir=asc" style="text-decoration:none; font-size: 0.8em; margin-right: 3px;">⬆️</a>
            <a href="/admin?sortField=role&sortDir=desc" style="text-decoration:none; font-size: 0.8em;">⬇️</a>
        </span>
                </th>
                <th>Дія</th>
            </tr>
            </thead>
            <tbody>
            @for(var user : users)
                <tr>
                    <td>${user.getId()}</td>
                    <td>${user.getUsername()}</td>
                    <td>${user.getRole()}</td>
                    <td>
                        <form method="post" action="/admin/users/${user.getId()}/change-role" style="display:inline;">
                            <button type="submit" class="action-btn">Змінити роль</button>
                        </form>
                        <form method="get" action="/admin/users/${user.getId()}/edit" style="display:inline;">
                            <button type="submit" class="action-btn" style="background-color:#f39c12;">✏️ Редагувати</button>
                        </form>
                        <form method="post" action="/admin/users/${user.getId()}/delete" style="display:inline;">
                            <button type="submit" class="action-btn" style="background-color:#e74c3c;">🗑️ Видалити</button>
                        </form>

                    </td>
                </tr>
            @endfor
            </tbody>
        </table>
    </div>
`)
