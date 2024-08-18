<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Edit Profile</title>
  <link rel="shortcut icon" type="image/png" href="../assets/images/logos/healthHub.jpg" />
  <link rel="stylesheet" href="../assets/css/styles.min.css" />
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>

<body>
  <!--  Body Wrapper -->
  <div class="page-wrapper" id="main-wrapper" data-layout="vertical" data-navbarbg="skin6" data-sidebartype="full"
    data-sidebar-position="fixed" data-header-position="fixed">
    <div
      class="position-relative overflow-hidden radial-gradient min-vh-100 d-flex align-items-center justify-content-center">
      <div class="d-flex align-items-center justify-content-center w-100">
        <div class="row justify-content-center w-100">
          <div class="col-md-8 col-lg-6 col-xxl-3">
            <div class="card mb-0">
              <div class="card-body">
                <a href="index" class="text-nowrap logo-img text-center d-block py-3 w-100">
                  <img src="../assets/images/logos/healthHub.jpg" width="180" alt="">
                </a>
                <h3 class="text-center">Edit Profile</h3>
                <form action="processAdminProfileUpdate" method="post">
                  <div class="mb-3">
                    <label for="adminemail" class="form-label">Email</label>
                    <input type="email" class="form-control" id="adminemail" name="adminemail" required>
                  </div>
                  <div class="mb-3">
                    <label for="adminname" class="form-label">Name</label>
                    <input type="text" class="form-control" id="adminname" name="adminname" required>
                  </div>
                  <div class="mb-3">
                    <label for="adminpassword" class="form-label">Password</label>
                    <input type="password" class="form-control" id="adminpassword" name="adminpassword" required>
                  </div>
                  <button type="submit" class="btn btn-primary w-100 fs-4 mb-4 rounded-2">Update Profile</button>
                  <a href="adminDashboard" class="btn btn-primary ">Back</a>
                </form>
              </div>
              <h3>${msg1}</h3>
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
