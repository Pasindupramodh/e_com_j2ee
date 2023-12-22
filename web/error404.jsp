<%-- 
    Document   : error404
    Created on : Dec 22, 2023, 10:50:50 PM
    Author     : REDTECH
--%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Error 404 - Page Not Found</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f0f0f0;
            margin: 0;
            padding: 0;
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
        }

        .error-container {
            text-align: center;
        }

        .error-code {
            font-size: 8em;
            color: #2c3e50;
            margin: 0;
        }

        .error-message {
            font-size: 1.5em;
            color: #34495e;
            margin: 10px 0;
        }

        .back-to-home {
            color: #3d9970;
            text-decoration: none;
            font-weight: bold;
            font-size: 1.2em;
            display: inline-block;
            margin-top: 20px;
            border: 2px solid #3d9970;
            padding: 10px 20px;
            transition: background-color 0.3s, color 0.3s;
        }

        .back-to-home:hover {
            background-color: #3d9970;
            color: #fff;
        }
    </style>
</head>
<body>
    <div class="error-container">
        <h1 class="error-code">404</h1>
        <p class="error-message">Page Not Found</p>
        <a href="${BASE_URL}" class="back-to-home">Back to Home</a>
    </div>
</body>
</html>
