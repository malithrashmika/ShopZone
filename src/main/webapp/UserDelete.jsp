<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Delete Account</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script> <!-- SweetAlert2 -->
  <style>
    body {
      background-color: #121212;
      color: #eaeaea;
    }
    .delete-account-container {
      max-width: 400px;
      margin: 50px auto;
      background: #1f1f1f;
      padding: 25px;
      border-radius: 10px;
      box-shadow: 0 6px 10px rgba(0, 0, 0, 0.5);
    }
    .btn-custom {
      background-color: #dc3545;
      color: #fff;
      font-weight: bold;
      border: none;
      border-radius: 4px;
      padding: 10px;
    }
    .btn-custom:hover {
      background-color: #c82333;
    }
    .btn-custom:focus {
      outline: none;
      box-shadow: 0 0 5px rgba(220, 53, 69, 0.8);
    }
    .form-control {
      background-color: #2d2d2d;
      color: #fff;
      border: 1px solid #555;
    }
    .form-control:focus {
      box-shadow: 0 0 5px rgba(0, 123, 255, 0.5);
      border-color: #007bff;
    }
    .text-center a {
      color: #007bff;
    }
    .text-center a:hover {
      text-decoration: underline;
    }
  </style>
</head>
<body>

<div class="container">
  <div class="delete-account-container">
    <h3 class="text-center mb-4">Delete Account</h3>
    <%
      String message = (String) request.getAttribute("message");
      String error = (String) request.getAttribute("error");
    %>
    <% if (message != null) { %>
    <div class="alert alert-success alert-dismissible fade show" role="alert">
      <%= message %>
      <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    </div>
    <% } %>
    <% if (error != null) { %>
    <div class="alert alert-danger alert-dismissible fade show" role="alert">
      <%= error %>
      <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    </div>
    <% } %>

    <form action="DeleteAccountServlet" method="post">
      <div class="mb-3">
        <label for="email" class="form-label">Email</label>
        <input type="email" class="form-control" name="email" id="email" placeholder="Enter your registered email" required>
      </div>
      <div class="mb-3">
        <label for="password" class="form-label">Password</label>
        <input type="password" class="form-control" name="password" id="password" placeholder="Enter your password" required>
      </div>
      <div class="d-grid">
        <button type="submit" class="btn btn-custom" onclick="return confirm('Are you sure you want to delete this account?')">Delete Account</button>
      </div>
      <div class="text-center mt-3">
        <a href="UserUpdate.jsp" class="text-decoration-none">Forgot Password?</a>
      </div>
    </form>
  </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
<script>
  <% if (message != null) { %>
  Swal.fire({
    icon: 'success',
    title: 'Account Deleted',
    text: '<%= message %>',
    confirmButtonColor: '#198754'
  });
  <% } else if (error != null) { %>
  Swal.fire({
    icon: 'error',
    title: 'Error',
    text: '<%= error %>',
    confirmButtonColor: '#dc3545'
  });
  <% } %>
</script>
</body>
</html>
