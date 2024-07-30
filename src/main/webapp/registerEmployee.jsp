<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Register Employee</title>
<style>
body {
    font-family: Arial, sans-serif;
    background-color: #f4f4f4;
    margin: 0;
    padding: 20px;
}

h1 {
    text-align: center;
    color: #333;
    margin-bottom: 20px;
}

form {
    max-width: 500px;
    margin: 0 auto;
    padding: 20px;
    background-color: #fff;
    border-radius: 8px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

label {
    display: block;
    margin-bottom: 8px;
    font-weight: bold;
    color: #555;
}

input[type="text"], input[type="password"], select {
    width: 100%;
    padding: 10px;
    margin-bottom: 15px;
    border: 1px solid #ddd;
    border-radius: 4px;
    box-sizing: border-box;
}

input[type="submit"] {
    width: 100%;
    padding: 15px;
    border: none;
    border-radius: 4px;
    background-color: #4CAF50;
    color: #fff;
    font-size: 16px;
    cursor: pointer;
    transition: background-color 0.3s;
}

input[type="submit"]:hover {
    background-color: #45a049;
}

.success-message {
    text-align: center;
    color: green;
    font-weight: bold;
}

.back-link {
    display: block;
    margin-top: 20px;
    text-align: center;
    font-size: 16px;
    color: #007BFF;
    text-decoration: none;
    transition: color 0.3s;
}

.back-link:hover {
    color: #0056b3;
    text-decoration: underline;
}

.error-message {
    text-align: center;
    color: red;
    font-weight: bold;
    margin-top: 10px;
}
</style>
<script>
function validateForm() {
    const name = document.getElementById('name').value.trim();
    const role = document.getElementById('role').value;
    const username = document.getElementById('username').value.trim();
    const password = document.getElementById('password').value.trim();
    
    let errorMessage = '';

    if (name === '') {
        errorMessage += 'Name cannot be empty or whitespace.<br>';
    }

    if (username === '') {
        errorMessage += 'Username cannot be empty or whitespace.<br>';
    }

    if (password === '') {
        errorMessage += 'Password cannot be empty or whitespace.<br>';
    }

    if (errorMessage) {
        document.getElementById('error-message').innerHTML = errorMessage;
        return false;
    }
    
    return true;
}
</script>
</head>
<body>
    <h1>Register Employee</h1>
    <form action="RegisterEmployeeServlet" method="post" onsubmit="return validateForm()">
        <label for="name">Name:</label> 
        <input type="text" id="name" name="name" required> 
        
        <label for="role">Role:</label>
        <select id="role" name="role" required>
            <option value="Admin">Admin</option>
            <option value="Employee">Employee</option>
        </select>

        <label for="username">Username:</label> 
        <input type="text" id="username" name="username" required> 
        
        <label for="password">Password:</label>
        <input type="password" id="password" name="password" required>

        <div id="error-message" class="error-message"></div>
        
        <input type="submit" value="Register">
    </form>

    <% if (request.getAttribute("successMessage") != null) { %>
    <p class="success-message"><%= request.getAttribute("successMessage") %></p>
    <% } %>

    <a href="adminHome.jsp" class="back-link">Back to Admin Home</a>
</body>
</html>
