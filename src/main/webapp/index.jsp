<%@ page import="lk.ijse.DAO.LoginDAO" %>
<%@ page import="lk.ijse.DAO.UserDAO" %>
<%@ page import="lk.ijse.DAO.DAOFactory" %>
<%@ page import="lk.ijse.Entity.Login" %>
<%@ page import="lk.ijse.Entity.User" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    UserDAO userDAO = (UserDAO) DAOFactory.getDaoFactory().getDAO(DAOFactory.DaoType.User);
    LoginDAO loginDAO = (LoginDAO) DAOFactory.getDaoFactory().getDAO(DAOFactory.DaoType.Login);
    Login login = loginDAO.getLastLogin();
    User user = userDAO.searchByEmail(login.getUserMail());
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - ShopZone</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        /* General body styles */
        body {
            background-color: #f8f9fa;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            margin: 0;
        }

        /* Centered login form container */
        .login-container {
            display: flex;
            border-radius: 20px;
            overflow: hidden;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
            background: white;
            width: 100%;
            max-width: 500px;
            height: 70vh;
            justify-content: center;
            align-items: center;  /* Vertically and horizontally center the form */
            padding: 20px;
        }

        /* Right Form Section */
        .login-form {
            width: 100%;
            padding: 20px;
        }

        .login-form h3 {
            text-align: center;
            font-size: 35px;
            margin-bottom: 30px;
            color: #333;
        }

        .login-btn {
            background-color: #000;
            color: white;
            border-radius: 25px;
            padding: 12px;
            transition: background-color 0.3s ease, transform 0.3s ease;
        }

        .login-btn:hover {
            background-color: #444;
            transform: scale(1.05);
        }

        /* Footer Links */
        .text-center a {
            text-decoration: none;
            color: #000;
            border: 2px solid #000;
            padding: 10px 20px;
            border-radius: 20px;
        }

        .text-center a:hover {
            background-color: #f8f9fa;
        }

        /* Media Queries */
        @media (max-width: 768px) {
            .login-container {
                flex-direction: column;
                height: auto;
            }

            .login-form {
                padding: 20px;
            }
        }
    </style>
</head>
<body>

<div class="login-container">
    <!-- Right Form Section -->
    <div class="login-form">
        <h3>Login To ShopZone</h3>

        <% String error = (String) request.getAttribute("error"); %>
        <% if (error != null) { %>
        <div class="alert alert-danger"><%= error %></div>
        <% } %>

        <form action="loginServlet" method="post">

            <!-- Email input -->
            <div class="mb-3">
                <label for="username" class="form-label">Email</label>
                <input type="text" class="form-control" name="username" id="username" placeholder="Enter your email" required>
            </div>

            <!-- Password input -->
            <div class="mb-3">
                <label for="password" class="form-label">Password</label>
                <input type="password" class="form-control" name="password" id="password" placeholder="Enter your password" required>
            </div>

            <!-- Remember Me -->
            <div class="form-check mb-3">
                <input class="form-check-input" type="checkbox" id="rememberMe" name="rememberMe">
                <label class="form-check-label" for="rememberMe">Remember Me</label>
            </div>

            <!-- Submit Button -->
            <div class="d-grid mb-3">
                <button type="submit" class="btn login-btn">Login</button>
            </div>
        </form>

        <!-- Register Link -->
        <div class="text-center">
            <a href="UserRegister.jsp" class="btn btn-outline-dark">Don't have an account? Register</a>
        </div>

        <!-- Forgot Password Link -->
        <div class="text-center mt-3">
            <a href="UserUpdate.jsp">Forgot Password?</a>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
