<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.example.onlineClinic.ConnectionProvider"%>
<%@ page import="java.util.*"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Patients</title>
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
    <!-- Body Wrapper -->
    <div class="page-wrapper" id="main-wrapper" data-layout="vertical" data-navbarbg="skin6" data-sidebartype="full"
        data-sidebar-position="fixed" data-header-position="fixed">
        <div
            class="position-relative overflow-hidden radial-gradient min-vh-100 d-flex align-items-center justify-content-center">
            <a href="docLogout" class="logout-link">Logout</a>
            <div class="container-fluid">
                <div class="row justify-content-center">
                    <div class="col-md-10">
                        <div class="card">
                            <div class="card-body">
                                <a href="index" class="text-nowrap logo-img text-center d-block py-3 w-100">
                                    <img src="../assets/images/logos/healthHub.jpg" width="180" alt="">
                                </a>
                                <h3 class="card-title text-center">Patients List</h3>
                                <table class="table table-striped">
                                    <thead>
                                        <tr>
                                            <th scope="col">Email</th>
                                            <th scope="col">Appointment Date</th>
                                            <th scope="col">Name</th>
                                            <th scope="col">Phone Number</th>
                                           
                                            <th scope="col">Guardian</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%
                                        String doctorName = (String) session.getAttribute("docname");
                                        Connection conn = null;
                                        try {
                                            conn = ConnectionProvider.getConn();
                                            if (conn != null) {
                                                PreparedStatement stmt = conn.prepareStatement("SELECT * FROM patients where pref_doc=?;");
                                                stmt.setString(1,doctorName);
                                                ResultSet rs = stmt.executeQuery();
                                                while (rs.next()) {
                                                    String email = rs.getString("pemail");
                                                    java.sql.Date appointmentDate = rs.getDate("appointment_date");
                                                    String name = rs.getString("pname");
                                                    String phoneNumber = rs.getString("pphno");
                          
                                                    String guardian = rs.getString("p_guardian");
                                        %>
                                        <tr>
                                            <td><%= email %></td>
                                            <td><%= appointmentDate %></td>
                                            <td><%= name %></td>
                                            <td><%= phoneNumber %></td>
                                            
                                            <td><%= guardian %></td>
                                        </tr>
                                        <%
                                                }
                                                rs.close();
                                                stmt.close();
                                            } else {
                                                out.println("<tr><td colspan='6'>Database connection failed.</td></tr>");
                                            }
                                        } catch (Exception e) {
                                            out.println("<tr><td colspan='6'>Error: " + e.getMessage() + "</td></tr>");
                                        } finally {
                                            if (conn != null) {
                                                try {
                                                    conn.close();
                                                } catch (SQLException e) {
                                                }
                                            }
                                        }
                                        %>
                                    </tbody>
                                </table>
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
