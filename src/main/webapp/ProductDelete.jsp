<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String alertType = (String) request.getAttribute("alertType");
    String alertMessage = (String) request.getAttribute("alertMessage");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.10.5/font/bootstrap-icons.min.css">
    <title>Delete Product</title>
    <style>
        body {
            background: linear-gradient(to bottom, #f0f4ff, #e0e7ff);
            font-family: Arial, sans-serif;
            margin-top: 80px;
        }

        nav {
            background: linear-gradient(to right, #000000, #434343);
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .navbar .navbar-brand {
            font-size: 1.8rem;
            font-weight: bold;
            color: #fff;
            text-transform: uppercase;
        }

        .navbar-nav .nav-link {
            color: #fff;
            font-size: 1.1rem;
            font-weight: 500;
            transition: background-color 0.3s ease;
        }

        .navbar-nav .nav-link:hover {
            background-color: rgba(255, 255, 255, 0.2);
            border-radius: 5px;
        }

        .container {
            max-width: 600px;
        }

        .form-section {
            background: #ffffff;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .btn-danger {
            background-color: #dc3545;
            border: none;
        }

        .btn-danger:hover {
            background-color: #b02a37;
        }

        footer {
            background: #343a40;
            color: white;
            padding: 15px 0;
            text-align: center;
            margin-top: 50px;
        }

        footer a {
            color: #ffc107;
            text-decoration: none;
        }
    </style>
</head>
<body>

<!-- Navigation Bar -->
<nav class="navbar navbar-expand-lg fixed-top">
    <div class="container-fluid">
        <a class="navbar-brand" href="home.jsp">Product Management</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/homeProduct"><i class="bi bi-house-fill"></i> Home</a></li>
                <li class="nav-item"><a class="nav-link" href="ProductAdd.jsp"><i class="bi bi-plus-square-fill"></i> Add Product</a></li>
                <li class="nav-item"><a class="nav-link" href="ProductUpdate.jsp"><i class="bi bi-pencil-fill"></i> Update Product</a></li>
                <li class="nav-item"><a class="nav-link active" href="ProductDelete.jsp"><i class="bi bi-trash-fill"></i> Delete Product</a></li>
                <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/Product-List"><i class="bi bi-list"></i> Product List</a></li>
            </ul>
        </div>
    </div>
</nav>

<!-- Main Content -->
<div class="container mt-5">
    <% if (alertType != null && alertMessage != null) { %>
    <div class="alert alert-<%= alertType %> alert-dismissible fade show" role="alert">
        <i class="bi <%= alertType.equals("success") ? "bi-check-circle-fill" : "bi-exclamation-circle-fill" %>"></i>
        <%= alertMessage %>
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    </div>
    <% } %>

    <section id="productForm">
        <h2 class="text-center text-primary mb-4">Delete Product</h2>
        <form action="ProductDeleteServlet" method="post" class="p-4 form-section">
            <div class="mb-3">
                <label for="ProductID" class="form-label">Product ID <i class="bi bi-info-circle" title="Enter the Product ID to delete."></i></label>
                <input type="number" class="form-control" name="ProductID" id="ProductID" placeholder="Enter Product ID" required>
            </div>
            <input type="hidden" name="action" value="delete">
            <div class="d-flex justify-content-between">
                <button type="submit" class="btn btn-danger" onclick="return confirm('Are you sure you want to delete this product?')">
                    <i class="bi bi-trash3"></i> Delete Product
                </button>
                <button type="reset" class="btn btn-secondary"><i class="bi bi-arrow-clockwise"></i> Clear</button>
            </div>
        </form>
    </section>
</div>

<footer>
    <p>&copy; 2025 Product Management System. All Rights Reserved. | <a href="#">Privacy Policy</a></p>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script>
    <% if (alertType != null && alertMessage != null) { %>
    Swal.fire({
        icon: '<%= alertType %>', // success, error, warning, info
        title: '<%= alertType.substring(0, 1).toUpperCase() + alertType.substring(1) %>',
        text: '<%= alertMessage %>',
        confirmButtonText: 'OK'
    });
    <% } %>
</script>
</body>
</html>
