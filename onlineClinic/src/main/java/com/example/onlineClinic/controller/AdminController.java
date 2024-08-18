package com.example.onlineClinic.controller;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.sql.DataSource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.example.onlineClinic.ConnectionProvider;

import jakarta.servlet.http.HttpSession;

@Controller
public class AdminController {
@RequestMapping("/adminDocview")
public String admindocview()
{
	return "adminDocview";
}
@RequestMapping("/viewDoctorProfile")
public String viewProf()
{
	return "viewDoctorProfile";
}
@GetMapping("/acceptDoctor")
public ModelAndView acceptDoctor(@RequestParam("name") String name) {
    Connection conn = null;
    try {
        conn = ConnectionProvider.getConn();
        if (conn != null) {
            // Get doctor details from applied_doctors
            PreparedStatement selectStmt = conn.prepareStatement("SELECT * FROM new_docreg WHERE name = ?");
            selectStmt.setString(1, name);
            ResultSet rs = selectStmt.executeQuery();
            if (rs.next()) {
                String dname = rs.getString("name");
                String dspec = rs.getString("speciality");
                String dexp = rs.getString("experience");
                String demail=rs.getString("email");
                String pass=rs.getString("password");

                // Insert into doctors table
                PreparedStatement insertStmt = conn.prepareStatement("INSERT INTO doctors (dname, dspec, dexp) VALUES (?, ?, ?)");
                insertStmt.setString(1, dname);
                insertStmt.setString(2, dspec);
                insertStmt.setString(3, dexp);
                insertStmt.executeUpdate();
                
                // Insert into DoctorLogin table
                PreparedStatement insertStmt2 = conn.prepareStatement("INSERT INTO doctor_login (dname, deamil, dpass) VALUES (?, ?, ?)");
                insertStmt2.setString(1, dname);
                insertStmt2.setString(2, demail);
                insertStmt2.setString(3, pass);
                insertStmt2.executeUpdate();

                // Delete from applied_doctors table
                PreparedStatement deleteStmt = conn.prepareStatement("DELETE FROM new_docreg WHERE name = ?");
                deleteStmt.setString(1, name);
                deleteStmt.executeUpdate();

                insertStmt.close();
                deleteStmt.close();
            } else {
                return new ModelAndView("error").addObject("message", "Doctor not found in applied_doctors table.");
            }
            selectStmt.close();
        } else {
            return new ModelAndView("error").addObject("message", "Database connection failed.");
        }
        
    } catch (Exception e) {
        e.printStackTrace();
        return new ModelAndView("error").addObject("message", "Error: " + e.getMessage());
    } finally {
        if (conn != null) {
            try {
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
    return new ModelAndView("redirect:/adminDocview");
}
@GetMapping("/rejectDoctor")
public ModelAndView rejectDoctor(@RequestParam("name") String name) {
    Connection conn = null;
    try {
        conn = ConnectionProvider.getConn();
        if (conn != null) {
            // Delete from applied_doctors table
            PreparedStatement deleteStmt = conn.prepareStatement("DELETE FROM applied_doctors WHERE name = ?");
            deleteStmt.setString(1, name);
            deleteStmt.executeUpdate();
            deleteStmt.close();
        } else {
            return new ModelAndView("error").addObject("message", "Database connection failed.");
        }
    } catch (Exception e) {
        e.printStackTrace();
        return new ModelAndView("error").addObject("message", "Error: " + e.getMessage());
    } finally {
        if (conn != null) {
            try {
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
    return new ModelAndView("redirect:/adminDocview");
}
@RequestMapping("/adminViewPatients")
public String adminViewPatients()
{
	return "adminViewPatients";
}
@RequestMapping("/updateProfileadmin")
public String updateProfileadmin()
{
	return "updateProfileadmin";
}
@RequestMapping("/processAdminProfileUpdate")
public String processAdminProfileUpdate(@RequestParam("adminemail")String adminemail,@RequestParam("adminpassword")String adminpassword,HttpSession session,ModelMap map)
{
	 String updateQuery = "UPDATE admin SET adminemail = ?, adminpassword = ? WHERE adminemail = ?";
     String currentEmail=(String) session.getAttribute("Data");
     try (Connection conn = ConnectionProvider.getConn();
          PreparedStatement pstmt = conn.prepareStatement(updateQuery)) {
          
         pstmt.setString(1, adminemail);
         pstmt.setString(2, adminpassword);
         pstmt.setString(3, currentEmail);
         
         pstmt.executeUpdate();
     } catch (SQLException e) {
         e.printStackTrace();
         // Handle exceptions
     }
     map.put("msg1","Updated!!!");
	return "updateProfileadmin";
}

}