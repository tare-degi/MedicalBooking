<!DOCTYPE html>
<html>
<head>
    <title>Add Doctor</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body class="p-4">

<h2>Add New Doctor</h2>

<form action="AddDoctorServlet" method="post">
    <div class="mb-3">
        <label>Full Name</label>
        <input type="text" name="fullName" class="form-control" required>
    </div>
    <div class="mb-3">
        <label>Email</label>
        <input type="email" name="email" class="form-control" required>
    </div>
    <div class="mb-3">
        <label>Specialization</label>
        <input type="text" name="specialization" class="form-control">
    </div>
    <div class="mb-3">
        <label>Phone</label>
        <input type="text" name="phone" class="form-control">
    </div>
    <button type="submit" class="btn btn-success">Save</button>
    <a href="ManageDoctorsServlet" class="btn btn-secondary">Back</a>
</form>

</body>
</html>
