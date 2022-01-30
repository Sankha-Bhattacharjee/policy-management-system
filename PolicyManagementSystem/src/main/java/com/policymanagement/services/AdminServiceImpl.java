package com.policymanagement.services;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.validation.Valid;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import com.policymanagement.dao.AdminDao;
import com.policymanagement.dao.HelpDao;
import com.policymanagement.dao.PolicyVendorDao;
import com.policymanagement.models.Admin;
import com.policymanagement.models.AdminLogin;
import com.policymanagement.models.Customer;
import com.policymanagement.models.ForgotUid;
import com.policymanagement.models.Help;
import com.policymanagement.models.PolicyVendor;

@Service
@Component
public class AdminServiceImpl implements AdminService
{
	@Autowired
	private AdminDao admindao;
	@Autowired
	private PolicyVendorDao policyvendordao;
	@Autowired
	private HelpDao helpdao;
	@PostConstruct
	public void init() {
		long count=admindao.count();
		System.out.println(count);
		if(count==0) {
			Admin a=new Admin();
			a.setAdminId(1000);
			admindao.save(a);
		}
	}
	
	 
	@Override
	public boolean login(AdminLogin adminLogin) 
	{
		Admin a=admindao.findByAdminId(adminLogin.getAdminId());
		if(a!=null)
		{
			return a.getPassword().equals(adminLogin.getPassword());
		}
		return false;
	}

	@Override
	public int createAdmin(@Valid Admin admin)
	{
		Admin a=admindao.findByAdminId(admin.getAdminId());
		Admin a1=admindao.findBycontactNumber(admin.getContactNumber());
		Admin a2=admindao.findByEmail(admin.getEmail());
		if(a1!=null) {
			 return 3;
		}
		else if(a2!=null) {
			return 4;
		}
		else if(a==null)
		{
			Admin ad=admindao.save(admin);
			if(ad!=null)
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
	public Admin getAdmin(int adminId) {
		
		return admindao.findByAdminId(adminId);
	}

	@Override
	public List<PolicyVendor> getAll() {
		
		return policyvendordao.findAll();
	}

	@Override
	public int nextadminId() {
		
		return admindao.nextadminId();
	}


	@Override
	public List<Help> getAllh() {
		
		return helpdao.findAll();
	}

	@Override
	public int fid(ForgotUid fuid) {
		Admin a1=admindao.findBycontactNumber(fuid.getContactNumber());
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
					return a1.getAdminId();
				}
			}
		  }

		return 0;
	}

//new method
	@Override
	public boolean fpwd(ForgotUid fuid) {
		Admin a1=admindao.findByAdminId(fuid.getUid());
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
		

}
