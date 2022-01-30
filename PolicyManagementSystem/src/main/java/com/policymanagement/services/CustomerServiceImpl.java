package com.policymanagement.services;

import java.util.List;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import com.policymanagement.dao.CustomerDao;
import com.policymanagement.dao.HelpDao;
import com.policymanagement.dao.PaymentsDao;
import com.policymanagement.dao.PolicyDao;
import com.policymanagement.models.Customer;
import com.policymanagement.models.CustomerLogin;
import com.policymanagement.models.ForgotUid;
import com.policymanagement.models.Help;
import com.policymanagement.models.Payments;
import com.policymanagement.models.Policy;

@Service
@Component
public class CustomerServiceImpl implements CustomerService {
	@Autowired
	private CustomerDao custdao;
	@Autowired
	private PolicyDao policydao;
	@Autowired
	private PaymentsDao paydao;
	@Autowired
	private HelpDao helpdao;
	 @PostConstruct
	public void init() {
		long count=custdao.count();
		System.out.println(count);
		if(count==0) {
			Customer c=new Customer();
			c.setUserId(2000);
			custdao.save(c);
		}
	}
	 
	@Override
	public int createCustomer(Customer customer) {
		Customer c=custdao.findByUserId(customer.getUserId());
		Customer c3=custdao.findBycontactNumber(customer.getContactNumber());
		Customer c2=custdao.findByEmail(customer.getEmail());
		if(c3!=null) {
			return 3;
		}
		else if(c2!=null) {
			return 4;
		}
		else if(c==null) {
			Customer c1=custdao.save(customer);
			if(c1!=null)
			{
				return 1;
			}
			else {
				return 0;
			}
		}
		return 2;
	}

	@Override
	public boolean verifyLogin(CustomerLogin customerlogin) {
		
		Customer c2=custdao.findByUserId(customerlogin.getUserId());
		if(c2!=null) {
			return c2.getPassword().equals(customerlogin.getPassword());
		}
		
		return false;
	}

	@Override
	public Customer getCustomer(int custid) {
		
		return custdao.findByUserId(custid);
	}

	@Override
	public List<Policy> getAll() {
		
		return policydao.findAll();
	}

	@Override
	public int nextuserId() {
		
		return custdao.nextuserId();
	}
	@Override
	public Policy getpolbyname(String polname) {
		return policydao.findByPolicyName(polname);
	}

	@Override
	public Policy getpolbyid(int polbyid) {
		
		//return policydao.findByPolicyId(polbyid).get();
		return policydao.findById(polbyid).get();
	}

	@Override
	public boolean updateCustomer(Customer customer) {
		Customer cu=custdao.save(customer);
		if(cu!=null) {
		return true;
		}
		return false;
	}

	@Override
	public boolean buypolicy(Payments payment) {
		Payments pay=paydao.save(payment);
		if(pay!=null) {
			return true;
		}
		return false;
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

	@Override
	public boolean fpwd(ForgotUid fuid) {
		Customer a1=custdao.findByUserId(fuid.getUid());
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
		Customer a1=custdao.findBycontactNumber(fuid.getContactNumber());
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
					return a1.getUserId();
				}
			}
		  }
		  return 0;
		}

}
