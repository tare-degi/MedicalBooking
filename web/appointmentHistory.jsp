<%@ page import="java.util.List" %>
<%@ page import="model.Appointment" %>
<%@ page import="dao.AppointmentDAO" %>
<%@ page import="model.Patient" %>
<%@ page session="true" %>

<%
    Patient patient = (Patient) session.getAttribute("currentPatient");
    if (patient == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    AppointmentDAO dao = new AppointmentDAO();
    List<Appointment> appointments = dao.getAppointmentsByPatient(patient.getId());
%>

<!DOCTYPE html>
<html>
<head>
    <title>Appointment History</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body class="p-4">

<h2>Your Appointments</h2>

<table class="table table-bordered">
    <thead>
        <tr>
            <th>Doctor</th>
            <th>Date</th>
            <th>Time</th>
            <th>Symptoms</th>
            <th>Status</th>
            <th>Actions</th>
        </tr>
    </thead>
    <tbody>
    <% for (Appointment a : appointments) { %>
        <tr>
            <td><%= a.getDoctorName() %></td>
            <td><%= a.getAppointmentDate() %></td>
            <td><%= a.getTimeSlot() %></td>
            <td><%= a.getSymptoms() %></td>
            <td><%= a.getStatus() %></td>
            <td>
                <% if(a.getStatus().equals("PENDING") || a.getStatus().equals("CONFIRMED")) { %>
                    <a href="CancelAppointmentServlet?id=<%=a.getId()%>" class="btn btn-danger btn-sm">Cancel</a>
                    <a href="RescheduleAppointmentServlet?id=<%=a.getId()%>" class="btn btn-warning btn-sm">Reschedule</a>
                <% } %>
            </td>
        </tr>
    <% } %>
    </tbody>
</table>


<p><a href="patientDashboard.jsp" class="btn btn-secondary">Back to Dashboard</a></p>

</body>
</html>
