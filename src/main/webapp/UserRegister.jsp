<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Registration</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            margin: 0;
            padding: 0;
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            background: url('webImage/Screenshot from 2025-01-25 01-45-26.png') no-repeat center center/cover;
            animation: fadeIn 1.5s ease-in-out;
        }

        @keyframes fadeIn {
            0% { opacity: 0; }
            100% { opacity: 1; }
        }

        .container {
            width: 90%;
            max-width: 1000px;
            display: flex;
            flex-wrap: wrap;
            border-radius: 20px;
            overflow: hidden;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.3);
            background: rgba(0, 0, 0, 0.7);
            backdrop-filter: blur(10px);
            color: white;
        }

        .image-container {
            flex: 1;
            display: flex;
            overflow: hidden;
        }

        .image-container img {
            width: 100%;
            height: auto;
            object-fit: cover;
            opacity: 0;
            position: absolute;
            animation: slideshow 15s infinite;
        }

        .image-container img:nth-child(1) { animation-delay: 0s; }
        .image-container img:nth-child(2) { animation-delay: 5s; }
        .image-container img:nth-child(3) { animation-delay: 10s; }

        @keyframes slideshow {
            0%, 100% { opacity: 0; }
            33% { opacity: 1; }
        }

        .form-container {
            flex: 1;
            padding: 40px;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }

        .form-container h3 {
            margin-bottom: 20px;
            text-align: center;
            font-size: 28px;
            font-weight: bold;
        }

        .form-container .form-control {
            background: rgba(255, 255, 255, 0.1);
            color: white;
            border: 1px solid rgba(255, 255, 255, 0.5);
            border-radius: 10px;
            padding: 10px;
            transition: all 0.3s ease;
        }

        .form-container .form-control:focus {
            background: rgba(255, 255, 255, 0.2);
            border-color: #007bff;
            box-shadow: 0 0 8px rgba(0, 123, 255, 0.7);
        }

        .form-container .register-btn {
            background: #007bff;
            border: none;
            border-radius: 20px;
            padding: 10px;
            font-size: 16px;
            color: white;
            font-weight: bold;
            transition: all 0.3s ease;
        }

        .form-container .register-btn:hover {
            background: #0056b3;
            transform: scale(1.05);
        }

        .text-center a {
            text-decoration: none;
            font-weight: bold;
            color: #28a745;
            transition: color 0.3s ease;
        }

        .text-center a:hover {
            color: #1e7e34;
        }

        @media (max-width: 768px) {
            .container {
                flex-direction: column;
                border-radius: 10px;
            }

            .image-container {
                height: 200px;
            }

            .form-container {
                padding: 20px;
            }
        }
    </style>
</head>
<body>
<div class="container">
    <!-- Image Container -->
    <div class="image-container">
        <img src="webImage/philipp-pilz-iQRKBNKyRpo-unsplash.jpg" alt="Slide 1">
        <img src="webImage/philipp-pilz-QZ2EQuPpQJs-unsplash.jpg" alt="Slide 2">
        <img src="webImage/Faroe%20Island%20with%20@andreknot%20-%20Aries%20Gold%20El%20Toro….jpeg" alt="Slide 3">
    </div>

    <!-- Form Container -->
    <div class="form-container">
        <h3>User Registration</h3>

        <%
            String message = request.getAttribute("message") != null ? (String) request.getAttribute("message") : null;
            String error = request.getAttribute("error") != null ? (String) request.getAttribute("error") : null;
        %>

        <% if (message != null) { %>
        <div class="alert alert-success"><%= message %></div>
        <% } %>

        <% if (error != null) { %>
        <div class="alert alert-danger"><%= error %></div>
        <% } %>

        <form action="registerServlet" method="post">
            <div class="mb-3">
                <label for="username" class="form-label">Username</label>
                <input type="text" class="form-control" name="username" id="username" placeholder="Enter your username" required>
            </div>
            <div class="mb-3">
                <label for="email" class="form-label">Email</label>
                <input type="email" class="form-control" name="email" id="email" placeholder="Enter your email" required>
            </div>
            <div class="mb-3">
                <label for="password" class="form-label">Password</label>
                <input type="password" class="form-control" name="password" id="password" placeholder="Enter your password" required>
            </div>
            <div class="mb-3">
                <label for="confirmPassword" class="form-label">Confirm Password</label>
                <input type="password" class="form-control" name="confirmPassword" id="confirmPassword" placeholder="Confirm your password" required>
            </div>

            <div class="d-grid">
                <button type="submit" class="btn register-btn">Register</button>
            </div>

            <div class="text-center mt-3">
                <a href="index.jsp">Already have an account? Login</a>
            </div>
        </form>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
