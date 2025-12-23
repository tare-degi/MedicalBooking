<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Patient Registration</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="card shadow p-4">
                <h3 class="text-center mb-4">Patient Registration</h3>

                <form action="RegisterServlet" method="post">

                    <input type="text" name="fullName" class="form-control mb-3"
                           placeholder="Full Name" required>

                    <input type="email" name="email" class="form-control mb-3"
                           placeholder="Email" required>

                    <input type="password" name="password" class="form-control mb-3"
                           placeholder="Password" required>

                    <input type="text" name="phone" class="form-control mb-3"
                           placeholder="Phone">

                    <textarea name="address" class="form-control mb-3"
                              placeholder="Address"></textarea>

                    <input type="date" name="dob" class="form-control mb-3" required>

                    <select name="gender" class="form-control mb-3" required>
                        <option value="">Select Gender</option>
                        <option>MALE</option>
                        <option>FEMALE</option>
                      
                    </select>

                    <button type="submit" class="btn btn-primary w-100">
                        Register
                    </button>
                </form>

                <div class="text-center mt-3">
                    Already registered? <a href="login.jsp">Login</a>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>
