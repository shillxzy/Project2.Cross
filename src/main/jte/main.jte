@param gg.jte.Content content

<!-- Коментар -->

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Steve Jobs</title>
    <style>
        :root {
            --primary-color: #1976d2;
            --primary-dark: #115293;
            --bg-color: #f5f7fa;
            --text-color: #333;
            --card-bg: #fff;
            --shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            --border-radius: 12px;
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: var(--bg-color);
            color: var(--text-color);
            padding: 40px 20px;
        }

        .container {
            max-width: 960px;
            margin: 0 auto;
            background-color: var(--card-bg);
            padding: 40px;
            border-radius: var(--border-radius);
            box-shadow: var(--shadow);
        }

        h1 {
            font-size: 36px;
            color: var(--primary-color);
            margin-bottom: 30px;
            border-bottom: 2px solid var(--primary-color);
            padding-bottom: 10px;
        }

        .navigation {
            display: flex;
            justify-content: center;
            margin-bottom: 40px;
            gap: 30px;
        }

        .navigation a {
            text-decoration: none;
            font-size: 18px;
            color: var(--primary-color);
            padding: 10px 20px;
            border: 2px solid var(--primary-color);
            border-radius: 8px;
            transition: all 0.3s ease;
        }

        .navigation a:hover {
            background-color: var(--primary-color);
            color: #fff;
        }

        .content {
            font-size: 18px;
            line-height: 1.6;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>Welcome to personal Steve Jobs site!</h1>
    <div class="navigation">
        <a href="home">Home</a>
        <a href="team">Team</a>
        <a href="projects">Projects</a>
    </div>
    <div class="content">
        ${content}
    </div>
</div>
</body>
</html>