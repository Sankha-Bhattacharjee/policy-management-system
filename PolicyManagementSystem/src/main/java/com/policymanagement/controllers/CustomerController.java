package com.policymanagement.controllers;

import java.text.SimpleDateFormat;
import java.time.*;
import java.time.LocalDate;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.policymanagement.dao.ClaimPolicyDao;
import com.policymanagement.dao.CustomerDao;
import com.policymanagement.dao.PaymentsDao;
import com.policymanagement.dao.PolicyDao;
import com.policymanagement.dao.PolicyVendorDao;
import com.policymanagement.models.ClaimPolicy;
import com.policymanagement.models.Customer;
import com.policymanagement.models.CustomerLogin;
import com.policymanagement.models.ForgotUid;
import com.policymanagement.models.Help;
import com.policymanagement.models.Payments;
import com.policymanagement.models.Policy;
import com.policymanagement.models.PolicyVendor;
import com.policymanagement.models.SearchP;
import com.policymanagement.services.CustomerService;
import com.policymanagement.services.PolicyVendorService;

@Controller
@RequestMapping(value = "/customer")
public class CustomerController {
	@Autowired
	private CustomerService custser;
	@Autowired
	private PolicyVendorService policyvendorser;
	@Autowired
	private PolicyVendorDao policyvendordao;
	@Autowired
	private CustomerDao custdao;
	@Autowired
	private PaymentsDao paydao;
	@Autowired
	private ClaimPolicyDao cpdao;
	@Autowired
	private PolicyDao poldao;

	@GetMapping("/")
	public String customerlogin(Model model) {
		model.addAttribute("custml", new CustomerLogin());
		return "customerLogin";
	}

	@PostMapping("/customlogin")
	public String verifyClogin(@Valid @ModelAttribute("custml") CustomerLogin customerlogin, Model model,
			BindingResult result, HttpSession session) {

		if (result.hasErrors()) {
			// model.addAttribute("message,result");
			return "customerLogin";
		} else {
			boolean b = custser.verifyLogin(customerlogin);
			if (b == true) {
				Customer cust = custser.getCustomer(customerlogin.getUserId());
				session.setAttribute("username", cust.getFirstName());
				session.setAttribute("userId", customerlogin.getUserId());
				return "customerHome";
			} else {
				model.addAttribute("message", "Invalid UserName or Password");
				return "customerLogin";
			}
		}
	}

	@GetMapping("/custregister")
	public String customerReg(Model model) {

		int cid = custser.nextuserId();
		Customer customer = new Customer();
		customer.setUserId(cid + 1);

		model.addAttribute("customerreg", customer);
		return "customerRegistration";
	}

	@PostMapping("/customerregistration")
	public String verifyCustReg(@Valid @ModelAttribute("customerreg") Customer customer, Model model,
			BindingResult result, HttpSession session) {
		if (result.hasErrors()) {
			model.addAttribute("message", result);
			return "customerRegistration";
		} else {
			customer.setBalance(200000);
			int res = custser.createCustomer(customer);
			if (res == 0) {
				model.addAttribute("message", customer.getFirstName().toUpperCase() + "You are already register");
			} else if (res == 1) {
				model.addAttribute("message", customer.getFirstName().toUpperCase() + " registeration Successfull <br><br>" +customer.getUserId()+" this is your login userId  PLEASE NOTE IT");
			} 
			else if(res==3)
			{
				model.addAttribute("contactN", "Contact Number already exists");
				return "customerRegistration";
			}
			else if(res==4)
			{
				model.addAttribute("emailAdd", "Email Id already exists");
				return "customerRegistration";
			}
			else{
				model.addAttribute("message", "something went wrong");
			}
			model.addAttribute("custml", new CustomerLogin());
			return "customerLogin";
		}
	}

	@GetMapping("/listofpolicies")
	public String findAllPolicies(HttpSession session, Model model) {
		List<PolicyVendor> pvl = policyvendorser.getAll();
		List<Policy> pl = custser.getAll();
		List<Policy> p2 = new ArrayList<Policy>();
		for (Policy p1 : pl) {
			PolicyVendor pov = policyvendordao.findByVendorId(p1.getPolicyvendorId());

			boolean check = pov.getStatus().equals("activate");

			// System.out.println(check);
			if (check) {
				// System.out.println("------");
				p2.add(p1);
			}
			model.addAttribute("policylist", p2);
			// System.out.println(p2);
		}
		return "customerHome";
	}

	@GetMapping("/searchp")
	public String searchPolicy(Model model, HttpSession session) {
		// Policy poli=new Policy();
		model.addAttribute("searchpo", new SearchP());
		return "searchPolicy";
	}

	@PostMapping("/searchpol")
	public String searchpolbyc(@ModelAttribute("searchpo") SearchP search, Model model) {
		
		String t = search.getText();
		List<Policy> poli2 = custser.getAll();
		System.out.println(poli2);
		List<Policy> p4 = new ArrayList<Policy>();
		
		for (Policy p3 : poli2) {

			if (p3.getPolicytype().toLowerCase().contains(t.toLowerCase())) {
				
				p4.add(p3);
				model.addAttribute("searchlist", p4);
			} 
			else if (p3.getPolicyName().toLowerCase().contains(t.toLowerCase())) {
				
				p4.add(p3);
				model.addAttribute("searchlist", p4);
			} 
			

		}
		
		return "customerHome";

	}
	
	@GetMapping("/buypolicy")
	public String buyPolicy(@RequestParam("policyid") int id, HttpSession session, Model model) {
		List<Payments> pay = paydao.findAll();
		Policy p = custser.getpolbyid(id);
		System.out.println(p);
		int customerid = (Integer) session.getAttribute("userId");
		for (Payments pa : pay) {
			if (pa.getUserId() == customerid && pa.getPolicyId() == id) {
				model.addAttribute("message", "You already bought this policy");
				return "customerHome";
			}
		}
		Payments payment = new Payments();
		payment.setPolicyId(p.getPolicyId());
		payment.setUserId(customerid);
		payment.setFineperday(p.getFineperday());
		payment.setSumassured(p.getSumassured());
		payment.setDurationOfPolicy(p.getDurationOfPolicy());
		model.addAttribute("payment", payment);

		return "payment";
	}

	@GetMapping("/duebill")
	public String paycard1(@RequestParam("pid") int payId, Model model) {
		Payments paym = paydao.findByPayid(payId);
		Policy pol=poldao.findByPolicyId(paym.getPolicyId());
		String s = paym.getPaystatus();
		if (!s.equals("paid")) {
			paym.setPaystatus("paid");
			paym.setLastpaid(new Date());
			LocalDate date = LocalDate.now();
			System.out.println("Current Date: " + date);
			date = date.plusDays(paym.getPaymentperiod());
			System.out.println("Date after Increment: " + date);
			Date date1 = Date.from(date.atStartOfDay(ZoneId.systemDefault()).toInstant());
			System.out.println("Date after Increment: " + date1);
			paym.setNextpayDate(date1);
			int cusid = paym.getUserId();
			Customer cust = custser.getCustomer(cusid);
			PolicyVendor pv = policyvendorser.getPolicyVendor(pol.getPolicyvendorId());
			if (cust.getBalance() < paym.getTotalamount()) {
				cust.setBalance(100000);
				custdao.save(cust);
			}
			double cb = cust.getBalance() - paym.getTotalamount();
			cust.setBalance(cb);
			custdao.save(cust);
			double pvb = pv.getBalance() + paym.getTotalamount();
			pv.setBalance(pvb);
			policyvendordao.save(pv);
			paydao.save(paym);
		}

		model.addAttribute("payment", paym);
		return "duepayments";
	}

	@PostMapping("/cardpayment1")
	public String duepay(@ModelAttribute("payment") Payments pay, Model model) {
		List<Payments> pay1 = paydao.findAll();

		model.addAttribute("message", "Successfully paid");
		return "customerHome";

	}

	@PostMapping("/cardpayment")
	public String paycard(@ModelAttribute("payment") Payments pay, Model model) {
		boolean status = custser.buypolicy(pay);

		Policy pol = custser.getpolbyid(pay.getPolicyId());

		PolicyVendor pv = policyvendorser.getPolicyVendor(pol.getPolicyvendorId());
		Customer cus = custser.getCustomer(pay.getUserId());
		if (cus.getBalance() < pay.getTotalamount()) {
			cus.setBalance(100000);
			custdao.save(cus);
		}
		double cb = cus.getBalance() - pay.getTotalamount();
		cus.setBalance(cb);
		custdao.save(cus);
		double pvb = pv.getBalance() + pay.getTotalamount();
		pv.setBalance(pvb);
		policyvendordao.save(pv);
		LocalDate date = LocalDate.now();
		System.out.println("Current Date: " + date);
		date = date.plusDays(pay.getPaymentperiod());
		System.out.println("Date after Increment: " + date);
		Date date1 = Date.from(date.atStartOfDay(ZoneId.systemDefault()).toInstant());
		System.out.println("Date after Increment: " + date1);
		pay.setNextpayDate(date1);
		pay.setPaystatus("paid");
		paydao.save(pay);
		java.util.Date date5 = new java.util.Date();

		if (status) {
			model.addAttribute("message", "Successfully paid");
			return "customerHome";
		} else {
			model.addAttribute("message", "Payment failed,try again");
			return "cardpayments";
		}

	}

	@GetMapping("/listofmypolicies")
	public String findmyPolicies(HttpSession session, Model model) {
		List<Payments> pay = paydao.findAll();
		int uid = (Integer) session.getAttribute("userId");
		List<Policy> pl = custser.getAll();
		List<Policy> p2 = new ArrayList<Policy>();
		List<Payments> pay1 = new ArrayList<Payments>();
		LocalDate dl, dl1;
		
		for (Payments p : pay) {
			if(p.getUserId() == uid && 
					(p.getPaystatus().equals("claimed")|| 
							p.getPaystatus().equals("requested for claim") ||
							p.getPaystatus().equals("paid") || 
							p.getPaystatus().equals("pending"))||p.getPaystatus().equals("claim rejected")) {
				
				
			for (Policy p1 : pl) {
				if (p.getPolicyId() == p1.getPolicyId() ) {
					p2.add(p1);
					System.out.println(p2);
					//next pay date is after current date
					dl = LocalDate.parse(new SimpleDateFormat("yyyy-MM-dd").format(p.getNextpayDate()));
					dl1 = LocalDate.parse(new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
					long days = ChronoUnit.DAYS.between(dl1, dl);
					model.addAttribute("noofdays", days);
					System.out.println(days);
					if(p.getNextpayDate().compareTo(new Date())>0 && days>=1 && days<=30) {
						if(p.getPaystatus().equals("claimed") || p.getPaystatus().equals("requested for claim")) {
							paydao.save(p);
						}
						else if(p.getPaystatus().equals("claim rejected")) {
							p.setFineamount(0);
							p.setTotalamount(p.getAmount()+p.getFineamount());
							paydao.save(p);
						}
						
						else {
						p.setPaystatus("pending");
						p.setFineamount(0);
						p.setTotalamount(p.getAmount()+p.getFineamount());
						paydao.save(p);
						}
						//pay1.add(p);
					}
					//next pay date is before current date
					else if(p.getNextpayDate().compareTo(new Date())<0 && days<1) {
						p.setPaystatus("pending");
						double fine=p.getFineperday()*(-(days));
						p.setFineamount(fine);
						p.setTotalamount(p.getAmount()+fine);
						paydao.save(p);
						
					}
					pay1.add(p);
				}
				
			}
			}
			
		}
		
		model.addAttribute("mypol", p2);
		model.addAttribute("mypol1", pay1);
		return "customerHome";
	}

	
	@GetMapping("/beforehelp")
	public String help(Model model) {
		model.addAttribute("help", new Help());
		return "customerHelp";
	}

	@PostMapping("/afterhelp")
	  public String help1(@ModelAttribute("help") Help h,BindingResult result,Model model) 
	  {
		  if(result.hasErrors()) {
			  return "customerHelp";
		  }
		  else {
			  int status =custser.help(h);
			  if(status==1) {
				  model.addAttribute("message", "Your Issue is Registered");
				  return "customerHome";
			  }
			  else {
				  model.addAttribute("message", "Something went wrong");
				  return "customerHelp";
			  }
		  }
	  }

@GetMapping("/rminders")
	  public String reminders(Model model,HttpSession session) {
		 List<Payments> pay=paydao.findAll();
		  
		  int  customerid=(Integer)session.getAttribute("userId");
		  //Payments pa=paydao.findByUserId(customerid);
		  
		  Date d1,d2;
		  LocalDate dl1,dl2;
		  for(Payments pa:pay) {
			  if(pa.getUserId()==customerid && pa.getReminder().equals("yes")) {
				  
			  
				  Policy pol=poldao.findByPolicyId(pa.getPolicyId()); 
			  System.out.println(pol);
				 System.out.println(pa);   
					d1=pa.getNextpayDate();
					dl1=LocalDate.parse(new SimpleDateFormat("yyyy-MM-dd").format(d1));
					d2=new Date();
					dl2=LocalDate.parse(new SimpleDateFormat("yyyy-MM-dd").format(d2));
					long days=ChronoUnit.DAYS.between(dl2, dl1);
					
					if(pa.getNextpayDate().compareTo(new Date())>0) {
						
						model.addAttribute("rem","Your bill for "+pol.getPolicyName()+" is due in "+days+" days");
						
					}
				
				 else if(pa.getNextpayDate().compareTo(new Date())<0) {
				  model.addAttribute("rem","Your due bills are late by "+days+" days"); 
				   
				 }
				 
				  
					System.out.println(pa.getNextpayDate().compareTo(new Date())>0);
					return "customerHome";
					
		  }
			  else if(pa.getReminder().equals("no"))
			  {
				  model.addAttribute("rem", "You have not opted for reminders please check MyPolicies");
			  }
			  
		  }
		  
			return "customerHome";
	  }
	  @GetMapping("/claim")
	  public String claimpol(@RequestParam("payid")int payD,Model model,HttpSession session) {
		  List<ClaimPolicy> cp=cpdao.findAll();
		  Payments pa=paydao.findByPayid(payD);
		  Policy poli=poldao.findByPolicyId(pa.getPolicyId());
		  int  customerid=(Integer)session.getAttribute("userId");
		
		  for(ClaimPolicy clp:cp) {
			  
			  if(clp.getPayid()==payD && clp.getCstatus().equals("rejectedv")) {
		  model.addAttribute("message","You already claimed this policy and is "+clp.getCstatus());
		  return "customerHome"; 
		  } 
		  }
		  ClaimPolicy claimp=new ClaimPolicy();
		  claimp.setPayid(payD);
		  claimp.setPolicyname(poli.getPolicyName());
		  claimp.setUserid(customerid);
		  model.addAttribute("claimpol", claimp);
			
			return "claimform";
		  
	  }
	  @PostMapping("/claimf")
	  public String claimpoldb(@ModelAttribute("claimpol")ClaimPolicy claim1,Model model)
	  {
		  claim1.setCstatus("requested");
		  ClaimPolicy clmp=cpdao.save(claim1);
		  int pid=claim1.getPayid();
		  Payments pay=paydao.findByPayid(pid);
		  pay.setPaystatus("requested for claim");
		  pay.setReminder("no");
		  paydao.save(pay);
		  model.addAttribute("message","Requested to claim the policy");
		  return "customerHome";
	  }
	  @GetMapping("/cforgotuid")
		public String fid(Model model){
			model.addAttribute("name",new ForgotUid());
			return "CusForgotid";
		}
		@PostMapping("/cforgotuid1")
		public String fid1(@ModelAttribute("name") ForgotUid fid,Customer customer,Model model)
		{
			int b=custser.fid(fid);
			if(b!=0)
			{
		  	model.addAttribute("message",b+" is your id");
			}
			else
			{
				model.addAttribute("message", "Incorrect credentials");
			}
			return "CusForgotid";
		}
		@GetMapping("/cforgotpswd")
		public String fpwd(Model model){
			model.addAttribute("name1",new ForgotUid());
			return "CusForgotPwd";
		}
		@PostMapping("/cforgotpwd1")
		public String fpwd1(@ModelAttribute("name1") ForgotUid fid,Model model)
		{
			boolean b=custser.fpwd(fid);
			if(b==true)
			{
				
		  	  return "CusResetPwd";
			}
			else
			{
				model.addAttribute("message", "Incorrect credentials");
				return "CusForgotPwd";
			}
		}
		@PostMapping("/cupdatepwd")
		public String updatePassword(@ModelAttribute("name1") ForgotUid forgetUID,Model model)
		{
			Customer cd =custdao.findByUserId(forgetUID.getUid());
			cd.setPassword(forgetUID.getPwd());
			custdao.save(cd);
			model.addAttribute("message","your password has been updated");
			return "CusResetPwd";
		}
	@GetMapping("/logout")
	public String logout(HttpSession session)
	{
		session.invalidate();
		return "redirect:/";
	}
	
}
