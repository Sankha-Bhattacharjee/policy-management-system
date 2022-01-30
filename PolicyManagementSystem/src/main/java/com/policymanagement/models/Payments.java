package com.policymanagement.models;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import org.hibernate.annotations.CreationTimestamp;
import org.springframework.format.annotation.DateTimeFormat;
@Entity
@Table
public class Payments {
	@SequenceGenerator(name = "paySeq",initialValue = 5000, allocationSize = 1,sequenceName = "PAY_SEQ")
	@Id()
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "paySeq")	
	private int payid;
	@Column
	private int policyId;
	@Column
	private int userId;
	@Column
	private double amount;
	@Column
	private double sumassured;
	@Column
	private int durationOfPolicy;
	@Column
	//@DateTimeFormat(style = "dd-mm-yyyy")
	private Date nextpayDate;
	@Column
	private String reminder;
	@Column
	@CreationTimestamp
	private Date lastpaid;
	@Column
	@CreationTimestamp
	private Date policyboughtdate;
	@Column
	private double fineperday;
	@Column
	private double fineamount;
	@Column
	private double totalamount;
	@Column
	private int paymentperiod;
	@Column
	private String paystatus;
	
	public String getPaystatus() {
		return paystatus;
	}
	public void setPaystatus(String paystatus) {
		this.paystatus = paystatus;
	}
	public int getPayid() {
		return payid;
	}
	public void setPayid(int payid) {
		this.payid = payid;
	}
	public int getPolicyId() {
		return policyId;
	}
	public void setPolicyId(int policyId) {
		this.policyId = policyId;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public double getAmount() {
		return amount;
	}
	public void setAmount(double amount) {
		this.amount = amount;
	}
	
	public String getReminder() {
		return reminder;
	}
	public void setReminder(String reminder) {
		this.reminder = reminder;
	}
	public Date getLastpaid() {
		return lastpaid;
	}
	public void setLastpaid(Date lastpaid) {
		this.lastpaid = lastpaid;
	}
	public double getFineperday() {
		return fineperday;
	}
	public void setFineperday(double fineperday) {
		this.fineperday = fineperday;
	}
	public double getFineamount() {
		return fineamount;
	}
	public void setFineamount(double fineamount) {
		this.fineamount = fineamount;
	}
	public double getTotalamount() {
		return totalamount;
	}
	public void setTotalamount(double totalamount) {
		this.totalamount = totalamount;
	}
	public int getPaymentperiod() {
		return paymentperiod;
	}
	public void setPaymentperiod(int paymentperiod) {
		this.paymentperiod = paymentperiod;
	}
	public Date getNextpayDate() {
		return nextpayDate;
	}
	public void setNextpayDate(Date nextpayDate) {
		this.nextpayDate = nextpayDate;
	}
	public double getSumassured() {
		return sumassured;
	}
	public void setSumassured(double sumassured) {
		this.sumassured = sumassured;
	}
	public Date getPolicyboughtdate() {
		return policyboughtdate;
	}
	public void setPolicyboughtdate(Date policyboughtdate) {
		this.policyboughtdate = policyboughtdate;
	}
	public int getDurationOfPolicy() {
		return durationOfPolicy;
	}
	public void setDurationOfPolicy(int durationOfPolicy) {
		this.durationOfPolicy = durationOfPolicy;
	}
	@Override
	public String toString() {
		return "Payments [payid=" + payid + ", policyId=" + policyId + ", userId=" + userId + ", amount=" + amount
				+ ", sumassured=" + sumassured + ", durationOfPolicy=" + durationOfPolicy + ", nextpayDate="
				+ nextpayDate + ", reminder=" + reminder + ", lastpaid=" + lastpaid + ", policyboughtdate="
				+ policyboughtdate + ", fineperday=" + fineperday + ", fineamount=" + fineamount + ", totalamount="
				+ totalamount + ", paymentperiod=" + paymentperiod + ", paystatus=" + paystatus + "]";
	}
	

}
