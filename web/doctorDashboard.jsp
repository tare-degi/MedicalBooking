<%@ page import="java.util.List" %>
<%@ page import="model.Appointment" %>
<%@ page import="model.Doctor" %>
<%@ page session="true" %>
<%
    Doctor doctor = (Doctor) session.getAttribute("currentDoctor");
    if (doctor == null) {
        response.sendRedirect("doctorLogin.jsp");
        return;
    }

    List<Appointment> appointments = (List<Appointment>) request.getAttribute("appointments");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Doctor Dashboard</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body class="p-4">

<h2>Welcome Dr. <%= doctor.getFullName() %></h2>

<table class="table table-bordered">
    <thead>
        <tr>
            <th>Patient</th>
            <th>Date</th>
            <th>Time</th>
            <th>Symptoms</th>
            <th>Status</th>
            <th>Action</th>
        </tr>
    </thead>
    <tbody>
    <% for (Appointment a : appointments) { %>
        <tr>
            <td><%= a.getPatientName() %></td>
            <td><%= a.getAppointmentDate() %></td>
            <td><%= a.getTimeSlot() %></td>
            <td><%= a.getSymptoms() %></td>
            <td><%= a.getStatus() %></td>
            <td>
                <% if ("PENDING".equals(a.getStatus())) { %>

                 <a href="UpdateAppointmentStatusServlet?id=<%=a.getId()%>&status=CONFIRMED"
                     class="btn btn-success btn-sm">Approve</a>

                 <a href="UpdateAppointmentStatusServlet?id=<%=a.getId()%>&status=REJECTED"
                    class="btn btn-danger btn-sm">Reject</a>

                   <% } else { %>
                    <span class="badge bg-secondary"><%= a.getStatus() %></span>
                 <% } %>
            </td>

        </tr>
    <% } %>
    </tbody>
</table>

</body>
</html>
