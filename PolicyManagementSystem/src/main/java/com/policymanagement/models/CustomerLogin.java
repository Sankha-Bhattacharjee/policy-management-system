package com.policymanagement.models;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;


public class CustomerLogin {
	@NotNull(message = "UserId is required")
	private int userId;
	@NotEmpty(message = "Password is required")
	private String password;
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	@Override
	public String toString() {
		return "CustomerLogin [userId=" + userId + ", password=" + password + "]";
	}
	

}
