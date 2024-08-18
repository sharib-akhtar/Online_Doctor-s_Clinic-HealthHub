<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.example.onlineClinic.ConnectionProvider"%>
<%@ page import="java.util.*"%>
<%@ page import="java.time.LocalDate"%>
<%@ page import="java.time.format.DateTimeFormatter"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Patients</title>
<link rel="stylesheet" href="../assets/css/styles.min.css" />
</head>
<body>
 <!--  Body Wrapper -->
  <div class="page-wrapper" id="main-wrapper" data-layout="vertical" data-navbarbg="skin6" data-sidebartype="full"
    data-sidebar-position="fixed" data-header-position="fixed">
    <div class="position-relative overflow-hidden radial-gradient min-vh-100 d-flex align-items-center justify-content-center">
      <div class="d-flex align-items-center justify-content-center w-100">
        <div class="row justify-content-center w-100">
          <div class="col-md-8 col-lg-6 col-xxl-3">
            <div class="card mb-0">
              <div class="card-body">
                <a href="index" class="text-nowrap logo-img text-center d-block py-3 w-100">
                  <img src="../assets/images/logos/healthHub.jpg" width="180" alt="">
                </a>
              
                <h3 class="text-center">Hello,</h3>

                <!-- Table for displaying patient information -->
                <h3 class="text-center">Here are Your Appointments</h3>
                <table class="table table-striped">
                  <thead>
                    <tr>
                      <th scope="col">Patient Name</th>
                      <th scope="col">Appointment Date</th>
                      <th scope="col">Preferred Doctor</th>
                    </tr>
                  </thead>
                  <tbody>
                    
                		
                		<% 
                		String name=(String)session.getAttribute("Data");
                      Connection conn = null;
                      List<String[]> list = new ArrayList<>();
                      String pUser=null;
                      try {
                        conn = ConnectionProvider.getConn();
                        if (conn != null) {
                          PreparedStatement stmt1 = conn.prepareStatement("SELECT username FROM user where useremail=?");
                          stmt1.setString(1,name);
                         
                          ResultSet rs1=stmt1.executeQuery();
                          
                          while(rs1.next())
                           pUser=rs1.getString("username");          
                          PreparedStatement stmt = conn.prepareStatement("SELECT * FROM patients where p_guardian=?");
                          stmt.setString(1,pUser);
                          ResultSet rs = stmt.executeQuery();
                          while (rs.next()) {
                            String[] appointments = new String[3];
                            appointments[0] = rs.getString("pname");
                            java.sql.Date aDate = rs.getDate("appointment_date");
                            if (aDate != null) {
                              LocalDate localDate = aDate.toLocalDate();
                              String formattedDate = localDate.format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
                              appointments[1] = formattedDate;
                            } else {
                              appointments[1] = "N/A"; // Handle null date case
                            }
                            appointments[2] = rs.getString("pref_doc");
                            list.add(appointments);
                          }
                          rs.close();
                          stmt.close();
                        } else {
                          out.println("<tr><td colspan='3'>Database connection failed.</td></tr>");
                        }
                      } catch (Exception e) {
                        out.println("<tr><td colspan='3'>Error: " +e.getMessage()+ "</td></tr>");
                      } finally {
                        if (conn != null) {
                          try {
                            conn.close();
                          } catch (SQLException e) {
                            // Handle exception
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
                      <td colspan="3">No Appointments made yet.</td>
                    </tr>
                    <%
                      }
                    %>
                  </tbody>
                </table>

              </div>
              <a href="javascript:history.back()" class="btn btn-primary">Back</a>
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
