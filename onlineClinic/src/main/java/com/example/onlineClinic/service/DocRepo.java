package com.example.onlineClinic.service;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.onlineClinic.model.Doctors;

public interface DocRepo extends JpaRepository<Doctors, String> {

}
