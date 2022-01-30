package com.policymanagement.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.policymanagement.models.ClaimPolicy;

@Repository
public interface ClaimPolicyDao extends JpaRepository<ClaimPolicy,Integer> {
	public ClaimPolicy findByclaimid(int claimid);
}
