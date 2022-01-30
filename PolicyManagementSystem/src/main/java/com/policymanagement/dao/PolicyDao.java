package com.policymanagement.dao;

import java.util.List;


import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.policymanagement.models.Policy;


@Repository
public interface PolicyDao extends JpaRepository<Policy, Integer> {
	public List<Policy> findAll();
	public Policy findByPolicyId(int pId);
	public Policy findByPolicyName(String pname);
	
}
