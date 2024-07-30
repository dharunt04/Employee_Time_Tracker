<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Add Task</title>
<style>
    body {
        font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif;
        background-color: #f0f2f5;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
        margin: 0;
        color: #333;
    }

    .container {
        background: #ffffff;
        padding: 30px;
        border-radius: 10px;
        box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
        width: 450px;
        max-width: 100%;
    }

    h1 {
        margin-bottom: 25px;
        color: #2c3e50;
        font-size: 24px;
        text-align: center;
    }

    label {
        display: block;
        margin: 15px 0 5px;
        font-weight: 600;
        color: #34495e;
    }

    input[type="date"], input[type="time"], input[type="text"] {
        width: 100%;
        padding: 12px;
        margin-bottom: 20px;
        border: 1px solid #ccc;
        border-radius: 5px;
        box-sizing: border-box;
        transition: border-color 0.3s;
    }

    input[type="date"]:focus, input[type="time"]:focus, input[type="text"]:focus {
        border-color: #3498db;
    }

    input[type="submit"] {
        background-color: #3498db;
        color: white;
        padding: 12px;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        font-size: 16px;
        transition: background-color 0.3s;
    }

    input[type="submit"]:hover {
        background-color: #2980b9;
    }

    .error {
        color: #e74c3c;
        font-size: 14px;
        margin-bottom: 20px;
        text-align: center;
    }

    .back-link {
        display: block;
        margin-top: 20px;
        text-align: center;
        color: #3498db;
        text-decoration: none;
        transition: color 0.3s;
    }

    .back-link:hover {
        color: #2980b9;
    }
</style>
<script>
    function validateTimes() {
        var taskDate = document.querySelector('input[name="taskDate"]').value;
        var startTime = document.querySelector('input[name="startTime"]').value;
        var endTime = document.querySelector('input[name="endTime"]').value;
        var category = document.querySelector('input[name="category"]').value.trim();
        var description = document.querySelector('input[name="description"]').value.trim();
        var projectname = document.querySelector('input[name="projectname"]').value.trim();
        var errorMessage = document.getElementById('error-message');
        errorMessage.textContent = '';

        // Get current date and month
        var currentDate = new Date();
        var currentYear = currentDate.getFullYear();
        var currentMonth = currentDate.getMonth() + 1; // Months are zero-based

        // Check if task date is greater than 2024 and current month
        if (taskDate) {
            var taskYear = parseInt(taskDate.split('-')[0]);
            var taskMonth = parseInt(taskDate.split('-')[1]);

            if (taskYear > 2024 || (taskYear === 2024 && taskMonth > currentMonth)) {
                errorMessage.textContent = "Please enter a valid date not later than 2024 and the current month.";
                return false;
            }
        }

        if (startTime && endTime) {
            // Convert times to Date objects for comparison
            var start = new Date("1970-01-01T" + startTime + ":00Z");
            var end = new Date("1970-01-01T" + endTime + ":00Z");

            if (end <= start) {
                errorMessage.textContent = "End Time must be later than Start Time.";
                return false;
            }
        }

        if (category === "" || description === "" || projectname === "") {
            errorMessage.textContent = "Please fill out all fields.";
            return false;
        }

        return true;
    }
</script>
</head>
<body>
    <div class="container">
        <h1>Add Task</h1>
        <form action="AddTaskServlet" method="post" onsubmit="return validateTimes()">
            <label for="taskDate">Date:</label>
            <input type="date" id="taskDate" name="taskDate" required>
            
            <label for="startTime">Start Time:</label>
            <input type="time" id="startTime" name="startTime" required>
            
            <label for="endTime">End Time:</label>
            <input type="time" id="endTime" name="endTime" required>
            
            <label for="category">Category:</label>
            <input type="text" id="category" name="category" required>
            
            <label for="description">Description:</label>
            <input type="text" id="description" name="description" required>
            
            <label for="projectname">Project Name:</label>
            <input type="text" id="projectname" name="projectname" required>
            
            <input type="submit" value="Add Task">
            <p id="error-message" class="error"></p>
        </form>
        <% if (request.getAttribute("error") != null) { %>
        <p class="error"><%= request.getAttribute("error") %></p>
        <% } %>
        <a href="employeeHome.jsp" class="back-link">Back to Employee Home</a>
    </div>
</body>
</html>
