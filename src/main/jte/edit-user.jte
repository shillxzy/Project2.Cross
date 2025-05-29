@import data.User
@param User user

@template.main(content = @`
    <style>
        .edit-container {
            max-width: 500px;
            margin: 30px auto;
            padding: 20px;
            background: #fdfdfd;
            border-radius: 10px;
            box-shadow: 0 2px 6px rgba(0,0,0,0.1);
        }

        h2 {
            text-align: center;
            color: #2c3e50;
        }

        label {
            font-weight: bold;
            display: block;
            margin-top: 15px;
        }

        input, select {
            width: 100%;
            padding: 8px;
            margin-top: 5px;
            border-radius: 6px;
            border: 1px solid #ccc;
        }

        button {
            margin-top: 20px;
            width: 100%;
            padding: 10px;
            background-color: #27ae60;
            color: white;
            border: none;
            border-radius: 6px;
            cursor: pointer;
        }

        button:hover {
            background-color: #219150;
        }
    </style>

    <div class="edit-container">
        <h2>✏️ Редагування користувача</h2>

        <form method="post" action="/admin/users/${user.getId()}/edit">
            <label>Ім’я користувача:</label>
            <input type="text" name="username" value="${user.getUsername()}" required />

            <label>Новий пароль (залиште пустим, якщо не змінювати):</label>
            <input type="password" name="password" />

            <label>Роль:</label>
            <select name="role">
                <option value="USER" selected="${user.getRole().equals("USER")}">USER</option>
                <option value="ADMIN" selected="${user.getRole().equals("ADMIN")}">ADMIN</option>

            </select>

            <button type="submit">💾 Зберегти зміни</button>
        </form>
    </div>
`)
