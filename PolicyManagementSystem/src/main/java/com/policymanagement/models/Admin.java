package com.policymanagement.models;

import java.util.Date;

import javax.annotation.Generated;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.validation.Valid;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;

import org.hibernate.annotations.NotFound;
import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table
public class Admin {
	@Id
	//@Generated(value="assigned")
	private int adminId;
	@Column
	private String firstName;
	@Column
	private String lastName;
	@Column(unique=true)
	private String contactNumber;
	@Column
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date dateOfBirth;
	@Column(unique=true)
	private String email;
	@Column
	private String password;
	@Column
	private String gender;
	@Column
	private String secretquestion1;
	@Column
	private String secretquestion2;
	@Column
	private String secretquestion3;
	@Column
	private String answer1;
	@Column
	private String answer2;
	@Column
	private String answer3;
	public int getAdminId() {
		return adminId;
	}
	public void setAdminId(int adminId) {
		this.adminId = adminId;
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public String getContactNumber() {
		return contactNumber;
	}
	public void setContactNumber(String contactNumber) {
		this.contactNumber = contactNumber;
	}
	
	public Date getDateOfBirth() {
		return dateOfBirth;
	}
	public void setDateOfBirth(Date dateOfBirth) {
		this.dateOfBirth = dateOfBirth;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getSecretquestion1() {
		return secretquestion1;
	}
	public void setSecretquestion1(String secretquestion1) {
		this.secretquestion1 = secretquestion1;
	}
	public String getAnswer1() {
		return answer1;
	}
	public void setAnswer1(String answer1) {
		this.answer1 = answer1;
	}
	public String getSecretquestion2() {
		return secretquestion2;
	}
	public void setSecretquestion2(String secretquestion2) {
		this.secretquestion2 = secretquestion2;
	}
	public String getAnswer2() {
		return answer2;
	}
	public void setAnswer2(String answer2) {
		this.answer2 = answer2;
	}
	public String getSecretquestion3() {
		return secretquestion3;
	}
	public void setSecretquestion3(String secretquestion3) {
		this.secretquestion3 = secretquestion3;
	}
	public String getAnswer3() {
		return answer3;
	}
	public void setAnswer3(String answer3) {
		this.answer3 = answer3;
	}
	@Override
	public String toString() {
		return "Admin [adminId=" + adminId + ", firstName=" + firstName + ", lastName=" + lastName + ", contactNumber="
				+ contactNumber + ", dateOfBirth=" + dateOfBirth + ", email=" + email + ", password=" + password
				+ ", gender=" + gender + ", secretquestion1=" + secretquestion1 + ", secretquestion2=" + secretquestion2
				+ ", secretquestion3=" + secretquestion3 + ", answer1=" + answer1 + ", answer2=" + answer2
				+ ", answer3=" + answer3 + "]";
	}
	

}
