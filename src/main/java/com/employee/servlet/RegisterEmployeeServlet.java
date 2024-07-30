package com.employee.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import com.employee.model.User;
import com.employee.util.DatabaseConnection;
import com.employee.util.UserDAO; // Import the PasswordUtility class

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/RegisterEmployeeServlet")
public class RegisterEmployeeServlet extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String name = request.getParameter("name");
		String role = request.getParameter("role");
		String username = request.getParameter("username");
		String password = request.getParameter("password");

		// Hash the password
		String hashedPassword = com.employee.util.PasswordUtility.hashPassword(password);

		User user = new User();
		user.setName(name);
		user.setRole(role);
		user.setUsername(username);
		user.setPassword(hashedPassword); // Set the hashed password

		String employeeId;
		try (Connection connection = DatabaseConnection.getConnection()) {
			UserDAO userDAO = new UserDAO(connection);
			employeeId = userDAO.addUser(user);
		} catch (SQLException e) {
			throw new ServletException("Unable to register employee", e);
		}

		request.setAttribute("successMessage", "Employee registered successfully with ID: " + employeeId);
		request.getRequestDispatcher("registerEmployee.jsp").forward(request, response);
	}
}
