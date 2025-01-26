<%@ page import="lk.ijse.DTO.ProductDTO" %>
<%@ page import="java.util.List" %>
<%@ page import="lk.ijse.DAO.LoginDAO" %>
<%@ page import="lk.ijse.DAO.UserDAO" %>
<%@ page import="lk.ijse.DAO.DAOFactory" %>
<%@ page import="lk.ijse.Entity.Login" %>
<%@ page import="lk.ijse.Entity.User" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    String alertType = (String) request.getAttribute("alertType");
    String alertMessage = (String) request.getAttribute("alertMessage");
    List<ProductDTO> dataList = (List<ProductDTO>) request.getAttribute("CustomerHomeProducts");
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
    <title>ShopZone- Home</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <style>
        body {
            background-color: #f5f5f5;
        }

        .navbar {
            background: linear-gradient(to right, #4b6cb7, #182848); /* Blue gradient */
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }

        .navbar .navbar-brand {
            font-size: 1.8rem;
            font-weight: bold;
            color: #fff;
            text-transform: uppercase;
        }

        .navbar-nav .nav-item .nav-link {
            color: #fff;
            font-size: 1.1rem;
            font-weight: 500;
            padding: 12px 18px;
            transition: background-color 0.3s ease;
        }

        .navbar-nav .nav-item .nav-link:hover {
            background-color: rgba(255, 255, 255, 0.2);
            border-radius: 5px;
        }

        .navbar-nav .nav-item .nav-link.active {
            background-color: rgba(255, 255, 255, 0.2);
            color: #fff;
        }


        .product-card {
            background: #fff;
            border: 1px solid #ddd;
            border-radius: 10px;
            transition: all 0.3s;
        }

        .product-card:hover {
            box-shadow: 0 6px 15px rgba(0, 0, 0, 0.15);
            transform: scale(1.02);
        }

        .product-card img {
            width: 100%;
            height: 200px;
            object-fit: cover;
            border-top-left-radius: 10px;
            border-top-right-radius: 10px;
        }

        .btn-primary {
            background-color: #1D1D1D;
            border: none;
        }

        .btn-primary:hover {
            background-color: #333;
        }

        .quantity-input {
            text-align: center;
        }

        .alert {
            margin-top: 20px;
        } .product-card {
              border-radius: 10px;
              overflow: hidden;
              transition: transform 0.3s ease, box-shadow 0.3s ease;
              position: relative;
              background: rgba(255, 255, 255, 0.9);
              border: 1px solid #ccc;
          }

        .product-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2);
        }

        .card-img-wrapper {
            height: 200px;
            overflow: hidden;
            position: relative;
        }

        .product-image {
            height: 100%;
            width: 100%;
            object-fit: cover;
        }

        .add-to-cart-btn {
            background-color: #007bff;
            color: #fff;
            border: none;
        }

        .add-to-cart-btn:hover {
            background-color: #0056b3;
        }

        .quantity-input {
            text-align: center;
            border: 1px solid #ccc;
        }

        .card-title {
            font-size: 1.2rem;
            color: #000;
        }

        .card-text {
            color: #000;
            font-size: 0.9rem;
        }
        .form-control {
            border-radius: 5px;
            padding: 10px;
            background-color: #fff;
        }

        .btn-outline-success {
            color: #000;
            border-color: #ccc;
            border-radius: 5px;
            padding: 8px 20px;
        }

        .btn-outline-success:hover {
            background-color: #f0f0f0;
            color: #000;
        }

        section {
            background-color: #f8f9fa; /* Light background */
        }

        .Card {
            position: relative;
            top: -50px;
        }
    </style>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark">
    <div class="container">
        <a class="navbar-brand" href="#">ShopZone</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <% if(user.getRole().equals("Admin")) { %>
            <ul class="navbar-nav me-auto">
                <li class="nav-item"><a class="nav-link active" href="${pageContext.request.contextPath}/homeProduct">Home</a></li>
                <li class="nav-item"><a class="nav-link" href="Category.jsp">Category</a></li>
                <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/Product-List">Products</a></li>
                <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/CheckoutServlet">Cart</a></li>
                <li class="nav-item"><a class="nav-link" href="#">Order</a></li>
                <li class="nav-item"><a class="nav-link" href="UserDelete.jsp">Account</a></li>
                <li class="nav-item"><a class="nav-link" href="index.jsp">Log out</a></li>
            </ul>
            <% } else if (user.getRole().equals("Customer")) { %>
            <ul class="navbar-nav me-auto">
                <li class="nav-item"><a class="nav-link active" href="${pageContext.request.contextPath}/CustomerHomeProduct">Home</a></li>
                <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/CheckoutServlet">Cart</a></li>
                <li class="nav-item"><a class="nav-link" href="#">Order</a></li>
                <li class="nav-item"><a class="nav-link" href="UserDelete.jsp">Account</a></li>
                <li class="nav-item"><a class="nav-link" href="index.jsp">Log out</a></li>
            </ul>
            <% } %>
            <form class="d-flex">
                <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                <button class="btn btn-outline-success" type="submit">Search</button>
            </form>
        </div>
    </div>
</nav>

<div class="container mt-4">
    <% if (alertType != null && alertMessage != null) { %>
    <div class="alert alert-<%= alertType %> alert-dismissible fade show" role="alert">
        <%= alertMessage %>
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    </div>
    <% } %>

    <h2 class="text-center mb-4">Adventuring Products</h2>

    <div class="row">
        <% if (dataList != null && !dataList.isEmpty()) { %>
        <% for (ProductDTO productDTO : dataList) { %>
        <div class="col-md-4 col-lg-3 mb-4">
            <div class="product-card">
                <img src="assets/<%= productDTO.getImagePath() %>" alt="<%= productDTO.getName() %>">
                <div class="p-3">
                    <h5 class="fw-bold"><%= productDTO.getName() %></h5>
                    <p class="text-muted">Price: $<%= productDTO.getPrice() %></p>
                    <p class="small">Description: <%= productDTO.getDescription() %></p>
                    <p class="small text-muted">Available Stock: <%= productDTO.getQuantity() %></p>
                    <form action="AddToCartServlet" method="post">
                        <div class="mb-3">
                            <label for="quantity_<%= productDTO.getProductId() %>" class="form-label">Quantity</label>
                            <input type="number" id="quantity_<%= productDTO.getProductId() %>" name="quantity" class="form-control quantity-input" min="1" max="<%= productDTO.getQuantity() %>" required>
                        </div>
                        <button type="submit" class="btn btn-primary w-100">Add to Cart</button>
                    </form>
                </div>
            </div>
        </div>
        <% } %>
        <% } else { %>
        <div class="col-12">
            <p class="text-center text-muted">No products available.</p>
        </div>
        <% } %>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
<script>
    const alertType = '<%= alertType != null ? alertType : "" %>';
    const alertMessage = '<%= alertMessage != null ? alertMessage.replace("'", "\\'") : "" %>';

    if (alertType && alertMessage) {
        Swal.fire({
            icon: alertType, // Expected types: 'success', 'error', 'warning', 'info', 'question'
            title: alertType.charAt(0).toUpperCase() + alertType.slice(1),
            text: alertMessage,
            confirmButtonText: 'OK'
        }).then(() => {
            // Redirect after success (optional)
            if (alertType === 'success') {
                window.location.href = '<%= request.getContextPath() %>/homeProduct'; // Update as needed
            }
        });
    }
</script>
git

</body>
</html>
