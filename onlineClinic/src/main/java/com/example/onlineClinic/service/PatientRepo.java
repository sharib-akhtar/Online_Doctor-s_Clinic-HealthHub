package com.example.onlineClinic.service;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.onlineClinic.model.Patients;

public interface PatientRepo extends JpaRepository<Patients, String> {

}
