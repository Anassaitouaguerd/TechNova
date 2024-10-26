
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Welcom to my TechNova</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        body {
            background-color: #f5f5f5;
            padding: 2rem;
            color: #333;
        }

        .button-container {
            text-align: center;
            margin-bottom: 1.5rem;
        }

        .add-user-button {
            background-color: #3498db;
            color: white;
            border: none;
            padding: 0.75rem 1.5rem;
            font-size: 1rem;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .add-user-button:hover {
            background-color: #2980b9;
        }
    </style>
</head>

<body>
<div class="button-container">
    <button class="add-user-button" onclick="window.location.href = '/users'">Entre to TechNova</button>
</div>
</body>
</html>
