package com.example.onlineClinic.service;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.onlineClinic.model.Admin;

public interface adminRepo extends JpaRepository<Admin, String> {
	Admin findByAdminemail(String adminemail);
	
	
}
