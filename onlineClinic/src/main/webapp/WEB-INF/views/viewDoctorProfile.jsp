<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.example.onlineClinic.ConnectionProvider"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>HealthHub - Doctor Profile</title>
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

        .profile-container {
            margin-top: 50px;
        }

        .profile-card {
            background-color: rgba(255, 255, 255, 0.8);
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }
          .btn-accept {
            background-color: #007bff;
            border: none;
            border-radius: 5px;
            transition: background-color 0.3s;
        }

        .btn-accept:hover {
            background-color: green;
        }

        .btn-reject {
            background-color: #007bff;
            border: none;
            border-radius: 5px;
            transition: background-color 0.3s;
        }

        .btn-reject:hover {
            background-color: red;
        }
    </style>
</head>
<body>
    <!-- Body Wrapper -->
    <div class="page-wrapper" id="main-wrapper" data-layout="vertical" data-navbarbg="skin6" data-sidebartype="full"
        data-sidebar-position="fixed" data-header-position="fixed">
        <div class="position-relative overflow-hidden radial-gradient min-vh-100 d-flex align-items-center justify-content-center">
            <a href="userLogout" class="logout-link">Logout</a>
            <div class="container-fluid profile-container">
                <div class="row justify-content-center">
                    <div class="col-md-6">
                        <div class="card profile-card">
                            <div class="card-body">
                                <h5 class="card-title">Doctor Profile</h5>
                                <%
                                    String doctorName = request.getParameter("name");
                                    Connection conn = null;
                                    try {
                                        conn = ConnectionProvider.getConn();
                                        if (conn != null) {
                                            PreparedStatement stmt = conn.prepareStatement("SELECT * FROM new_docreg WHERE name = ?");
                                            stmt.setString(1, doctorName);
                                            ResultSet rs = stmt.executeQuery();
                                            if (rs.next()) {
                                %>
                                <p><strong>Name:</strong> <%= rs.getString("name") %></p>
                                <p><strong>Specialty:</strong> <%= rs.getString("speciality") %></p>
                                <p><strong>Experience:</strong> <%= rs.getString("experience") %> years</p>
                                <p><strong>Email:</strong> <%= rs.getString("email") %></p>
                                <p><strong>Phone Number:</strong> <%= rs.getString("mobno") %></p>
                                <p><strong>City:</strong> <%= rs.getString("city") %></p>
                                <p><strong>Date of Birth:</strong> <%= rs.getDate("dob") %></p>
                                
                                <%
                                            } else {
                                                out.println("<p>No profile found for the specified doctor.</p>");
                                            }
                                            rs.close();
                                            stmt.close();
                                        } else {
                                            out.println("<p>Database connection failed.</p>");
                                        }
                                    } catch (Exception e) {
                                        out.println("<p>Error: " + e.getMessage() + "</p>");
                                    } finally {
                                        if (conn != null) {
                                            try {
                                                conn.close();
                                            } catch (SQLException e) {
                                                e.printStackTrace();
                                            }
                                        }
                                    }
                                %>
                                
                                <a href="acceptDoctor?name=<%= doctorName %>" class="btn btn-primary btn-accept">Accept</a>
                                <a href="rejectDoctor?name=<%= doctorName %>" class="btn btn-primary btn-reject">Reject</a>
                                <a href="javascript:history.back()" class="btn btn-primary">Back</a>
                                
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
