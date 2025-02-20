<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #89f7fe 0%, #66a6ff 100%);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .container {
            background: #ffffff;
            padding: 40px;
            border-radius: 12px;
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
            width: 400px;
            text-align: center;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .container:hover {
            transform: translateY(-10px);
            box-shadow: 0 15px 30px rgba(0, 0, 0, 0.3);
        }

        h1 {
            margin-bottom: 30px;
            color: #333;
            font-size: 28px;
            font-weight: 700;
        }

        input[type="text"],
        input[type="password"],
        select {
            width: 100%;
            padding: 12px 15px;
            margin: 10px 0;
            border: 1px solid #ddd;
            border-radius: 8px;
            box-sizing: border-box;
            font-size: 16px;
            transition: border-color 0.3s ease;
        }

        input[type="text"]:focus,
        input[type="password"]:focus,
        select:focus {
            border-color: #4CAF50;
            outline: none;
        }

        input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            padding: 15px 20px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s ease, transform 0.3s ease;
            margin-top: 20px;
        }

        input[type="submit"]:hover {
            background-color: #45a049;
            transform: scale(1.05);
        }

        p {
            color: red;
            font-weight: bold;
            margin: 20px 0;
            font-size: 14px;
        }

        .password-container {
            position: relative;
            margin: 0;
        }

        .password-container .eye-icon {
            position: absolute;
            top: 50%;
            right: 15px;
            transform: translateY(-50%);
            cursor: pointer;
            color: #aaa;
            font-size: 20px;
        }

        .back-link {
            display: block;
            margin-top: 20px;
            font-size: 16px;
            color: #007BFF;
            text-decoration: none;
            transition: color 0.3s;
        }

        .back-link:hover {
            color: #0056b3;
            text-decoration: underline;
        }
    </style>
</head>

<body>
    <div class="container">
        <h1>Login</h1>
        <form action="LoginServlet" method="post">
            <input type="text" name="username" placeholder="Username" required><br>
            <div class="password-container">
                <input type="password" name="password" id="password" placeholder="Password" required>
                <i class="fas fa-eye eye-icon" id="togglePassword"></i>
            </div>
            <input type="submit" value="Login">
        </form>
        <% if (request.getAttribute("error") != null) { %>
        <p><%= request.getAttribute("error") %></p>
        <% } %>
    </div>

    <script>
        const togglePassword = document.getElementById('togglePassword');
        const passwordField = document.getElementById('password');

        togglePassword.addEventListener('click', function () {
            const type = passwordField.getAttribute('type') === 'password' ? 'text' : 'password';
            passwordField.setAttribute('type', type);
            this.classList.toggle('fa-eye-slash');
        });
    </script>
</body>

</html>
