<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.example.onlineClinic.ConnectionProvider"%>
<%@ page import="java.util.*"%>

<!doctype html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>HealthHub - Book an Appointment</title>
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
      margin-bottom: 20px;
    }

    .container-fluid {
      padding: 0 20px;
    }

    @media (min-width: 768px) {
      .doctor-table-container, .appointment-form-container {
        margin-bottom: 20px;
      }
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
          <!-- Doctor List Table -->
          <div class="col-md-5 doctor-table-container">
            <div class="card mb-4">
              <div class="card-body">
                <h5 class="card-title">Available Doctors</h5>
                <table class="table">
                  <thead>
                    <tr>
                      <th scope="col">Name</th>
                      <th scope="col">Specialty</th>
                      <th scope="col">Experience</th>
                    </tr>
                  </thead>
                  <tbody>
                    <%
                    Connection conn = null;
                    List<String[]> list = new ArrayList<>();
                    try {
                      conn = ConnectionProvider.getConn();
                      if (conn != null) {
                        PreparedStatement stmt = conn.prepareStatement("select * from doctors;");
                        ResultSet rs = stmt.executeQuery();
                        while (rs.next()) {
                          String doctors[] = new String[3];
                          doctors[0] = rs.getString("dname");
                          doctors[1] = rs.getString("dspec");
                          doctors[2] = rs.getString("dexp");
                          list.add(doctors);
                        }
                        rs.close();
                        stmt.close();
                      } else {
                        out.println("<tr><td colspan='3'>Database connection failed.</td></tr>");
                      }
                    } catch (Exception e) {
                      out.println("<tr><td colspan='3'>Error: " + e.getMessage() + "</td></tr>");
                      
                    } finally {
                      if (conn != null) {
                        try {
                          conn.close();
                        } catch (SQLException e) {
                        }
                      }
                    }

                    if (!list.isEmpty()) {
                      for (String[] details : list) {
                    %>
                    <tr>
                      <td><%= details[0] %></td>
                      <td><%= details[1] %></td>
                      <td><%= details[2] %></td>
                    </tr>
                    <%
                      }
                    } else {
                    %>
                    <tr>
                      <td colspan="3">No doctors available.</td>
                    </tr>
                    <%
                    }
                    %>
                  </tbody>
                </table>
              </div>
            </div>
          </div>

          <!-- Appointment Form -->
          <div class="col-md-5 appointment-form-container">
            <div class="card mb-0">
              <div class="card-body">
                <a href="index" class="text-nowrap logo-img text-center d-block py-3 w-100">
                  <img src="../assets/images/logos/healthHub.jpg" width="180" alt="">
                </a>
                <h3 class="text-center">Book an Appointment</h3>
                <form action="processAppointment" method="post">
                  <div class="mb-3">
                    <label for="pname" class="form-label">Patient Name</label>
                    <input type="text" class="form-control" id="pname" name="pname" required>
                  </div>
                  <div class="mb-3">
                    <label for="pemail" class="form-label">Email</label>
                    <input type="email" class="form-control" id="pemail" name="pemail" required>
                  </div>
                  <div class="mb-3">
                    <label for="pphone" class="form-label">Phone Number</label>
                    <input type="tel" class="form-control" id="pphone" name="pphone" required>
                  </div>
                  <div class="mb-3">
                    <label for="adate" class="form-label">Appointment Date</label>
                    <input type="date" class="form-control" id="adate" name="adate" required>
                  </div>
                  <div class="mb-3">
                    <label for="doctorName" class="form-label">Preferred Doctor</label>
                    <input type="text" class="form-control" id="doctorName" name="doctorName">
                  </div>
                  <div class="mb-3">
                    <label for="pGuardian" class="form-label">Patients Guardian</label>
                    <input type="text" class="form-control" id="pGuardian" name="pGuardian" required>
                  </div>
                  <div class="mb-4">
                    <label for="message" class="form-label">Reason for Appointment</label>
                    <textarea class="form-control" id="message" name="message" rows="4" required></textarea>
                  </div>
                  <button type="submit" class="btn btn-primary w-100 fs-4 mb-4 rounded-2" value="book">Book Appointment</button>
                  <div class="d-flex align-items-center justify-content-center">
                    <p class="fs-4 mb-0 fw-bold"></p>
                  </div>
                  <a href="viewUpatients" class="btn btn-primary w-100 fs-4 mb-4 rounded-2">View Appointments</a>
                  <div class="d-flex align-items-center justify-content-center">
                    <p class="fs-4 mb-0 fw-bold"></p>
                  </div>
                </form>
                <h4>${pmsg}</h4>
                <%
                
                %>
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
