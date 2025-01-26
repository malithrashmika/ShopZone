<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.Objects" %>
<%@ page import="java.util.List" %>
<%@ page import="lk.ijse.DTO.CategoryDTO" %>
<%@ page import="lk.ijse.DAO.UserDAO" %>
<%@ page import="lk.ijse.DAO.DAOFactory" %>
<%@ page import="lk.ijse.DAO.LoginDAO" %>
<%@ page import="lk.ijse.Entity.Login" %>
<%@ page import="lk.ijse.Entity.User" %>
<%
    String alertType = (String) request.getAttribute("alertType");
    String alertMessage = (String) request.getAttribute("alertMessage");
    List<CategoryDTO> dataList = (List<CategoryDTO>) request.getAttribute("categories");
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
    <title>Category Management</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <style>
        body {
            background-color: #f8f9fa;
            font-family: 'Arial', sans-serif;
        }
        .navbar {
            background: linear-gradient(to right, #000000, #434343);
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }
        .navbar .navbar-brand {
            font-size: 1.8rem;
            font-weight: bold;
            color: #fff;
            text-transform: uppercase;
        }
        .table-responsive {
            margin-top: 30px;
        }
        .table-header {
            background-color: #4CAF50;
            color: white;
        }
        .btn-warning, .btn-danger {
            display: inline-flex;
            align-items: center;
        }
        .btn-warning i, .btn-danger i {
            margin-right: 5px;
        }
    </style>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">Adventure Mart</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav me-auto">
                <li class="nav-item"><a class="nav-link active" href="${pageContext.request.contextPath}/homeProduct">Home</a></li>
                <li class="nav-item"><a class="nav-link" href="Category.jsp">Category</a></li>
                <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/Product-List">Products</a></li>
                <li class="nav-item"><a class="nav-link" href="index.jsp">Log out</a></li>
            </ul>
            <form class="d-flex" action="" method="get">
                <input class="form-control me-2" type="search" name="query" placeholder="Search categories..." required>
                <button class="btn btn-outline-success" type="submit">Search</button>
            </form>
        </div>
    </div>
</nav>
<div class="container mt-4">
    <h3 class="text-center mb-4">Category Management</h3>
    <% if (alertMessage != null && alertType != null) { %>
    <div class="alert alert-<%= alertType %> text-center" role="alert">
        <%= alertMessage %>
    </div>
    <% } %>
    <section>
        <% if (dataList != null && !dataList.isEmpty()) { %>
        <div class="table-responsive">
            <table class="table table-striped table-bordered">
                <thead class="table-header">
                <tr>
                    <th>#</th>
                    <th>Category</th>
                    <th>Actions</th>
                </tr>
                </thead>
                <tbody>
                <% for (CategoryDTO categoryDTO : dataList) { %>
                <tr>
                    <td><%= categoryDTO.getCategoryId() %></td>
                    <td><%= categoryDTO.getName() %></td>
                    <td>
                        <button class="btn btn-warning btn-sm" onclick="editCategory(<%= categoryDTO.getCategoryId() %>, '<%= categoryDTO.getName() %>')">
                            <i class="bi bi-pencil"></i> Edit
                        </button>
                        <button class="btn btn-danger btn-sm" onclick="deleteCategory(<%= categoryDTO.getCategoryId() %>)">
                            <i class="bi bi-trash"></i> Delete
                        </button>
                    </td>
                </tr>
                <% } %>
                </tbody>
            </table>
        </div>
        <% } else { %>
        <p class="text-center text-muted">No categories found.</p>
        <% } %>
    </section>
</div>
<script>
    function editCategory(id, name) {
        Swal.fire(`Edit Category`, `Edit functionality for ${name} is not implemented.`, 'info');
    }

    function deleteCategory(id) {
        Swal.fire({
            title: 'Are you sure?',
            text: 'This action cannot be undone!',
            icon: 'warning',
            showCancelButton: true,
            confirmButtonText: 'Yes, delete it!',
            cancelButtonText: 'No, cancel',
        }).then((result) => {
            if (result.isConfirmed) {
                Swal.fire('Deleted!', 'The category has been deleted.', 'success');
                // Actual deletion logic here.
            }
        });
    }
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
