package com.example.onlineClinic.service;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.onlineClinic.model.DoctorLogin;

public interface DocLoginRepo extends JpaRepository<DoctorLogin, String> {
	DoctorLogin findBydeamil(String demail);

}
