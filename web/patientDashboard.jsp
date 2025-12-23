<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="model.Patient" %>
<%@ page session="true" %>
<%
    Patient p = (Patient) session.getAttribute("currentPatient");
    if (p == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Patient Dashboard</title>
</head>
<body>
<h2>Welcome, <%= ((Patient)session.getAttribute("currentPatient")).getFullName() %></h2>
<p>Email: <%= ((Patient)session.getAttribute("currentPatient")).getEmail() %></p>
<p><a href="logout.jsp">Logout</a></p>
<!-- Book Appointment Button -->
<a href="AppointmentServlet" class="btn btn-primary">Book Appointment</a>
<a href="ProfileServlet" class="btn btn-primary">My Profile</a>




</body>
</html>
