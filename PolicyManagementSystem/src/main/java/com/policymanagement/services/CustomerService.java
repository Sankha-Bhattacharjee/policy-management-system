package com.policymanagement.services;

import java.util.List;

import com.policymanagement.models.Customer;
import com.policymanagement.models.CustomerLogin;
import com.policymanagement.models.ForgotUid;
import com.policymanagement.models.Help;
import com.policymanagement.models.Payments;
import com.policymanagement.models.Policy;
import com.policymanagement.models.PolicyVendor;

public interface CustomerService {
	public int createCustomer(Customer customer);
	public boolean verifyLogin(CustomerLogin customerLogin);
	public Customer getCustomer(int custid);
	public List<Policy> getAll();
	public int nextuserId();
	public Policy getpolbyname(String polname);
	public Policy getpolbyid(int polbyid);
	public boolean updateCustomer(Customer customer);
	public boolean buypolicy(Payments payment);
	public int help(Help h);
	public int fid(ForgotUid fuid);
	public boolean fpwd(ForgotUid fuid);
}
