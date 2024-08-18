package com.example.onlineClinic.service;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.onlineClinic.model.NewDocreg;

public interface NewDocRegRepo extends JpaRepository<NewDocreg, String> {

}
