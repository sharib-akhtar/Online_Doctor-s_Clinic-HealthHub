<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.example.onlineClinic.ConnectionProvider"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>HealthHub - Registration Form</title>
  <link rel="shortcut icon" type="image/png" href="../assets/images/logos/healthHub.jpg" />
  <link rel="stylesheet" href="../assets/css/styles.min.css" />
  <style>
    .logout-link {
      position: absolute;
      top: 20px;
      right: 20px;
      text-decoration: none;
      color: #000;
      font-weight: bold;
      padding: 10px 20px;
      border: 2px solid #000;
      border-radius: 5px;
      transition: background-color 0.3s, color 0.3s;
    }

    .logout-link:hover {
      background-color: red;
      color: white;
    }

    .card {
      margin-top: 50px;
      background-color: rgba(255, 255, 255, 0.8);
      border-radius: 10px;
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
    }

    .card-title {
      margin-bottom: 30px;
    }

    .form-control {
      border-radius: 5px;
    }

    .btn-primary {
      background-color: #007bff;
      border: none;
      border-radius: 5px;
    }

    .btn-primary:hover {
      background-color: #0056b3;
    }
  </style>
</head>
<body>
  <!--  Body Wrapper -->
  <div class="page-wrapper" id="main-wrapper" data-layout="vertical" data-navbarbg="skin6" data-sidebartype="full"
    data-sidebar-position="fixed" data-header-position="fixed">
    <div
      class="position-relative overflow-hidden radial-gradient min-vh-100 d-flex align-items-center justify-content-center">
      <a href="userLogout" class="logout-link">Logout</a>
      <div class="container-fluid">
        <div class="row justify-content-center">
          <div class="col-md-6">
            <div class="card mb-4">
              <div class="card-body">
                <a href="index" class="text-nowrap logo-img text-center d-block py-3 w-100">
                  <img src="../assets/images/logos/healthHub.jpg" width="180" alt="">
                </a>
                <h3 class="card-title text-center">Register Here, Doc</h3>
                <form action="processdocreg" method="post">
                  <div class="mb-3">
                    <label for="name" class="form-label">Name</label>
                    <input type="text" class="form-control" id="name" name="name" required>
                  </div>
                  <div class="mb-3">
                    <label for="email" class="form-label">Email</label>
                    <input type="email" class="form-control" id="email" name="email" required>
                  </div>
                  <div class="mb-3">
                    <label for="mobno" class="form-label">Mobile Number</label>
                    <input type="text" class="form-control" id="mobno" name="mobno" required>
                  </div>
                  <div class="mb-3">
                    <label for="gender" class="form-label">Gender</label>
                    <select class="form-control" id="gender" name="gender" required>
                      <option value="male">Male</option>
                      <option value="female">Female</option>
                    </select>
                  </div>
                  <div class="mb-3">
                    <label for="password" class="form-label">Password</label>
                    <input type="password" class="form-control" id="password" name="password" required>
                  </div>
                  <div class="mb-3">
                    <label for="city" class="form-label">City</label>
                    <input type="text" class="form-control" id="city" name="city" required>
                  </div>
                  <div class="mb-3">
                    <label for="speciality" class="form-label">Speciality</label>
                    <input type="text" class="form-control" id="speciality" name="speciality" required>
                  </div>
                  <div class="mb-3">
                    <label for="exp" class="form-label">Experience in Years</label>
                    <input type="text" class="form-control" id="exp" name="exp" required>
                  </div>
                  <div class="mb-3">
                    <label for="dob" class="form-label">Date of Birth</label>
                    <input type="date" class="form-control" id="dob" name="dob" required>
                  </div>
                  <button type="submit" class="btn btn-primary w-100 fs-4 mb-4 rounded-2">Register</button>
                </form>
                <h4>${msg}</h4>
                 <a href="index" class="btn btn-primary w-100 fs-4 mb-4 rounded-2">Back to Home</a>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <script src="../assets/libs/jquery/dist/jquery.min.js"></script>
  <script src="../assets/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
