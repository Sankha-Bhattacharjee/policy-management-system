package com.policymanagement.models;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.OneToMany;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

@Entity
@Table
public class Policy {
	@SequenceGenerator(name = "elPolicySeq",initialValue = 4000, allocationSize = 1, sequenceName = "EL_POLICY_SEQ")
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "elPolicySeq")
	private int  policyId;
	@Column
	private String policyName;
	@Column
	private int durationOfPolicy;
	@Column
	private double sumassured;
	@Column
	private int policyvendorId;
	@Column
	private String policytype;
	@Column
	private double fineperday;
	@OneToMany(cascade = CascadeType.ALL,fetch = FetchType.LAZY)
    @JoinTable(name = "policy_pay_table",joinColumns = {@JoinColumn(name="policyId",referencedColumnName = "policyId")},inverseJoinColumns ={@JoinColumn(name="payId", referencedColumnName ="payId" )})
	private List<Payments> payment;
	
	public int getPolicyvendorId() {
		return policyvendorId;
	}
	public void setPolicyvendorId(int policyvendorId) {
		
		this.policyvendorId = policyvendorId;
	}
	public int getPolicyId() {
		return policyId;
	}
	public void setPolicyId(int policyId) {
		this.policyId = policyId;
	}
	public String getPolicyName() {
		return policyName;
	}
	public void setPolicyName(String policyName) {
		this.policyName = policyName;
	}
	public int getDurationOfPolicy() {
		return durationOfPolicy;
	}
	public void setDurationOfPolicy(int durationOfPolicy) {
		this.durationOfPolicy = durationOfPolicy;
	}
	
	public double getSumassured() {
		return sumassured;
	}
	public void setSumassured(double sumassured) {
		this.sumassured = sumassured;
	}
	public String getPolicytype() {
		return policytype;
	}
	public void setPolicytype(String policytype) {
		this.policytype = policytype;
	}
	public double getFineperday() {
		return fineperday;
	}
	public void setFineperday(double fineperday) {
		this.fineperday = fineperday;
	}
	public List<Payments> getPayment() {
		return payment;
	}
	public void setPayment(List<Payments> payment) {
		this.payment = payment;
	}
	@Override
	public String toString() {
		return "Policy [policyId=" + policyId + ", policyName=" + policyName + ", durationOfPolicy=" + durationOfPolicy
				+ ", sumassured=" + sumassured + ", policyvendorId=" + policyvendorId + ", policytype=" + policytype
				+ ", fineperday=" + fineperday + ", payment=" + payment + "]";
	}
	
	


}
