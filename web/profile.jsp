<%@ page import="model.Patient" %>
<%@ page session="true" %>
<%
    Patient patient = (Patient) session.getAttribute("currentPatient");
    if (patient == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>My Profile</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="p-4">

<h2>My Profile</h2>

<form action="ProfileServlet" method="post">
    <label>Full Name:</label>
    <input type="text" name="fullName" value="<%=patient.getFullName()%>" class="form-control mb-2" required>

    <label>Email:</label>
    <input type="email" name="email" value="<%=patient.getEmail()%>" class="form-control mb-2" required>

    <label>Phone:</label>
    <input type="text" name="phone" value="<%=patient.getPhone()%>" class="form-control mb-2" required>

    <button type="submit" class="btn btn-primary">Update Profile</button>
</form>

<a href="patientDashboard.jsp" class="btn btn-secondary mt-3">Back to Dashboard</a>

</body>
</html>
