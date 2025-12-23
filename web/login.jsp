<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Patient Login</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-4">
            <div class="card shadow p-4">
                <h3 class="text-center mb-4">Patient Login</h3>

                <form action="LoginServlet" method="post">

                    <input type="email" name="email" class="form-control mb-3" placeholder="Email" required>
                    <input type="password" name="password" class="form-control mb-3" placeholder="Password" required>

                    <button type="submit" class="btn btn-primary w-100">Login</button>
                </form>

                <div class="text-center mt-3">
                    Not registered? <a href="register.jsp">Register</a>
                </div>
                <!-- Link for doctors to login -->
<div class="mt-3">
    <a href="doctorLogin.jsp" class="btn btn-warning">Login as Doctor</a>
</div>
            </div>
        </div>
    </div>
</div>

</body>
</html>
