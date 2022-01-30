package com.policymanagement.models;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

public class AdminLogin {
	@NotNull
	private int adminId;
	@NotEmpty(message = "Password is required")
	private String password;
	public int getAdminId() {
		return adminId;
	}
	public void setAdminId(int adminId) {
		this.adminId = adminId;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	@Override
	public String toString() {
		return "AdminLogin [adminId=" + adminId + ", password=" + password + "]";
	}
	
}
