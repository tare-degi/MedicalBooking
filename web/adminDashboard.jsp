<%@ page session="true" %>
<%@ page import="model.Admin" %>
<%
    Admin admin = (Admin) session.getAttribute("currentAdmin");
    if (admin == null) {
        response.sendRedirect("adminLogin.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body class="p-4">
    <h2>Welcome, Admin!</h2>
    <div class="mb-3">
        <a href="ManageDoctorsServlet" class="btn btn-primary">Manage Doctors</a>
        <a href="manageDepartments.jsp" class="btn btn-secondary">Manage Departments</a>
        <a href="AdminLogoutServlet" class="btn btn-danger">Logout</a>
    </div>
</body>
</html>
