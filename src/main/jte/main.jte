@param gg.jte.Content content

<!-- Коментар -->

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Apple Company</title>
    <link rel="icon" href="icon.ico" type="image/x-icon" />
    <style>
        /* Основні кольори */
        :root {
            --color-dark-blue: #0b2342;
            --color-mid-blue: #1a3a66;
            --color-light-blue: #4a6fa5;
            --color-gray-light: #e3e8ee;
            --color-gray-dark: #4b5361;
            --color-background: #f9fafc;
            --color-text: #2c3e50;
            --border-radius: 8px;
            --shadow: 0 2px 6px rgba(0, 0, 0, 0.15);
        }

        /* Скидання */
        *, *::before, *::after {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Source Code Pro', monospace, Consolas, 'Courier New', monospace;
            background-color: var(--color-background);
            color: var(--color-text);
            line-height: 1.5;
            font-size: 16px;
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: flex-start;
            padding: 50px 15px;
        }

        .container {
            background-color: white;
            max-width: 900px;
            width: 100%;
            border-radius: var(--border-radius);
            box-shadow: var(--shadow);
            padding: 40px 50px;
            border: 1px solid var(--color-gray-light);
        }

        h1 {
            font-weight: 700;
            font-size: 2.8rem;
            color: var(--color-dark-blue);
            margin-bottom: 40px;
            letter-spacing: 0.04em;
            border-bottom: 3px solid var(--color-mid-blue);
            padding-bottom: 12px;
            user-select: none;
        }

        /* Навігація */
        .navigation {
            display: flex;
            justify-content: center;
            gap: 35px;
            margin-bottom: 45px;
        }

        .navigation a {
            text-decoration: none;
            color: var(--color-mid-blue);
            font-weight: 600;
            font-size: 1.1rem;
            padding: 12px 24px;
            border-radius: var(--border-radius);
            border: 2px solid transparent;
            transition: all 0.25s ease;
            user-select: none;
        }

        .navigation a:hover,
        .navigation a:focus {
            color: white;
            background-color: var(--color-mid-blue);
            border-color: var(--color-mid-blue);
            outline: none;
        }

        /* Контент */
        .content {
            font-family: 'Fira Sans', 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            font-weight: 400;
            font-size: 1.1rem;
            color: var(--color-gray-dark);
            letter-spacing: 0.01em;
            line-height: 1.7;
            user-select: text;
        }

        /* Список команд */
        ul {
            list-style: none;
            padding-left: 0;
        }

        ul li {
            padding: 8px 12px;
            margin-bottom: 8px;
            border-left: 4px solid var(--color-mid-blue);
            background-color: var(--color-gray-light);
            border-radius: 4px;
            font-family: 'Source Code Pro', monospace, Consolas, 'Courier New', monospace;
            font-weight: 600;
            color: var(--color-dark-blue);
        }
    </style>

    <!-- Шрифти Google -->
    <link href="https://fonts.googleapis.com/css2?family=Fira+Sans&family=Source+Code+Pro&display=swap" rel="stylesheet" />
</head>
<body>
<div class="container">
    <h1>WELCOME TO APPLE COMPANY!</h1>
    <nav class="navigation">
        <a href="home">Home</a>
        <a href="team">Team</a>
        <a href="projects">Projects</a>
        <a href="profile">Profile</a>
    </nav>
    <main class="content">
        ${content}
    </main>
</div>
</body>
</html>
