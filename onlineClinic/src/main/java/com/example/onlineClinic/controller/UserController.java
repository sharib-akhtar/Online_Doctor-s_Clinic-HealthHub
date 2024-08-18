package com.example.onlineClinic.controller;

import java.time.LocalDate;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.onlineClinic.model.Patients;
import com.example.onlineClinic.model.User;
import com.example.onlineClinic.service.PatientRepo;
import com.example.onlineClinic.service.UserRepo;

import jakarta.servlet.http.HttpSession;

@Controller
public class UserController {
	@Autowired
	UserRepo urepo;
	@Autowired
	PatientRepo prepo;
	@RequestMapping("/userLogin")
	public String userLogin()
	{
		return "userLogin";
	}
	@RequestMapping("/userRegister")
	public String userRegister()
	{
		return "userRegister";
	}
	@RequestMapping("/processUserRegistration")
	public String userRegister(@RequestParam("uname")String username,@RequestParam("uemail")String useremail,@RequestParam("upassConfirm")String upass,ModelMap map)
	{
		User u=new User();
		u.setUseremail(useremail);
		u.setUsername(username);
		u.setUserpass(upass);
		urepo.save(u);
		map.put("msg","Registration Successfull!!!");
		return "userLogin";
	}

	@RequestMapping("/processUserlogin")
	public String processAdminLogin(@RequestParam("uemail")String uemail,@RequestParam("upass")String pass,HttpSession session,ModelMap map)
	{
		User u=new User();
		u=urepo.findByuseremail(uemail);
		try
		{
		if(u!=null)
		{
			session.setAttribute("Data",uemail);
			System.out.print("inside process");
			return "userDashboard";
		}
		else
		{
			map.put("msg","Invalid Credentials please check!!!");
		}
		}
		catch(Exception e)
		{}
		return "userLogin";
	}
	@RequestMapping("/userDashboard")
	public String userDashboard()
	{
		return "userDashboard";
	}
	@RequestMapping("/userLogout")
	public String userLogut(HttpSession session,ModelMap map)
	{
		session.invalidate();
		map.put("msg","You have been logged out successfully!!!");
		return "userLogin";
	}
	@RequestMapping("/processAppointment")
	public String processAppointment(@RequestParam("pname")String pname,@RequestParam("pemail")String pemail,@RequestParam("pphone")String pphone,@RequestParam("adate")LocalDate date,@RequestParam("doctorName")String docname,@RequestParam("pGuardian")String pGuardian,ModelMap map)
	{
		Patients p=new Patients();
		p.setPemail(pemail);
		p.setPname(pname);
		p.setPphno(pphone);
		p.setAppointmentDate(date);
		p.setPrefDoc(docname);
		p.setPatientGuardian(pGuardian);
		prepo.save(p);
		map.put("Appointment Confirmed","pmsg");
		
		return "userDashboard";
	}
	@RequestMapping("/viewUpatients")
	public String viewUpatients()
	{
		
		return "viewUPatients";
	}
}
