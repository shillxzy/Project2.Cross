@param java.lang.String error
<!DOCTYPE html>
<html lang="uk">
<head>
    <meta charset="UTF-8" />
    <title>Реєстрація</title>
    <style>
        body { font-family: Arial, sans-serif; background: #f4f4f4; }
        .container { max-width: 400px; margin: 40px auto; background: white; padding: 20px; border-radius: 8px; box-shadow: 0 0 10px #ccc; }
        label, input, select, button { display: block; width: 100%; margin-bottom: 15px; }
        button { background-color: #4CAF50; color: white; border: none; padding: 10px; cursor: pointer; }
        .error { color: red; margin-bottom: 10px; }
        a { color: #4CAF50; text-decoration: none; }
    </style>
</head>
<body>
<div class="container">
    <h2>Реєстрація користувача</h2>

    @if(error != null)
        <div class="error">${error}</div>
    @endif

    <form method="post" action="/signup">
        <label for="username">Ім'я користувача:</label>
        <input type="text" id="username" name="username" required />

        <label for="password">Пароль:</label>
        <input type="password" id="password" name="password" required />

        <label for="role">Роль:</label>
        <select id="role" name="role" required>
            <option value="USER" selected>USER</option>
            <option value="ADMIN">ADMIN</option>
        </select>

        <button type="submit">Зареєструватися</button>
    </form>

    <p>Вже маєте акаунт? <a href="/login">Увійти</a></p>
</div>
</body>
</html>

