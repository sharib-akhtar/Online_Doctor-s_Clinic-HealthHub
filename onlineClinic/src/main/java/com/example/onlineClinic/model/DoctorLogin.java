package com.example.onlineClinic.model;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;

@Entity
public class DoctorLogin {
	@Id
	private String deamil;
	private String dpass;
	private String dname;
	public String getDeamil() {
		return deamil;
	}
	public void setDeamil(String deamil) {
		this.deamil = deamil;
	}
	public String getDpass() {
		return dpass;
	}
	public void setDpass(String dpass) {
		this.dpass = dpass;
	}
	public String getDname() {
		return dname;
	}
	public void setDname(String dname) {
		this.dname = dname;
	}
	

}
