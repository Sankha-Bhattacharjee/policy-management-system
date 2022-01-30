package com.policymanagement.services;

import java.util.List;

import javax.validation.Valid;

import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import com.policymanagement.models.ForgotUid;
import com.policymanagement.models.Help;
import com.policymanagement.models.Policy;
import com.policymanagement.models.PolicyVendor;
import com.policymanagement.models.PolicyVendorLogin;

@Service
@Component
public interface PolicyVendorService {
	public boolean vlogin(PolicyVendorLogin policyvendorLogin);

	public int createPolicyVendor(@Valid PolicyVendor policyvendor);
	
	public PolicyVendor getPolicyVendor(int vendorId);
	public boolean addPolicy(Policy policy);
	public int nextvendotId();
	public List<Policy> getAllpolicies();
	public Policy getpolbyid(int policyid);
	public List<PolicyVendor> getAll();
	public int fid(ForgotUid fuid);
	public boolean fpwd(ForgotUid fuid);
	public int help(Help h);
}
