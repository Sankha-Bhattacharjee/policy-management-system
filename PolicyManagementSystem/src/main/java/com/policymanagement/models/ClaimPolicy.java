package com.policymanagement.models;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

@Entity
@Table
public class ClaimPolicy {
	@SequenceGenerator(name = "claimSeq",initialValue = 9000, allocationSize = 1, sequenceName = "CLAIM_SEQ")
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "claimSeq")
	private int  claimid;
	@Column
	private int payid;
	@Column
	private int userid;
	@Column
	private String reasonbyc;
	@Column
	private String reasonbypv;
	@Column
	private String cstatus;
	@Column
	private String policyname;
	
	public int getUserid() {
		return userid;
	}
	public void setUserid(int userid) {
		this.userid = userid;
	}
	public String getReasonbyc() {
		return reasonbyc;
	}
	public void setReasonbyc(String reasonbyc) {
		this.reasonbyc = reasonbyc;
	}
	public String getReasonbypv() {
		return reasonbypv;
	}
	public void setReasonbypv(String reasonbypv) {
		this.reasonbypv = reasonbypv;
	}
	public String getPolicyname() {
		return policyname;
	}
	public void setPolicyname(String policyname) {
		this.policyname = policyname;
	}
	public int getClaimid() {
		return claimid;
	}
	public void setClaimid(int claimid) {
		this.claimid = claimid;
	}
	public int getPayid() {
		return payid;
	}
	public void setPayid(int payid) {
		this.payid = payid;
	}
	public String getCstatus() {
		return cstatus;
	}
	public void setCstatus(String cstatus) {
		this.cstatus = cstatus;
	}
	@Override
	public String toString() {
		return "ClaimPolicy [claimid=" + claimid + ", payid=" + payid + ", userid=" + userid + ", reasonbyc="
				+ reasonbyc + ", reasonbypv=" + reasonbypv + ", cstatus=" + cstatus + ", policyname=" + policyname
				+ "]";
	}
	

}
