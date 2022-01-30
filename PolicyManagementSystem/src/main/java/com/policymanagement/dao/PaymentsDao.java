package com.policymanagement.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.policymanagement.models.Payments;

@Repository
public interface PaymentsDao extends JpaRepository<Payments, Integer> {
	public Payments findByPayid(int payid);
	public Payments findByUserId(int userId);
}
