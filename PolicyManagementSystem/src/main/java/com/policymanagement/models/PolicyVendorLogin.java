package com.policymanagement.models;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

public class PolicyVendorLogin {
	@NotNull(message = "Not Empty")
	private int vendorId;
	@NotEmpty(message = "Not Empty")
	private String password;
	public int getVendorId() {
		return vendorId;
	}
	public void setVendorId(int vendorId) {
		this.vendorId = vendorId;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	@Override
	public String toString() {
		return "PolicyVendorLogin [vendorId=" + vendorId + ", password=" + password + "]";
	}
	
}
