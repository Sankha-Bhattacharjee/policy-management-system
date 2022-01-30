package com.policymanagement.services;

import java.util.List;


import javax.validation.Valid;

import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import com.policymanagement.models.Admin;
import com.policymanagement.models.AdminLogin;
import com.policymanagement.models.ForgotUid;
import com.policymanagement.models.Help;
import com.policymanagement.models.PolicyVendor;


@Service
@Component
public interface AdminService {
	public boolean login(AdminLogin adminLogin);

	public int createAdmin(@Valid Admin admin);
	public Admin getAdmin(int adminId);
	public List<PolicyVendor> getAll();
	public int nextadminId();
	public List<Help> getAllh();
	public boolean fpwd(ForgotUid fuid);
	public int fid(ForgotUid fuid);
}
