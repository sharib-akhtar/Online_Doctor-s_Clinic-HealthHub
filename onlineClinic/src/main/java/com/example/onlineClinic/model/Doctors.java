package com.example.onlineClinic.model;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;

@Entity
public class Doctors {
	@Id
	private String dname;
	private String dspec;
	private String dexp;
	public String getDname() {
		return dname;
	}
	public void setDname(String dname) {
		this.dname = dname;
	}
	public String getDspec() {
		return dspec;
	}
	public void setDspec(String dspec) {
		this.dspec = dspec;
	}
	public String getDexp() {
		return dexp;
	}
	public void setDexp(String dexp) {
		this.dexp = dexp;
	}
	
}
