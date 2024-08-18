<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.example.onlineClinic.ConnectionProvider"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>HealthHub - Doctor Lists</title>
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
            .doctor-table-container, .applied-doctor-table-container {
                margin-bottom: 20px;
            }
        }
    </style>
</head>
<body>
    <!-- Body Wrapper -->
    <div class="page-wrapper" id="main-wrapper" data-layout="vertical" data-navbarbg="skin6" data-sidebartype="full"
        data-sidebar-position="fixed" data-header-position="fixed">
        <div class="position-relative overflow-hidden radial-gradient min-vh-100 d-flex align-items-center justify-content-center">
            <a href="userLogout" class="logout-link">Logout</a>
            <div class="container-fluid">
                <div class="row justify-content-center">
                    <!-- Available Doctors Table -->
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
                                            List<String[]> availableDoctorsList = new ArrayList<>();
                                            try {
                                                conn = ConnectionProvider.getConn();
                                                if (conn != null) {
                                                    PreparedStatement stmt = conn.prepareStatement("SELECT * FROM doctors;");
                                                    ResultSet rs = stmt.executeQuery();
                                                    while (rs.next()) {
                                                        String[] doctor = {rs.getString("dname"), rs.getString("dspec"), rs.getString("dexp")};
                                                        availableDoctorsList.add(doctor);
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
                                                        e.printStackTrace();
                                                    }
                                                }
                                            }

                                            if (!availableDoctorsList.isEmpty()) {
                                                for (String[] doctor : availableDoctorsList) {
                                        %>
                                        <tr>
                                            <td><%= doctor[0] %></td>
                                            <td><%= doctor[1] %></td>
                                            <td><%= doctor[2] %></td>
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

                    <!-- Applied Doctors Table -->
                    <div class="col-md-5 applied-doctor-table-container">
                        <div class="card mb-4">
                            <div class="card-body">
                                <h5 class="card-title">Doctors Who Applied</h5>
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th scope="col">Name</th>
                                            <th scope="col">Specialty</th>
                                            <th scope="col">Experience</th>
                                            <th scope="col">Profile</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%
                                            List<String[]> appliedDoctorsList = new ArrayList<>();
                                            try {
                                                conn = ConnectionProvider.getConn();
                                                if (conn != null) {
                                                    PreparedStatement stmt = conn.prepareStatement("SELECT * FROM new_docreg;");
                                                    ResultSet rs = stmt.executeQuery();
                                                    while (rs.next()) {
                                                        String[] doctor = {rs.getString("name"), rs.getString("speciality"), rs.getString("experience")};
                                                        appliedDoctorsList.add(doctor);
                                                    }
                                                    rs.close();
                                                    stmt.close();
                                                } else {
                                                    out.println("<tr><td colspan='4'>Database connection failed.</td></tr>");
                                                }
                                            } catch (Exception e) {
                                                out.println("<tr><td colspan='4'>Error: " + e.getMessage() + "</td></tr>");
                                            } finally {
                                                if (conn != null) {
                                                    try {
                                                        conn.close();
                                                    } catch (SQLException e) {
                                                        e.printStackTrace();
                                                    }
                                                }
                                            }

                                            if (!appliedDoctorsList.isEmpty()) {
                                                for (String[] doctor : appliedDoctorsList) {
                                        %>
                                        <tr>
                                            <td><%= doctor[0] %></td>
                                            <td><%= doctor[1] %></td>
                                            <td><%= doctor[2] %></td>
                                            <td><a href="viewDoctorProfile?name=<%= doctor[0] %>" class="btn btn-primary btn-sm">View Complete Profile</a></td>
                                        </tr>
                                        <%
                                                }
                                            } else {
                                        %>
                                        <tr>
                                            <td colspan="4">No applied doctors found.</td>
                                        </tr>
                                        <%
                                            }
                                        %>
                                    </tbody>
                                </table>
                                <a href="javascript:history.back()" class="btn btn-primary">Back to Dashboard</a>
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
