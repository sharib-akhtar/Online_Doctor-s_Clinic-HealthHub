package com.example.onlineClinic.model;

import java.time.LocalDate;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;

@Entity
public class Patients {
	
	private String pname;
	@Id
	private String pemail;
	private String pphno;
	private LocalDate appointmentDate;
	private String prefDoc;
	private String pGuardian;
	public String getPatientGuardian() {
		return pGuardian;
	}
	public void setPatientGuardian(String patientGuardian) {
		this.pGuardian = patientGuardian;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public String getPemail() {
		return pemail;
	}
	public void setPemail(String pemail) {
		this.pemail = pemail;
	}
	public String getPphno() {
		return pphno;
	}
	public void setPphno(String pphno) {
		this.pphno = pphno;
	}
	public LocalDate getAppointmentDate() {
		return appointmentDate;
	}
	public void setAppointmentDate(LocalDate appointmentDate) {
		this.appointmentDate = appointmentDate;
	}
	public String getPrefDoc() {
		return prefDoc;
	}
	public void setPrefDoc(String prefDoc) {
		this.prefDoc = prefDoc;
	}
	
}
