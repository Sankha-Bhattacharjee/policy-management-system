<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Policy Management-Admin</title>
<link rel="stylesheet" type="text/css" href="/style.css">
<link href="/webjars/bootstrap/4.0.0/css/bootstrap.min.css"
	rel="stylesheet">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
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

 <form:form action="/admin/adminreg" method="post" modelAttribute="adreg" style="margin-top:50px;margin-left:30px;" onsubmit="return validate();">
	<table align="center" class="tables back" >
	<td colspan="4"  align="center"style="text-align: center;text-decoration-line: underline; ">
Registration Form</td></tr>

		<tr>
			<td>Admin Id<label style="color: red">*</label>:</td>
			<td><form:input path="adminId" required="required"/></td>
				
				<td>First Name<label style="color: red">*</label>:</td>
			<td><form:input path="firstName" required="required" oninvalid="namevalidate(this)"/></td>
		</tr>
		
		<tr>
			<td>Last Name<label style="color: red">*</label>:</td>
			<td><form:input path="lastName" required="required" oninvalid="lnamevalidate(this)"/></td>
			<td>Contact Number<label style="color: red">*</label>:</td>
			<td><form:input path="contactNumber" type="tel"  pattern="[6-9]{1}[0-9]{9}" required="required"  title="Enter a 10 digit contact number starting with [6 or 7 or 8 or 9]. e.g. 7895236419" oninvalid="contactnum(this)" />
			<br><span style="font-size: small;color: red;">${contactN}</span>
			</td>
		</tr>
		
		<tr>
			<td>DateOfBirth<label style="color: red">*</label>:</td>
			<td><form:input path="dateOfBirth" type="date" required="required" oninvalid="return dob(this)"/></td>
			<td>Email<label style="color: red">*</label>:</td>
			<td><form:input path="email" type="email" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$" title="email should contain '@' and '.' eg. abcd@xyz.com" required="required" oninvalid="return emailid(this)"/>
			<br><span style="font-size: small;color: red;">${emailAdd}</span>
			</td>
		</tr>
		
		<tr>
			<td>Password<label style="color: red">*</label>:</td>
			<td><form:password path="password"  id="pwd" required="required" oninvalid="return passwordv(this)"/></td>
			<td>Confirm Password<label style="color: red">*</label>:</td>
			<td><input type="password" id="cpwd" required="required" oninvalid="return cpasswordv(this)"></td>
		</tr>
		<tr><td >Gender<label style="color: red">*</label>:</td>
		<td>
		<form:radiobutton path="gender" value="male" label="Male" required="required" oninvalid="return genderv(this)"/>
		<form:radiobutton path="gender" value="female" label="Female" required="required" oninvalid="return genderv(this)"/>
		</td> </tr>
		<tr>
<td>Secret Question 1:</td>
<td>
<form:select path="secretquestion1" id="secretquestion1" class="select-box" >
<option  selected="selected" value="What is your Birthdate?">What is your Birthdate?</option>
  <option value="In which school you have studied first?">In which school have you studied first?</option>
  <option value="What is your favourite color?">What is your favourite color?</option>
</form:select>

</td>
<td colspan="2" align="right">
<form:input path="answer1" id="answer1" placeholder="Answer" width="170px" /></td>
</tr>

<tr>
<td>Secret Question 2:</td>
<td>
<form:select path="secretquestion2" id="secretquestion2" class="select-box" >
<option  selected="selected" value="What is your favourite place?">What is your favourite place?</option>
  <option value="What is your parent's anniversary?">What is your parent's anniversary?</option>
  <option value="What is your highest education?">What is your highest education?</option>
</form:select>
</td>
<td colspan="2" align="right">
<form:input path="answer2" id="answer2" placeholder="Answer" width="170px" />
</td>
</tr>
<tr>

</tr>
<tr>
<td>Secret Question 3:</td>
<td>
<form:select path="secretquestion3" id="secretquestion3" class="select-box" >
<option  selected="selected" value="What is your favourite comic?">What is your favourite comic?</option>
  <option value="What is your hometown?">What is your hometown?</option>
  <option value="In what town or city did you meet your spouse/partner?">In what town or city did you meet your spouse/partner?</option>
</form:select>
</td>
<td colspan="2" align="right">
<form:input path="answer3" id="answer3" placeholder="Answer" width="170px" />
</td>
</tr>

		<tr><td></td>
<td colspan="2" align="center" style="text-align: center;" > <input type="submit" value="Register" class="formsubmitbutton" /><!-- </td> -->
<label style="font-size: 15px;">Existing Admin?</label><a href="/admin/" style="color:white;"> SignIn</a></td></tr>
		
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
function lnamevalidate(textbox)
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
         
        textbox.style.borderBottom="white";
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
function genderv(textbox)
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