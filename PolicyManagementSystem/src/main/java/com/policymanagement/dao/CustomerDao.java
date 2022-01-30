package com.policymanagement.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.policymanagement.models.Customer;
@Repository
public interface CustomerDao extends JpaRepository<Customer, Integer>{
	public Customer findByUserId(int customerId);
	@Query("select max(userId) from Customer")
	public int nextuserId();
	public Customer findBycontactNumber(String contactNumber);
	public Customer findByEmail(String email);
}
