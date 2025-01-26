<%-- Created by IntelliJ IDEA. User: vishmee Date: 1/21/25 --%>
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
    <title>Product Management - Update Product</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Bootstrap Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.10.5/font/bootstrap-icons.min.css">

    <!-- SweetAlert -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

    <style>
        body {
            background: linear-gradient(to bottom, #eef6fc, #f8fbff);
            font-family: 'Arial', sans-serif;
            color: #333;
        }

        nav {
            background: linear-gradient(to right, #000000, #434343);
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .navbar-brand {
            font-size: 1.8rem;
            font-weight: bold;
            color: #fff;
            text-transform: uppercase;
        }

        .navbar-nav .nav-link {
            color: #fff;
            font-size: 1.1rem;
            padding: 12px 18px;
        }

        .navbar-nav .nav-link:hover {
            background-color: rgba(255, 255, 255, 0.2);
            border-radius: 5px;
        }

        .container {
            margin-top: 100px;
        }

        h2 {
            font-weight: bold;
            color: #0d6efd;
        }

        form {
            background: #ffffff;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            padding: 20px;
        }

        .form-label {
            font-weight: bold;
        }

        footer {
            background: #343a40;
            color: white;
            padding: 10px 0;
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
<nav class="navbar navbar-expand-lg navbar-dark fixed-top">
    <div class="container-fluid">
        <a class="navbar-brand" href="home.jsp">Product Management</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/homeProduct"><i class="bi bi-house-fill"></i> Home</a></li>
                <li class="nav-item"><a class="nav-link" href="ProductAdd.jsp"><i class="bi bi-plus-square-fill"></i> Add Product</a></li>
                <li class="nav-item"><a class="nav-link active" href="ProductUpdate.jsp"><i class="bi bi-pencil-fill"></i> Update Product</a></li>
                <li class="nav-item"><a class="nav-link" href="ProductDelete.jsp"><i class="bi bi-trash-fill"></i> Delete Product</a></li>
                <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/Product-List"><i class="bi bi-list"></i> Product List</a></li>
            </ul>
        </div>
    </div>
</nav>

<!-- Main Content -->
<div class="container my-5 pt-5">
    <%-- Alert Messages --%>
    <% if (alertType != null && alertMessage != null) { %>
    <div class="alert alert-<%= alertType %> alert-dismissible fade show" role="alert">
        <i class="bi <%= alertType.equals("success") ? "bi-check-circle-fill" : "bi-exclamation-circle-fill" %>"></i>
        <%= alertMessage %>
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    </div>
    <% } %>

    <!-- Product Update Form -->
    <section id="productForm" class="mb-5">
        <h2 class="text-center mb-4">Update Product</h2>
        <form action="ProductUpdateServlet" method="post" class="card p-4 shadow-sm">
            <!-- Product ID -->
            <div class="mb-3">
                <label for="ProductID" class="form-label">Product ID</label>
                <input type="number" class="form-control" name="ProductID" id="ProductID" placeholder="Enter Product ID" required>
            </div>
            <!-- Name -->
            <div class="mb-3">
                <label for="name" class="form-label">Name</label>
                <input type="text" name="name" id="name" class="form-control" placeholder="Enter Product Name" required>
            </div>
            <!-- Description -->
            <div class="mb-3">
                <label for="description" class="form-label">Description</label>
                <textarea name="description" id="description" class="form-control" rows="3" placeholder="Enter Product Description" required></textarea>
            </div>
            <!-- Category ID -->
            <div class="mb-3">
                <label for="categoryID" class="form-label">Category ID</label>
                <input type="number" name="categoryID" id="categoryID" class="form-control" placeholder="Enter Category ID" required>
            </div>
            <!-- Price -->
            <div class="mb-3">
                <label for="price" class="form-label">Price</label>
                <input type="number" name="price" id="price" class="form-control" step="0.01" placeholder="Enter Product Price" required>
            </div>
            <!-- Quantity -->
            <div class="mb-3">
                <label for="quantity" class="form-label">Quantity</label>
                <input type="number" name="quantity" id="quantity" class="form-control" placeholder="Enter Quantity" required>
            </div>
            <!-- Image -->
            <div class="mb-3">
                <label for="image" class="form-label">Image</label>
                <input type="file" name="image" id="image" class="form-control" accept="image/*">
            </div>
            <!-- Buttons -->
            <div class="d-flex justify-content-between">
                <button type="submit" class="btn btn-warning" onclick="return confirm('Are you sure you want to update this product?')">
                    <i class="bi bi-pencil-square"></i> Update Product
                </button>
                <button type="reset" class="btn btn-secondary"><i class="bi bi-arrow-clockwise"></i> Clear</button>
            </div>
        </form>
    </section>
</div>

<!-- Footer -->
<footer>
    <p>&copy; 2025 Product Management. All rights reserved. <a href="#">Privacy Policy</a></p>
</footer>

<!-- Scripts -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
<script>
    <% if (alertType != null && alertMessage != null) { %>
    Swal.fire({
        icon: '<%= alertType %>',
        title: '<%= alertMessage %>',
        confirmButtonText: 'OK'
    });
    <% } %>
</script>

</body>
</html>
