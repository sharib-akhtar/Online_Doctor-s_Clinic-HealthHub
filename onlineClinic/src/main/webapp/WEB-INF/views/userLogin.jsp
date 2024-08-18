<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>HealthHub</title>
  <link rel="shortcut icon" type="image/png" href="../assets/images/logos/healthHub.jpg" />
  <link rel="stylesheet" href="../assets/css/styles.min.css" />
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
                <h3 class="text-center">Hello there!</h3>
                <form action="processUserlogin" method="post">
                  <div class="mb-3">
                    <label for="uemail" class="form-label">Username</label>
                    <input type="email" class="form-control" id="uemail" name="uemail" aria-describedby="emailHelp">
                  </div>
                  <div class="mb-4">
                    <label for="upass" class="form-label">Password</label>
                    <input type="password" class="form-control" id="upass"  name="upass">
                  </div>
                  <div class="d-flex align-items-center justify-content-between mb-4">
                    <div class="form-check">
                      <input class="form-check-input primary" type="checkbox" value="" id="flexCheckChecked" checked>
                      <label class="form-check-label text-dark" for="flexCheckChecked">
                        Remeber this Device
                      </label>
                    </div>
                    <a class="text-primary fw-bold" href="userRegister">New User?</a>
                  </div>
                   <button type="submit" class="btn btn-primary w-100 fs-4 mb-4 rounded-2" value="login">Login</button>
                 
                  <div class="d-flex align-items-center justify-content-center">
                    <p class="fs-4 mb-0 fw-bold"></p>
                  </div>
                </form>
                <h4>${msg}</h4>
                <a href="index" class="btn btn-primary ">Back to Home</a>
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