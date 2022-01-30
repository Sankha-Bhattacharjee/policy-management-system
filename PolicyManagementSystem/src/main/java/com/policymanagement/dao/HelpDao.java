package com.policymanagement.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.policymanagement.models.Help;

@Repository
public interface HelpDao extends JpaRepository<Help, Integer>{
	public Help findByHid(int hid);

}
