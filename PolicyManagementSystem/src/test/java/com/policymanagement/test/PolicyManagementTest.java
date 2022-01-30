package com.policymanagement.test;

import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.Mock;
import org.mockito.junit.MockitoJUnitRunner;

import com.policymanagement.models.AdminLogin;
import com.policymanagement.models.CustomerLogin;
import com.policymanagement.models.PolicyVendorLogin;
import com.policymanagement.services.AdminServiceImpl;
@RunWith(MockitoJUnitRunner.class)
public class PolicyManagementTest {
	
	@Mock
	AdminServiceImpl aser;
	
	@Test
	public void trueAdminLoginTest() {
		AdminLogin a=new AdminLogin();
		a.setAdminId(1001);
		a.setPassword("Sb123#");
		Connection conn=DbConnection.returnConnectionObject();
		Statement mystmt;
		try {
			mystmt = conn.createStatement();
			ResultSet myRs=mystmt.executeQuery("select * from  admin ");
			while(myRs.next()) {
				if(myRs.getInt(1)==a.getAdminId()) {
					if(myRs.getString(2).equals(a.getPassword())) {
						
						assertTrue(true);
					}
				}
			}
			 
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
		
	}
	@Test
	public void falseAdminLoginTest1() {
		AdminLogin a=new AdminLogin();
		a.setAdminId(100);
		a.setPassword("Sb123#");
		Connection conn=DbConnection.returnConnectionObject();
		Statement mystmt;
		try {
			mystmt = conn.createStatement();
			ResultSet myRs=mystmt.executeQuery("select * from  admin ");
			while(myRs.next()) {
				if(myRs.getInt(1)==a.getAdminId()) {
					if(myRs.getString(2).equals(a.getPassword())) {
						
						assertFalse(false);
					}
				}
			}
			 
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
		
		
	}
	@Test
	public void falseAdminLoginTest2() {
		AdminLogin a=new AdminLogin();
		a.setAdminId(1001);
		a.setPassword("Sb123");
		Connection conn=DbConnection.returnConnectionObject();
		Statement mystmt;
		try {
			mystmt = conn.createStatement();
			ResultSet myRs=mystmt.executeQuery("select * from  admin ");
			while(myRs.next()) {
				if(myRs.getInt(1)==a.getAdminId()) {
					if(myRs.getString(2).equals(a.getPassword())) {
						
						assertFalse(false);
					}
				}
			}
			 
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
		
		
	}
	@Test
	public void falseAdminLoginTest3() {
		AdminLogin a=new AdminLogin();
		a.setAdminId(100);
		a.setPassword("Sb123");
		Connection conn=DbConnection.returnConnectionObject();
		Statement mystmt;
		try {
			mystmt = conn.createStatement();
			ResultSet myRs=mystmt.executeQuery("select * from  admin ");
			while(myRs.next()) {
				if(myRs.getInt(1)==a.getAdminId()) {
					if(myRs.getString(2).equals(a.getPassword())) {
						
						assertFalse(false);
					}
				}
			}
			 
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
		
		
	}
	@Test
	public void trueCustomerLoginTest() {
		CustomerLogin clogin = new  CustomerLogin();
		clogin.setUserId(2001);
		clogin.setPassword("Sb123#");
		
		Connection conn=DbConnection.returnConnectionObject();
		Statement mystmt;
		try {
			mystmt = conn.createStatement();
			ResultSet myRs=mystmt.executeQuery("select user_id,password from  customer ");
			boolean flag=false;
			while(myRs.next()) {
				if(myRs.getInt(1)==clogin.getUserId()) {
					if(myRs.getString(2).equals(clogin.getPassword())) {
						flag=true;
					}
				}
			}
			assertTrue(flag);
			
			 
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
		
	}
	@Test
	public void falseCustomerLoginTest1() {
		CustomerLogin clogin = new  CustomerLogin();
		clogin.setUserId(4001);
		clogin.setPassword("Sb123#");
		
		Connection conn=DbConnection.returnConnectionObject();
		Statement mystmt;
		try {
			mystmt = conn.createStatement();
			ResultSet myRs=mystmt.executeQuery("select user_id,password from  customer ");
			boolean flag=false;
			while(myRs.next()) {
				if(myRs.getInt(1)==clogin.getUserId()) {
					if(myRs.getString(2).equals(clogin.getPassword())) {
						
						flag=true;
					}
				}
			}
			assertFalse(flag);
			
			 
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
		
	}
	@Test
	public void falseCustomerLoginTest2() {
		CustomerLogin clogin = new  CustomerLogin();
		clogin.setUserId(2001);
		clogin.setPassword("Sb123");
		
		Connection conn=DbConnection.returnConnectionObject();
		Statement mystmt;
		try {
			mystmt = conn.createStatement();
			ResultSet myRs=mystmt.executeQuery("select user_id,password from  customer ");
			boolean flag=false;
			while(myRs.next()) {
				if(myRs.getInt(1)==clogin.getUserId()) {
					if(myRs.getString(2).equals(clogin.getPassword())) {
						
						flag=true;
					}
				}
			}
			assertFalse(flag);
			
			 
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
		
	}
	@Test
	public void falseCustomerLoginTest3() {
		CustomerLogin clogin = new  CustomerLogin();
		clogin.setUserId(200);
		clogin.setPassword("Sb123");
		
		Connection conn=DbConnection.returnConnectionObject();
		Statement mystmt;
		try {
			mystmt = conn.createStatement();
			ResultSet myRs=mystmt.executeQuery("select user_id,password from  customer ");
			boolean flag=false;
			while(myRs.next()) {
				if(myRs.getInt(1)==clogin.getUserId()) {
					if(myRs.getString(2).equals(clogin.getPassword())) {
						
						flag=true;
					}
				}
			}
			assertFalse(flag);
			
			 
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
		
	}
	@Test
	public void truePolicyVendorLoginTest() {
		PolicyVendorLogin p = new PolicyVendorLogin();
		p.setVendorId(3001);
		p.setPassword("Abc123#");
		
		Connection conn=DbConnection.returnConnectionObject();
		Statement mystmt;
		try {
			mystmt = conn.createStatement();
			ResultSet myRs=mystmt.executeQuery("select vendor_id,password from  policy_vendor ");
			boolean flag=false;
			while(myRs.next()) {
				if(myRs.getInt(1)==p.getVendorId()) {
					if(myRs.getString(2).equals(p.getPassword())) {
						flag=true;
					}
				}
			}
			assertTrue(flag);
			
			 
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
		
	}
	@Test
	public void falsePolicyVendorLoginTest1() {
		PolicyVendorLogin p = new PolicyVendorLogin();
		p.setVendorId(300);
		p.setPassword("Abc123#");
		
		Connection conn=DbConnection.returnConnectionObject();
		Statement mystmt;
		try {
			mystmt = conn.createStatement();
			ResultSet myRs=mystmt.executeQuery("select vendor_id,password from  policy_vendor ");
			boolean flag=false;
			while(myRs.next()) {
				if(myRs.getInt(1)==p.getVendorId()) {
					if(myRs.getString(2).equals(p.getPassword())) {
						flag=true;
					}
				}
			}
			assertFalse(flag);
			
			 
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
		
	}
	@Test
	public void falsePolicyVendorLoginTest2() {
		PolicyVendorLogin p = new PolicyVendorLogin();
		p.setVendorId(3001);
		p.setPassword("Abc123");
		
		Connection conn=DbConnection.returnConnectionObject();
		Statement mystmt;
		try {
			mystmt = conn.createStatement();
			ResultSet myRs=mystmt.executeQuery("select vendor_id,password from  policy_vendor ");
			boolean flag=false;
			while(myRs.next()) {
				if(myRs.getInt(1)==p.getVendorId()) {
					if(myRs.getString(2).equals(p.getPassword())) {
						flag=true;
					}
				}
			}
			assertFalse(flag);
			
			 
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
		
	}
	@Test
	public void falsePolicyVendorLoginTest3() {
		PolicyVendorLogin p = new PolicyVendorLogin();
		p.setVendorId(300);
		p.setPassword("Abc123");
		
		Connection conn=DbConnection.returnConnectionObject();
		Statement mystmt;
		try {
			mystmt = conn.createStatement();
			ResultSet myRs=mystmt.executeQuery("select vendor_id,password from  policy_vendor ");
			boolean flag=false;
			while(myRs.next()) {
				if(myRs.getInt(1)==p.getVendorId()) {
					if(myRs.getString(2).equals(p.getPassword())) {
						flag=true;
					}
				}
			}
			assertFalse(flag);
			
			 
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
		
	}

}
