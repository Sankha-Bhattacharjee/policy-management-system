package com.policymanagement.models;

public class ForgotUid {

	private int uid;
	private String pwd;
	private String qstn1;
	private String ans1;
	private String qstn2;
	private String ans2;
	private String qstn3;
	private String ans3;
	private String contactNumber;
	
	
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getQstn1() {
		return qstn1;
	}
	public void setQstn1(String qstn1) {
		this.qstn1 = qstn1;
	}
	public String getAns1() {
		return ans1;
	}
	public void setAns1(String ans1) {
		this.ans1 = ans1;
	}
	public String getQstn2() {
		return qstn2;
	}
	public void setQstn2(String qstn2) {
		this.qstn2 = qstn2;
	}
	public String getAns2() {
		return ans2;
	}
	public void setAns2(String ans2) {
		this.ans2 = ans2;
	}
	public String getQstn3() {
		return qstn3;
	}
	public void setQstn3(String qstn3) {
		this.qstn3 = qstn3;
	}
	public String getAns3() {
		return ans3;
	}
	public void setAns3(String ans3) {
		this.ans3 = ans3;
	}
	public String getContactNumber() {
		return contactNumber;
	}
	public void setContactNumber(String contactNumber) {
		this.contactNumber = contactNumber;
	}
	@Override
	public String toString() {
		return "ForgotUid [uid=" + uid + ", pwd=" + pwd + ", qstn1=" + qstn1 + ", ans1=" + ans1 + ", qstn2=" + qstn2
				+ ", ans2=" + ans2 + ", qstn3=" + qstn3 + ", ans3=" + ans3 + ", contactNumber=" + contactNumber + "]";
	}
	

}
