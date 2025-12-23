<%@ page session="true" %>
<%
    if (session.getAttribute("currentPatient") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
    int appointmentId = Integer.parseInt(request.getAttribute("appointmentId").toString());
%>
<!DOCTYPE html>
<html>
<head>
    <title>Reschedule Appointment</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body class="p-4">

<h3>Reschedule Appointment</h3>

<form action="RescheduleAppointmentServlet" method="post">
    <input type="hidden" name="appointmentId" value="<%=appointmentId%>">

    <label for="newDate">New Date:</label>
    <input type="date" name="newDate" class="form-control" required 
       min="<%= java.time.LocalDate.now() %>">


    <label for="timeSlot">New Time Slot:</label>
    <input type="time" name="timeSlot" class="form-control mb-3" required>

    <button type="submit" class="btn btn-primary">Reschedule</button>
    <a href="appointmentHistory.jsp" class="btn btn-secondary">Back</a>
</form>

</body>
</html>
