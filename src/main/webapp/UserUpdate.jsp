<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Forgot Password</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script> <!-- SweetAlert2 -->
    <style>
        body {
            background-color: #121212;
            color: #eaeaea;
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            margin: 0;
            font-family: 'Arial', sans-serif;
        }

        .forgot-password-container {
            max-width: 400px;
            width: 100%;
            background: #1f1f1f;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 8px 15px rgba(0, 0, 0, 0.4);
        }

        .forgot-password-container h3 {
            text-align: center;
            margin-bottom: 20px;
            font-size: 24px;
            font-weight: bold;
        }

        .submit-btn {
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 5px;
            font-weight: bold;
            padding: 10px;
            width: 100%;
            transition: background-color 0.3s ease, transform 0.2s ease;
        }

        .submit-btn:hover {
            background-color: #0056b3;
            transform: scale(1.03);
            cursor: pointer;
        }

        .submit-btn:focus {
            box-shadow: 0 0 8px rgba(0, 123, 255, 0.7);
            outline: none;
        }

        .form-control {
            background-color: #2d2d2d;
            color: #fff;
            border: 1px solid #555;
            border-radius: 5px;
            padding: 10px;
            transition: border-color 0.3s ease, box-shadow 0.3s ease;
        }

        .form-control:focus {
            border-color: #007bff;
            box-shadow: 0 0 8px rgba(0, 123, 255, 0.7);
        }

        .form-label {
            font-size: 14px;
            font-weight: 600;
            margin-bottom: 5px;
            display: block;
        }

        .alert {
            border-radius: 5px;
            font-size: 14px;
            margin-bottom: 20px;
        }

        .text-center a {
            color: #007bff;
            font-weight: bold;
            text-decoration: none;
            display: inline-block;
            margin-top: 10px;
        }

        .text-center a:hover {
            text-decoration: underline;
        }

        @media (max-width: 768px) {
            .forgot-password-container {
                padding: 20px;
            }
        }
    </style>
</head>
<body>
<div class="container">
    <div class="forgot-password-container">
        <h3>Forgot Password</h3>

        <%
            String message = (String) request.getAttribute("message");
            String error = (String) request.getAttribute("error");
        %>

        <% if (message != null) { %>
        <div class="alert alert-success"><%= message %></div>
        <% } %>
        <% if (error != null) { %>
        <div class="alert alert-danger"><%= error %></div>
        <% } %>

        <form action="ForgotPasswordServlet" method="post">
            <div class="mb-3">
                <label for="email" class="form-label">Enter Your Email</label>
                <input type="email" class="form-control" name="email" id="email" placeholder="Enter your registered email" required>
            </div>
            <div class="mb-3">
                <label for="newPassword" class="form-label">New Password</label>
                <input type="password" class="form-control" name="newPassword" id="newPassword" placeholder="Enter new password" required>
            </div>
            <div class="mb-3">
                <label for="confirmPassword" class="form-label">Confirm Password</label>
                <input type="password" class="form-control" name="confirmPassword" id="confirmPassword" placeholder="Re-enter new password" required>
            </div>
            <div class="d-grid">
                <button type="submit" class="btn submit-btn">Change Password</button>
            </div>
        </form>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
<script>
    <% if (message != null) { %>
    Swal.fire({
        icon: 'success',
        title: 'Success',
        text: '<%= message %>',
    });
    <% } else if (error != null) { %>
    Swal.fire({
        icon: 'error',
        title: 'Error',
        text: '<%= error %>',
    });
    <% } %>
</script>
</body>
</html>
