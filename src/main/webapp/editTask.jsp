<%@ page import="com.employee.model.Task"%>
<%@ page import="com.employee.util.TaskDAO"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="com.employee.util.DatabaseConnection"%>
<%@ page import="java.sql.SQLException"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Edit Task</title>
<style>
body {
	font-family: Arial, sans-serif;
	background-color: #f4f4f9;
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100vh;
	margin: 0;
	color: #333;
}

.container {
	background: #fff;
	padding: 20px;
	border-radius: 8px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	width: 400px;
	max-width: 100%;
}

h1 {
	margin-bottom: 20px;
	color: #333;
}

label {
	display: block;
	margin: 10px 0 5px;
	font-weight: bold;
}

input[type="date"], input[type="time"], input[type="text"], input[type="password"]
	{
	width: 100%;
	padding: 8px;
	margin-bottom: 15px;
	border: 1px solid #ddd;
	border-radius: 4px;
	box-sizing: border-box;
}

input[type="submit"] {
	background-color: #007BFF;
	color: white;
	padding: 10px;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	font-size: 16px;
	transition: background-color 0.3s;
}

input[type="submit"]:hover {
	background-color: #0056b3;
}

.error-message {
	color: red;
	font-size: 14px;
	margin-top: 10px;
}

.back-link {
	display: block;
	margin-top: 20px;
	text-align: center;
}
</style>
<script>
    function validateTime() {
        var startTime = document.getElementsByName('startTime')[0].value;
        var endTime = document.getElementsByName('endTime')[0].value;
        
        if (startTime && endTime) {
            var start = new Date("1970-01-01T" + startTime + "Z");
            var end = new Date("1970-01-01T" + endTime + "Z");
            
            if (end <= start) {
                alert("End time must be after the start time.");
                return false;
            }
        }
        return true;
    }
</script>
</head>
<body>
	<div class="container">
		<h1>Edit Task</h1>
		<%
            String taskId = request.getParameter("id");
            Task task = null;
            try (Connection connection = DatabaseConnection.getConnection()) {
                TaskDAO taskDAO = new TaskDAO(connection);
                task = taskDAO.getTaskById(taskId);
            } catch (SQLException e) {
                throw new ServletException("Unable to retrieve task details", e);
            }

            if (task == null) {
                out.println("<p class='error-message'>Task not found.</p>");
            } else {
        %>
		<form action="ManageTaskServlet" method="post"
			onsubmit="return validateTime()">
			<input type="hidden" name="id" value="<%=task.getId()%>"> <label
				for="date">Date:</label> <input type="date" id="date" name="date"
				value="<%=task.getDate()%>" required> <label for="startTime">Start
				Time:</label> <input type="time" id="startTime" name="startTime"
				value="<%=task.getStartTime()%>" required> <label
				for="endTime">End Time:</label> <input type="time" id="endTime"
				name="endTime" value="<%=task.getEndTime()%>" required> <label
				for="category">Category:</label> <input type="text" id="category"
				name="category" value="<%=task.getCategory()%>" required> <label
				for="description">Description:</label> <input type="text"
				id="description" name="description"
				value="<%=task.getDescription()%>" required> <input
				type="hidden" name="action" value="update"> <input
				type="submit" value="Update">
		</form>
		<a href="employeeHome.jsp" class="back-link">Back to Employee Home</a>
		<% } %>
	</div>
</body>
</html>
