<%@ page import="java.util.List" %>
<%@ page import="model.Doctor" %>
<%@ page session="true" %>

<%
    if (session.getAttribute("currentPatient") == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    List<Doctor> doctors = (List<Doctor>) request.getAttribute("doctors");
%>

<!DOCTYPE html>
<html>
<head>
    <title>Book Appointment</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body class="p-4">

<h2>Book an Appointment</h2>

<% if (request.getParameter("error") != null) { %>
    <div class="alert alert-danger">Selected time slot is not available. Please choose another.</div>
<% } %>

<form action="AppointmentServlet" method="post">
    <div class="mb-3">
        <label for="doctorId" class="form-label">Select Doctor</label>
        <select name="doctorId" id="doctorId" class="form-select" required>
            <% for (Doctor d : doctors) { %>
                <option value="<%= d.getId() %>"><%= d.getFullName() %> - <%= d.getSpecialization() %></option>
            <% } %>
        </select>
    </div>

    <div class="mb-3">
        <label for="appointmentDate">Select Date:</label>
        <input type="date" name="appointmentDate" class="form-control mb-3" 
       required min="<%= java.time.LocalDate.now() %>">

    </div>

    <div class="mb-3">
        <label for="timeSlot" class="form-label">Time Slot</label>
        <input type="time" name="timeSlot" id="timeSlot" class="form-control" required>
    </div>

    <div class="mb-3">
        <label for="symptoms" class="form-label">Symptoms / Reason</label>
        <textarea name="symptoms" id="symptoms" class="form-control" rows="3"></textarea>
    </div>

    <button type="submit" class="btn btn-primary">Book Appointment</button>
</form>

<p><a href="patientDashboard.jsp" class="btn btn-secondary mt-3">Back to Dashboard</a></p>
<a href="appointmentHistory.jsp" class="btn btn-secondary mt-3">View Appointment History</a>

</body>
</html>
