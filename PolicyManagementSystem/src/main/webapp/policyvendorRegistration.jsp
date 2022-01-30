<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Policy Management-Admin</title>
<link rel="stylesheet" type="text/css" href="/style.css">
<link href="/webjars/bootstrap/4.0.0/css/bootstrap.min.css"
	rel="stylesheet">
<script type="text/javascript" src='https://kit.fontawesome.com/a076d05399.js'></script>

<style type="text/css">
tr,td{
text-align: left;
}

</style>
</head>
<body>
<!--  <div class="header"><header><b class="heading">Policy Management</b></header></div>
<div class="topnav">
  <a href="/" class="fas fa fa-home back" >Home</a>
  <a href="/admin/" class="fas fa-user-circle back" >Admin</a>
 <a href="/policyvendor/" class="fas fa-user-plus back" >Policy Vendor</a>
 <a href="/customer/" class="fas fa-user-alt back" >Customer</a>

   </div>-->
   <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
			<a class="navbar-brand" href="#">Policy Management</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav mr-auto">
					<li class="nav-item active"><a class="nav-link" href="/" >Home
							<span class="sr-only">(current)</span>
					</a></li>
					<li class="nav-item"><a class="nav-link" href="/admin/">Admin</a></li>
					<li class="nav-item"><a class="nav-link" href="/policyvendor/">Policy
							vendor</a></li>
					<li class="nav-item"><a class="nav-link" href="/customer/">Customer</a></li>
				</ul>
			</div>
		</nav>
<div class="card1">

 <form:form action="/policyvendor/policyvendorreg" method="post" modelAttribute="policyvendorreg" style="margin-top:50px;margin-left:30px;" onsubmit="return validate()">

<table align="center" class="tables back" >
<tr>
<td></td>

<tr align="center">
<td colspan="4"  align="center"style="text-align: center;text-decoration-line: underline; ">
Registration Form</td></tr>
</tr>
<tr>
<td>VendorId<label style="color: red">*</label>:</td>
<td>

<form:input path="vendorId" id="id" class="form-control" required="required" />

</td>
<td>Policy Vendor Name<label style="color: red">*</label>:</td>
<td>

<form:input path="policyvendorname" id="policyvendorname" class="form-control"  required="required" oninvalid="namevalidate(this)"/>

</td>
</tr>

<tr>

</tr>

<tr>
<td>Policy Vendor Reg. No<label style="color: red">*</label>:</td>
<td>

<form:input path="policyvendorregno" id="policyvendorregno" class="form-control" required="required" oninvalid="regnovalidate(this)"/>

</td>
<td>Policy Type<label style="color: red">*</label>:</td>
<td>

<form:select path="policytype" class="form-control" id="policytype" required="required" >
<form:option value="" label="--Select Policy Type--"/>
<form:option value="LifeInsurance" label="LifeInsurance"/>
<form:option value="MedicalInsurance" label="MedicalInsurance"/>
<form:option value="VehicleInsurance" label="VehicleInsurance"/>
</form:select>

</td>
</tr>


<tr>

</tr>

<tr>
<td>Address:</td>
<td>

<form:input path="address" class="form-control"  />
</td>
<td>Country:</td>
<td>
<form:select path="country" class="form-control" >
<form:option value="" label="--Select Country--"/>
<form:option value="US" label="US"/>
<form:option value="India" label="India"/>
<form:option value="UK" label="UK"/>
</form:select>

</td>
</tr>
<tr>

</tr>
<tr>
<td>State:</td>
<td>
<form:select path="State" class="form-control" >
<form:option value="" label="--Select Policy Type--"/>
<form:option value="Telangana" label="Telangana"/>
<form:option value="AP" label="AP"/>
<form:option value="TN" label="TN"/>
</form:select>
</td>
<td>Zipcode:</td>
<td>

<form:input path="zipcode" class="form-control" />
</td>
</tr>
<tr>

</tr>
<tr>
<td>DateOfBirth<label style="color: red">*</label>:</td>
<td><form:input path="dateOfBirth" id="dateOfBirth" type="date"  required="required" oninvalid="return dob(this)"/><br>
<td>Email address<label style="color: red">*</label>:</td>
<td>
<form:input  path="emailaddress" id="emailaddress" type="email" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$" title="email should contain '@' and '.' eg. abcd@xyz.com" required="required" oninvalid="return emailid(this)"/>
<br><span style="font-size: small;color: red;">${emailAdd}</span>
</td>
</tr>
<tr>

</tr>
<tr>
<td>Contact Number<label style="color: red">*</label>:</td>
<td>
<form:input path="contactnumber" id="contactnumber" type="tel"  pattern="[6-9]{1}[0-9]{9}" required="required"  title="Enter a 10 digit contact number starting with [6 or 7 or 8 or 9]. e.g. 7895236419" oninvalid="contactnum(this)" />
<br><span style="font-size: small;color: red;">${contactN}</span>
</td>
<td>Web Site:</td>
<td>
<form:input path="website" class="form-control" />

</td>
</tr>
<tr>

</tr>
<tr>
<td>Certificate Issued Date<label style="color: red">*</label>:</td>
<td>
<form:input path="certificateissueddate" id="certificateissueddate" type="date" class="form-control" required="required" oninvalid="return cis(this)"/>

</td>
<td>Certificate Validity Date<label style="color: red">*</label>:</td>
<td>
<form:input path="certificatevaliditydate" id="certificatevaliditydate" type="date" class="form-control" required="required" oninvalid="return cvd(this)"/>

</td>
</tr>
<tr>

</tr>
<tr>
<td>Year of Establishment:</td>
<td>
<form:input path="yearofestablishment" class="form-control"  />

</td></tr>
<tr>
<td>Password<label style="color: red">*</label>:</td>
<td><form:password path="password" class="form-control" id="pwd" required="required" oninvalid="return passwordv(this)" />
<td>Confirm Password<label style="color: red">*</label>:</td>
			<td><input type="password" id="cpwd" required="required" oninvalid="return cpasswordv(this)" ></td>
</td>
</tr>
<td>Secret Question 1:</td>
<td>
<form:select path="secretquestion1" id="secretquestion1" class="select-box" required="required">
<option  selected="selected" value="What is your Birthdate?">What is your Birthdate?</option>
  <option value="In which school you have studied first?">In which school have you studied first?</option>
  <option value="What is your favourite color?">What is your favourite color?</option>
</form:select>

</td>
<td colspan="2" align="right">
<form:input path="answer1" id="answer1" placeholder="Answer" width="170px" required="required" /></td>
</tr>

<tr>
<td>Secret Question 2:</td>
<td>
<form:select path="secretquestion2" id="secretquestion2" class="select-box" required="required">
<option  selected="selected" value="What is your favourite place?">What is your favourite place?</option>
  <option value="What is your parent's anniversary?">What is your parent's anniversary?</option>
  <option value="What is your highest education?">What is your highest education?</option>
</form:select>
</td>
<td colspan="2" align="right">
<form:input path="answer2" id="answer2" placeholder="Answer" width="170px" required="required"/>
</td>
</tr>
<tr>

</tr>
<tr>
<td>Secret Question 3:</td>
<td>
<form:select path="secretquestion3" id="secretquestion3" class="select-box" required="required">
<option  selected="selected" value="What is your favourite comic?">What is your favourite comic?</option>
  <option value="What is your hometown?">What is your hometown?</option>
  <option value="In what town or city did you meet your spouse/partner?">In what town or city did you meet your spouse/partner?</option>
</form:select>
</td>
<td colspan="2" align="right">
<form:input path="answer3" id="answer3" placeholder="Answer" width="170px" required="required"/>
</td>
</tr>

<tr><td></td>
<td colspan="2" align="center"> <input type="submit" value="Register" class="formsubmitbutton" /><!-- </td> -->
<label style="font-size: 15px;">Existing PolicyVendor?</label><a href="/policyvendor/" style="color:white;"> SignIn</a></td></tr>
</table>
</form:form>

</div>
<script type="text/javascript">
function validate(){
	var c=document.getElementById("cpwd").value;
	var p=document.getElementById("pwd").value;
	if(p!=c)
		{
			alert("Password and Confirm Password are not same");
			return false;
		}
	
}
function namevalidate(textbox)
{

	if(textbox.value=='')
		{
		
		textbox.setCustomValidity("Name field should not be emplty") 
		textbox.style.border="3px solid red";
		
		}
	else {  
         
        textbox.style.border="white";
        textbox.setCustomValidity(""); 
    } 
	
}
function regnovalidate(textbox)
{

	if(textbox.value=='')
		{
		
		textbox.setCustomValidity("Name field should not be emplty")
		textbox.style.border="3px solid red";
		}
	else {  
         
        textbox.style.border="white";
        textbox.setCustomValidity(""); 
    } 
	
}
function contactnum(textbox)
{

	if(textbox.value=='')
		{
		
		/* textbox.setCustomValidity("Contact Number should not be emplty") */
		textbox.style.border="3px solid red";
		}
	else {  
         
        textbox.style.border="white";
        textbox.setCustomValidity(""); 
    } 
		
}
function dob(textbox)
{

	if(textbox.value=='')
		{
		
		/* textbox.setCustomValidity("Contact Number should not be emplty") */
		textbox.style.border="3px solid red";
		}
	else {  
        
        textbox.style.border="white";
        textbox.setCustomValidity(""); 
    } 
		
}
function cis(textbox)
{

	if(textbox.value=='')
		{
		
		/* textbox.setCustomValidity("Contact Number should not be emplty") */
		textbox.style.border="3px solid red";
		}
	else {  
        
        textbox.style.border="white";
        textbox.setCustomValidity(""); 
    } 
		
}
function cvd(textbox)
{

	if(textbox.value=='')
		{
		
		/* textbox.setCustomValidity("Contact Number should not be emplty") */
		textbox.style.border="3px solid red";
		}
	else {  
         
        textbox.style.border="white";
        textbox.setCustomValidity(""); 
    } 
		
}
function emailid(textbox)
{

	if(textbox.value=='')
		{
		
		/* textbox.setCustomValidity("Contact Number should not be emplty") */
		textbox.style.border="3px solid red";
		}
	else {  
        
        textbox.style.border="white";
        textbox.setCustomValidity(""); 
    } 
		
}
function passwordv(textbox)
{

	if(textbox.value=='')
		{
		
		/* textbox.setCustomValidity("Contact Number should not be emplty") */
		textbox.style.border="3px solid red";
		}
	else {  
        
        textbox.style.border="white";
        textbox.setCustomValidity(""); 
    } 
		
}
function cpasswordv(textbox)
{

	if(textbox.value=='')
		{
		
		/* textbox.setCustomValidity("Contact Number should not be emplty") */
		textbox.style.border="3px solid red";
		}
	else {  
         
        textbox.style.border="white"; 
        textbox.setCustomValidity("");
    } 
		
}

</script>

<script src="/webjars/jquery/3.4.1/jquery.min.js"></script>
<script src="/webjars/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</body>
</html>