package com.policymanagement.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.policymanagement.models.Admin;


@Repository
public interface AdminDao extends JpaRepository<Admin, Integer> {
	public Admin findByAdminId(int adminId);
	@Query("select max(adminId) from Admin")
	public int nextadminId();
	public Admin findBycontactNumber(String phno);
	public Admin findByEmail(String email);

}
