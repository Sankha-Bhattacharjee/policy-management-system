package com.policymanagement.controllers;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.policymanagement.dao.ClaimPolicyDao;
import com.policymanagement.dao.PaymentsDao;
import com.policymanagement.dao.PolicyDao;
import com.policymanagement.dao.PolicyVendorDao;
import com.policymanagement.models.ClaimPolicy;
import com.policymanagement.models.Customer;
import com.policymanagement.models.ForgotUid;
import com.policymanagement.models.Help;
import com.policymanagement.models.Payments;
import com.policymanagement.models.Policy;
import com.policymanagement.models.PolicyVendor;
import com.policymanagement.models.PolicyVendorLogin;
import com.policymanagement.services.PolicyVendorService;
@Controller
@RequestMapping("/policyvendor")


public class PolicyVendorController {
		
		@Autowired
		private PolicyDao policydao;
		@Autowired
		private PolicyVendorService policyvendorService;
		@Autowired
		private PaymentsDao paydao;
		@Autowired
		private ClaimPolicyDao cldao;
		@Autowired
		private PolicyVendorDao pvdao;
		@GetMapping("/")
		public String policyvendorHome(Model model)
		{
			
			model.addAttribute("policyvendor", new PolicyVendorLogin());
			return "policyvendorLogin";
		}
		
		@PostMapping("/policyvendorlogin")
		public String policyvendorLogin(@Valid @ModelAttribute("policyvendor") PolicyVendorLogin policyvendorLogin,BindingResult result, Model model,HttpSession session)
		{
			//System.out.println(stLogin);
			if(result.hasErrors())
			{
				return "policyvendorLogin";
			}
			else
			{
				boolean status = policyvendorService.vlogin(policyvendorLogin);
				if(status)
				{
					
					PolicyVendor p1=policyvendorService.getPolicyVendor(policyvendorLogin.getVendorId());
					if(p1.getStatus().equals("activate")) {
					String pname=p1.getPolicyvendorname();
					session.setAttribute("username", pname);
					session.setAttribute("ptype", p1.getPolicytype());
					session.setAttribute("userId", policyvendorLogin.getVendorId());
					return "policyvendorHome";
					}
				/*
				 * else if(p1.getStatus().equals("makecorrections")) { String
				 * pname=p1.getPolicyvendorname(); session.setAttribute("username", pname);
				 * session.setAttribute("ptype", p1.getPolicytype());
				 * session.setAttribute("userId", policyvendorLogin.getVendorId());
				 * model.addAttribute(
				 * "message1","You need to update your details as admin asked to make corrections"
				 * ); return "policyvendorHome"; }
				 */
					
					
					else {
						
						model.addAttribute("message","You are not yet activated by the admin,please wait for Activation");
						return "policyvendorLogin";
					}
				}
			else
			{
				model.addAttribute("message","Invalid Username OR password");
				return "policyvendorLogin";
			}
			
			}
		}
		
		
		@GetMapping("/policyvendorreg")
		public String userpolicyRegisterForm(Model model)
		{
			int pid=policyvendorService.nextvendotId();
			PolicyVendor policyvendor = new PolicyVendor();
			
			policyvendor.setVendorId(pid+1);
			model.addAttribute("policyvendorreg", policyvendor);
			
			return "policyvendorRegistration";
		}

		
		@PostMapping("/policyvendorreg")
		public String registerVendor(@Valid @ModelAttribute("policyvendorreg") PolicyVendor policyvendor,BindingResult result,Model model)
		{
			if(result.hasErrors())
			{
				return "policyvendorRegistration";
			}
			
			else {
				PolicyVendorLogin policyvendorlogin = new PolicyVendorLogin();
				model.addAttribute("policyvendor",policyvendorlogin);
				policyvendor.setStatus("not yet activated");
				policyvendor.setBalance(200000);
				int res = policyvendorService.createPolicyVendor(policyvendor);
				
			if(res==0)
			{
				model.addAttribute("message", policyvendor.getPolicyvendorname().toUpperCase()+" You are already registered");		
			}
			else if(res==1)
			{
				model.addAttribute("message", policyvendor.getPolicyvendorname().toUpperCase()+" registration Successfull<br><br>"+policyvendor.getVendorId()+" this is your login userId \n PLEASE NOTE IT");
			
			
			}
			else if(res==3)
			{
				model.addAttribute("contactN", "Contact Number already exists");
				return "policyvendorRegistration";
			}
			else if(res==4)
			{
				model.addAttribute("emailAdd", "Email Id already exists");
				return "policyvendorRegistration";
			}
			else
			{
				model.addAttribute("message", "Some thing went wrong");
			
			}
			
			model.addAttribute("userId",policyvendor.getVendorId());
			return "policyvendorLogin";
			}
		}
		@GetMapping("/addpolicy1")
		public String addPolicy(Model model,HttpSession session) 
		{
			String name=(String)session.getAttribute("username");
			int vid=(Integer)session.getAttribute("userId");
			if(vid == 0||name==null) {
				model.addAttribute("newpolicy", new Policy());
				model.addAttribute("message","please Login First < a href='/policyvendor'>");
				return "policyvendorHome";
				
			}
			model.addAttribute("newpolicy", new Policy());
			return "addPolicy";
		}
		@PostMapping("/addpolicy")
		public String createPolicy(@ModelAttribute("newpolicy")Policy policy,Model model) {
			boolean status=policyvendorService.addPolicy(policy);
			if(status) {
				model.addAttribute("message","Policy Created");
				return "policyvendorHome";
			}
			else {
				model.addAttribute("message","Policy not Created, something went wrong");
				return "policyvendorHome";
			}
		}
		
		@GetMapping("/listpolicies")
		public String listmypolicies(HttpSession session,Model model) {
			List<Policy> policy=policyvendorService.getAllpolicies();
			int id=(Integer)session.getAttribute("userId");
			List<Policy> p4=new ArrayList<Policy>();
			for(Policy p3:policy) {
				if(p3.getPolicyvendorId()==id)
				{
					System.out.println(p3);
					p4.add(p3);
					System.out.println(p4);
					model.addAttribute("policyl",p4);
				}
			}
			return "policyvendorHome";
		}
		
		@GetMapping("/editpolicy")
		public String editpolicydetails(@RequestParam("policyid")int pid,Model model,HttpSession session)
		{
			session.setAttribute("polid", pid);
			Policy p=policyvendorService.getpolbyid(pid);
			model.addAttribute("policy",p);
			return "editPolicy";
		}
		@PostMapping("/addeditpolicy")
		public String editedPolicy(@ModelAttribute("policy")Policy pol,Model model) {
			
			boolean status=policyvendorService.addPolicy(pol);
			if(status) {
				model.addAttribute("message","Policy edited Created");
				return "policyvendorHome";
			}
			else {
				model.addAttribute("message","Policy not Created, something went wrong");
				return "policyvendorHome";
			}
			
		}
		@GetMapping("/claims")
		public String seeclaims(HttpSession session,Model model)
		{
			int id=(Integer)session.getAttribute("userId");
			List<Policy> policy=policyvendorService.getAllpolicies();
			List<Payments> pay=paydao.findAll();
			List<ClaimPolicy> cl=cldao.findAll();
			for(ClaimPolicy cp:cl)
			{
				for(Payments p:pay)
				{
					if(cp.getPayid()==p.getPayid()) {
					for(Policy po:policy)
					{
						if(p.getPolicyId()==po.getPolicyId() && po.getPolicyvendorId()==id)
						{
							model.addAttribute("claimlist", cp);
						}
					}
					}
				}
			}
			
			return "policyvendorHome";
			
		}
	
	  @GetMapping("/acceptclaim") 
	  public String claimstatus1(@RequestParam("cid")int id,Model model) { 
		  ClaimPolicy claim=cldao.findByclaimid(id); 
		  
	  ClaimPolicy claimp=new ClaimPolicy();
	  claimp.setClaimid(claim.getClaimid());
	  claimp.setPayid(claim.getPayid());
	  claimp.setPolicyname(claim.getPolicyname());
	  claimp.setUserid(claim.getUserid());
	  claimp.setReasonbyc(claim.getReasonbyc());
	  model.addAttribute("reason", claimp);
	  return "claimformp";
	  
	  }
	 @PostMapping("/claimp")
	 public String climstatus2(@ModelAttribute("reason")ClaimPolicy claim1,Model model)
	 {
		 Payments p;
		 
		 if(claim1.getCstatus()!="approved") {
			 System.out.println("in if");
			 claim1.setCstatus("approved");
			 System.out.println("after aprove");
			 cldao.save(claim1);
			 System.out.println("after aprove1");
			 int payid=claim1.getPayid();
			 System.out.println("after aprove2");
			 p=paydao.findByPayid(payid);
			 System.out.println(p);
			p.setPaystatus("claimed");
			p.setReminder("no");
			paydao.save(p);
			 System.out.println("rtyui");
			 model.addAttribute("message", "claim response Successfull");
		 }
		 
		 return "policyvendorHome";
	 }
	 @GetMapping("/rejectclaim") 
	  public String claimstatus3(@RequestParam("cid")int id,Model model) { 
		  ClaimPolicy claim=cldao.findByclaimid(id); 
		  
	  ClaimPolicy claimp=new ClaimPolicy();
	  claimp.setClaimid(claim.getClaimid());
	  claimp.setPayid(claim.getPayid());
	  claimp.setPolicyname(claim.getPolicyname());
	  claimp.setUserid(claim.getUserid());
	  claimp.setReasonbyc(claim.getReasonbyc());
	  model.addAttribute("reason1", claimp);
	  return "claimformpr";
	  
	  }
	 @PostMapping("/claimp1")
	 public String climstatus4(@ModelAttribute("reason1")ClaimPolicy claim1,Model model)
	 {
		 Payments p;
		 
		 if(claim1.getCstatus()!="rejected") {
			 System.out.println("in if");
			 claim1.setCstatus("rejected");
			 System.out.println("after aprove");
			 cldao.save(claim1);
			 System.out.println("after aprove1");
			 int payid=claim1.getPayid();
			 System.out.println("after aprove2");
			 p=paydao.findByPayid(payid);
			 System.out.println(p);
			p.setPaystatus("claim rejected");
			paydao.save(p);
			 System.out.println("rtyui");
			 model.addAttribute("message", "claim response Successfull");
		 }
		 
		 return "policyvendorHome";
	 }
	 @GetMapping("/pforgotuid")
		public String fid(Model model){
			model.addAttribute("name",new ForgotUid());
			return "PvForgotid";
		}
		@PostMapping("/pforgotuid1")
		public String fid1(@ModelAttribute("name") ForgotUid fid,PolicyVendor policyvendor,Model model)
		{
			int b=policyvendorService.fid(fid);
			if(b!=0)
			{
		  	model.addAttribute("message",b+" is your id");
			}
			else
			{
				model.addAttribute("message", "Incorrect credentials");
			}
			return "PvForgotid";
		}
		@GetMapping("/pforgotpswd")
		public String fpwd(Model model){
			model.addAttribute("name1",new ForgotUid());
			return "PvForgotPwd";
		}
		@PostMapping("/pforgotpwd1")
		public String fpwd1(@ModelAttribute("name1") ForgotUid fid,Model model)
		{
			boolean b=policyvendorService.fpwd(fid);
			if(b==true)
			{
				
		  	  return "PvResetPwd";
			}
			else
			{
				model.addAttribute("message", "Incorrect credentials");
				return "PvForgotPwd";
			}
		}
		@PostMapping("/pupdatepwd")
		public String updatePassword(@ModelAttribute("name1") ForgotUid forgetUID,Model model)
		{
			PolicyVendor pv =pvdao.findByVendorId(forgetUID.getUid());
			pv.setPassword(forgetUID.getPwd());
			pvdao.save(pv);
			model.addAttribute("message","your password has been updated");
			return "PvResetPwd";
		}
		@GetMapping("/editprofile")
		public String editDetails(@RequestParam("userid")int id,Model model,HttpSession session) {
			session.setAttribute("vid", id);
			PolicyVendor pv=policyvendorService.getPolicyVendor(id);
			model.addAttribute("pvn",pv);
			return "editProfile";
		}
		@PostMapping("/updateprofile")
		public String updateeditP(@ModelAttribute("pvn")PolicyVendor pov,Model model) {
		PolicyVendor status=pvdao.save(pov);
		
			model.addAttribute("message1","Updates Successfully");
			return "policyvendorHome";
		
}
		@GetMapping("/grpurchased")
		public String reportpurchased(Model model,HttpSession session)
		{
			int id=(Integer)session.getAttribute("userId");
			List<Payments> pay1=paydao.findAll();
			List<Policy> p1=policydao.findAll();
			PolicyVendor pv1=pvdao.findByVendorId(id);
			//List<PolicyVendor> pv1=pvdao.findAll();
			for(Payments pay:pay1) {
				for(Policy p:p1) {
					if(pay.getPolicyId()==p.getPolicyId()) {
						
							if(pv1.getVendorId()==p.getPolicyvendorId()) {
								model.addAttribute("paym", pay);
								model.addAttribute("poli", p);
								model.addAttribute("vend", pv1);
								
							}
						}
					}
				}
			
						
				
			
			return "policyvendorHome";
		}
		@GetMapping("/grclaims")
		public String reportclaims(Model model,HttpSession session)
		{
			int id=(Integer)session.getAttribute("userId");
			System.out.println(id);
			List<ClaimPolicy> cp=cldao.findAll();
			List<Payments> paym=paydao.findAll();
			PolicyVendor pve=pvdao.findByVendorId(id);
			System.out.println(pve);
			List<Policy> p=policydao.findAll();
			for(ClaimPolicy cop:cp) {
				for(Payments pym:paym) {
					if(cop.getPayid()==pym.getPayid()) {
						model.addAttribute("payme", pym);
						for(Policy po:p) {
							if(po.getPolicyId()==pym.getPolicyId() && pve.getVendorId()==po.getPolicyvendorId()) {
								model.addAttribute("policy", po);
								
								model.addAttribute("claimp", cop);
										System.out.println(pve);
										model.addAttribute("polve", pve);
									
								
							}
						}
					}
				}
			}
			
			
			
			
			
			return "policyvendorHome";
		}
		@GetMapping("/grclaimr")
		public String reportclaimr(Model model,HttpSession session)
		{
			int id=(Integer)session.getAttribute("userId");
			PolicyVendor pve=pvdao.findByVendorId(id);
			List<ClaimPolicy> cp=cldao.findAll();
			List<Payments> paym=paydao.findAll();
			
			
			List<Policy> p=policydao.findAll();
			for(ClaimPolicy cop:cp) {
				
				if(cop.getCstatus().equals("rejected") ){
					
					
				for(Payments pym:paym) {
					if(cop.getPayid()==pym.getPayid()) {
						
						for(Policy po:p) {
							if(po.getPolicyId()==pym.getPolicyId()&& pve.getVendorId()==po.getPolicyvendorId()) {
								model.addAttribute("policy1", po);
								model.addAttribute("payme1", pym);
								model.addAttribute("claimp1", cop);
										model.addAttribute("polve1", pve);
									
								
							}
						}
					}
				}
			}
			}
			return "policyvendorHome";
		}
		@GetMapping("/grclaima")
		public String reportclaima(Model model,HttpSession session)
		{
			int id=(Integer)session.getAttribute("userId");
			PolicyVendor pve=pvdao.findByVendorId(id);
			List<ClaimPolicy> cp=cldao.findAll();
			List<Payments> paym=paydao.findAll();
			List<Policy> p=policydao.findAll();
			for(ClaimPolicy cop:cp) {
				if(cop.getCstatus().equals("approved") ){
					
					
				for(Payments pym:paym) {
					if(cop.getPayid()==pym.getPayid()) {
						
						for(Policy po:p) {
							if(po.getPolicyId()==pym.getPolicyId()&& pve.getVendorId()==po.getPolicyvendorId())  {
								model.addAttribute("policy2", po);
								model.addAttribute("claimp2", cop);
										model.addAttribute("polve2", pve);
										model.addAttribute("payme2", pym);
							}
						}
					}
				}
			}
			}
			return "policyvendorHome";
		}
		@GetMapping("/beforehelp")
		public String help(Model model) {
			model.addAttribute("help", new Help());
			return "policyvendorHelp";
		}

		@PostMapping("/afterhelp")
		  public String help1(@ModelAttribute("help") Help h,BindingResult result,Model model) 
		  {
			  if(result.hasErrors()) {
				  return "policyvendorHelp";
			  }
			  else {
				  int status =policyvendorService.help(h);
				  if(status==1) {
					  model.addAttribute("message", "Your Issue is Registered");
					  return "policyvendorHome";
				  }
				  else {
					  model.addAttribute("message", "Something went wrong");
					  return "policyvendorHelp";
				  }
			  }
		  }
	
		@GetMapping("/logout")
		public String logout(HttpSession session)
		{
			session.invalidate();
			return "redirect:/";
		}


	}