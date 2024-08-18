package com.example.onlineClinic.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.onlineClinic.model.Admin;
import com.example.onlineClinic.service.adminRepo;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class HomeController {
	@Autowired
	adminRepo arepo;
	@RequestMapping("/index")
	public String index() {
		return "index";
	}
	@RequestMapping("/about")
	public String about() {
		return "about";
	}
	@RequestMapping("/service")
	public String service() {
		return "service";
	}
	@RequestMapping("/adminLogin")
	public String AdminLogin()
	{
		
		return "adminLogin";
	}
	@RequestMapping("/processadminlogin")
	public String processAdminLogin(@RequestParam("admemail")String aemail,@RequestParam("Adminpass")String pass,HttpSession session,ModelMap map)
	{
		try
		{
		Admin a=new Admin();
		a=arepo.findByAdminemail(aemail);
		if(a!=null && a.getAdminpassword().equals(pass))
		{
			session.setAttribute("Data",aemail);
			System.out.print("inside process");
			return "adminDashboard";
		}
		else
		{
			map.put("msg","Invalid Credentials please check!!!");
		}
		}
		catch(Exception e)
		{}
		return "adminLogin";
	}
	@RequestMapping("/adminlogout")
	public String AdminLogut(HttpSession session,ModelMap map)
	{
		session.invalidate();
		map.put("msg","You have been logged out successfully!!!");
		return "adminLogin";
	}
	@RequestMapping("/admin")
	public String admin() {
		return "admin";
	}
	@RequestMapping("/adminDashboard")
	public String adminDashboard() {
		return "adminDashboard";
	}
	@RequestMapping("/contact")
	public String contactUs() {
		
	        return "contact";
	}
	@RequestMapping("/processcontact")
	public String contact(@RequestParam("name")String name,ModelMap model) {
		 String contactMessage = "Thank you, " + name + ". We have received your message and will get back to you shortly.";
	        model.addAttribute("contact", contactMessage); 

	        return "contact";
	}
	

}
