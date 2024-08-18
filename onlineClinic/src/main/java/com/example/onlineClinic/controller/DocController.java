package com.example.onlineClinic.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.onlineClinic.model.DoctorLogin;
import com.example.onlineClinic.model.NewDocreg;
import com.example.onlineClinic.service.DocLoginRepo;
import com.example.onlineClinic.service.NewDocRegRepo;

import jakarta.servlet.http.HttpSession;

@Controller
public class DocController {
	@Autowired
	DocLoginRepo dlrepo;
	@Autowired 
	NewDocRegRepo ndrepo;
	@RequestMapping("/docLogin")
public String doctorlogin()
{
	return "docLogin";
}
@RequestMapping("/processdoclogin")
public String processAdminLogin(@RequestParam("demail")String demail,@RequestParam("dpass")String dpass,HttpSession session,ModelMap map)
{
	DoctorLogin dl=new DoctorLogin();
	dl=dlrepo.findBydeamil(demail);
	try
	{
	if(dl!=null)
	{
		session.setAttribute("Data",demail);
		String docname=dl.getDname();
		session.setAttribute("docname",docname);
		System.out.print("inside process");
		return "doctorDashboard";
	}
	else
	{
		map.put("msg","Invalid Credentials please check!!!");
	}
	}
	catch(Exception e)
	{}
		return "docLogin";
}
@RequestMapping("/newDoc")
public String docreg()
{
return "newDoc";
}
@RequestMapping("/processdocreg")
public String regProcess(@RequestParam("name") String name,
		@RequestParam("email") String email, @RequestParam("mobno") String mobno,
		@RequestParam("gender") String gender, @RequestParam("city") String city,
		@RequestParam("password") String password, @RequestParam("dob") String dob,@RequestParam("exp")String exp,@RequestParam("speciality")String spec,ModelMap map) 
{
	NewDocreg nd = new NewDocreg();
	
	nd.setName(name);
	nd.setEmail(email);
	nd.setMobno(mobno);
	nd.setCity(city);
	nd.setDOB(dob);
	nd.setGender(gender);
	nd.setPassword(password);
	nd.setExperience(exp);
	nd.setSpeciality(spec);
	ndrepo.save(nd);
	map.put("msg","Registration successfull");
	return "newDoc";
}
@RequestMapping("/doctorDashboard")
public String docDashboard()
{
	return "doctorDashboard";
}@RequestMapping("/viewDocpatients")
public String viewDocpatients()
{
	return "viewDocpatients";
}
@RequestMapping("/docLogout")
public String userLogut(HttpSession session,ModelMap map)
{
	session.invalidate();
	map.put("msg","You have been logged out successfully!!!");
	return "docLogin";
}
}
