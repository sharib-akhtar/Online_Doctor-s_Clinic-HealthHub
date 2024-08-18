package com.example.onlineClinic.service;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.onlineClinic.model.User;

public interface UserRepo extends JpaRepository<User,String> {
	User findByuseremail(String useremail);

}
