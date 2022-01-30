package com.policymanagement.services;


import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import com.policymanagement.dao.HelpDao;
import com.policymanagement.dao.PolicyDao;
import com.policymanagement.dao.PolicyVendorDao;
import com.policymanagement.models.Customer;
import com.policymanagement.models.ForgotUid;
import com.policymanagement.models.Help;
import com.policymanagement.models.Policy;
import com.policymanagement.models.PolicyVendor;
import com.policymanagement.models.PolicyVendorLogin;
@Service
@Component
public class PolicyVendorServiceImpl implements PolicyVendorService{
	@Autowired
	private PolicyVendorDao policyvendordao;
	@Autowired
	private PolicyDao policydao;
	@Autowired
	private HelpDao helpdao;
	@PostConstruct
	public void init() {
		long count=policyvendordao.count();
		System.out.println(count);
		if(count==0) {
			PolicyVendor p=new PolicyVendor();
			p.setVendorId(3000);
			policyvendordao.save(p);
		}
	}
	@Override
	public boolean vlogin(PolicyVendorLogin policyvendorLogin) {
		PolicyVendor u = policyvendordao.findByVendorId(policyvendorLogin.getVendorId());
		if(u!=null)
		{
			return u.getPassword().equals(policyvendorLogin.getPassword());
		}
		return false;
	}

	@Override
	public int createPolicyVendor(@Valid PolicyVendor policyvendor) {
		PolicyVendor u=policyvendordao.findByVendorId(policyvendor.getVendorId());
		PolicyVendor u2=policyvendordao.findBycontactnumber(policyvendor.getContactnumber());
		PolicyVendor u3=policyvendordao.findByemailaddress(policyvendor.getEmailaddress());
		System.out.println(u3);
		if(u3!=null) {
			return 4;
		}
		else if(u2!=null) {
			return 3;
		}
		else if(u==null)
		{	
			
			PolicyVendor u1=policyvendordao.save(policyvendor);
			if(u1!=null)
			{
				return 1;
			}
			else
			{
				return 2;
			}
		}
		return 0;
	}

	@Override
	public PolicyVendor getPolicyVendor(int vendorId) {
		
		return policyvendordao.findByVendorId(vendorId);
	}

	@Override
	public boolean addPolicy(Policy policy) {
		
		Policy p= policydao.save(policy);
		if(p!=null) {
			return true;
		}
		return false;
	}

	@Override
	public int nextvendotId() {
				return policyvendordao.nextvendoId();
	}

	
	@Override
	public List<PolicyVendor> getAll() {
		
		return policyvendordao.findAll();
	}
	@Override
	public List<Policy> getAllpolicies() {
		
		return policydao.findAll();
	}
	@Override
	public Policy getpolbyid(int policyid) {
		
		return policydao.findByPolicyId(policyid);
	}
	

	
		@Override
	public boolean fpwd(ForgotUid fuid) {
		PolicyVendor a1=policyvendordao.findByVendorId(fuid.getUid());
		  if(a1!=null)
		  {
			int a2= a1.getSecretquestion1().compareTo(fuid.getQstn1());
			int a3= a1.getSecretquestion2().compareTo(fuid.getQstn2());
			int a4= a1.getSecretquestion3().compareTo(fuid.getQstn3());
			if((a2==0) && (a3==0) && (a4==0))
			{
				boolean a5=a1.getAnswer1().equalsIgnoreCase(fuid.getAns1());
				boolean a6=a1.getAnswer2().equalsIgnoreCase(fuid.getAns2());
				boolean a7=a1.getAnswer3().equalsIgnoreCase(fuid.getAns3());
				if((a5==true) &&(a6==true) && (a7==true))
				{
					return true;
				}
			}
		  }
		  return false;
		}
	@Override
	public int fid(ForgotUid fuid) {
		PolicyVendor a1=policyvendordao.findBycontactnumber(fuid.getContactNumber());
		  if(a1!=null)
		  {
			int a2= a1.getSecretquestion1().compareTo(fuid.getQstn1());
			int a3= a1.getSecretquestion2().compareTo(fuid.getQstn2());
			int a4= a1.getSecretquestion3().compareTo(fuid.getQstn3());
			if((a2==0) && (a3==0) && (a4==0))
			{
				boolean a5=a1.getAnswer1().equalsIgnoreCase(fuid.getAns1());
				boolean a6=a1.getAnswer2().equalsIgnoreCase(fuid.getAns2());
				boolean a7=a1.getAnswer3().equalsIgnoreCase(fuid.getAns3());
				if((a5==true) &&(a6==true) && (a7==true))
				{
					return a1.getVendorId();
				}
			}
		  }
		  return 0;
		}
	@Override
	public int help(Help h) {
		Help h1= helpdao.save(h);
		if(h!=null) {
			return 1;
		}
		else {
			return 2;
		}
	
	}

}