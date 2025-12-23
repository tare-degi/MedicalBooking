<%@ page import="java.util.List" %>
<%@ page import="model.Doctor" %>
<%@ page import="model.Admin" %>
<%@ page session="true" %>
<%
    Admin admin = (Admin) session.getAttribute("currentAdmin");
    if (admin == null) {
        response.sendRedirect("adminLogin.jsp");
        return;
    }

    List<Doctor> doctors = (List<Doctor>) request.getAttribute("doctors");
    
%>
<!DOCTYPE html>
<html>

    <%
    String msg = (String) session.getAttribute("msg");
    if (msg != null) {
        session.removeAttribute("msg");
%>
<script>
    alert("<%= msg %>");
</script>
<% } %>

    
    
<head>
    <title>Manage Doctors</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body class="p-4">

<h2>Manage Doctors</h2>

<a href="AddDoctor.jsp" class="btn btn-success mb-3">Add New Doctor</a>
<%
    String message = (String) session.getAttribute("message");
    if (message != null) {
%>
    <div class="alert alert-success"><%= message %></div>
<%
        session.removeAttribute("message");
    }
%>

<table class="table table-bordered">
    <thead>
        <tr>
            <th>ID</th>
            <th>Full Name</th>
            <th>Email</th>
            <th>Specialization</th>
            <th>Phone</th>
            <th>Action</th> <!-- Removed Status column -->
        </tr>
    </thead>
    <tbody>
        <% if (doctors != null) {
               for (Doctor d : doctors) { %>
        <tr>
            <td><%= d.getId() %></td>
            <td><%= d.getFullName() %></td>
            <td><%= d.getEmail() %></td>
            <td><%= d.getSpecialization() %></td>
            <td><%= d.getPhone() %></td>
            <td>
                <a href="EditDoctorServlet?id=<%=d.getId()%>" class="btn btn-warning btn-sm">Edit</a>
                <!-- Removed Activate/Deactivate button -->
            </td>
        </tr>
        <%   }
           } %>
    </tbody>
</table>

<a href="adminDashboard.jsp" class="btn btn-secondary">Back to Dashboard</a>

</body>
</html>
