<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Login</title>
<link rel="stylesheet" type="text/css" href="/style.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>	
<script type="text/javascript">
function validate(){
	var pwd=document.getElementById("password").value;
	 if(pwd==""){
			document.getElementById("password").style.borderColor = "red";
			alert("please update mandatory highlighted fields");
				return false;
			}
	 else if(pwd!=cpwd)
	 {
	 document.getElementById("password").style.borderColor = "red";
	 document.getElementById("cpassword").style.borderColor = "red";
		alert("Password and confirm password are not same");
			return false;
	 }
}

</script>
</head>
<body>
<!--  <div class="header"><header><b class="heading">Policy Management</b></header></div>
<div class="topnav">
  <a href="/" class="fas fa fa-home back" >Home</a>
  <a href="/admin/" class="fas fa-user-circle back" >Admin</a>
 <a href="/policyvendor/" class="fas fa-user-plus back" >Policy Vendor</a>
 <a href="/customer/" class="fas fa-user-alt back" >Customer</a>

   </div>-->
 
<div class="card1">
<form:form onsubmit="return validate()" action="updatepwd" method="post" modelAttribute="name1" style="margin-top:50px;margin-left:30px;">
<table align="center" class="tables back" >
<td colspan="4"  align="center"style="text-align: center;text-decoration-line: underline; ">
Reset Password??</td></tr>

<tr><td colspan="2" align="center" style="text-align: center;">${message }</td></tr>
<tr>
<td>
<form:hidden path="uid"/>
</td>
</tr>
<tr>
<td>Password:</td>
<td><form:input path="pwd" class="formcontrol" id="password" type="password"/></td>
</tr>
<tr>
<td>Confirm Password:</td>
<td><input type="password" id="cpassword"></td>
</tr>
<tr align="center">
<td colspan="2"  style="text-align: center;" > <input type="submit" value="Submit" class="formsubmitbutton" /><!-- </td> -->
<label style="font-size: 15px;">Want to SignIn?</label><a href="/admin/" style="color:white;"> Click Here</a>
</td></tr>
</table>

</form:form>
<% 

RequestDispatcher rd = request.getRequestDispatcher("home.jsp");
rd.include(request, response);

%>
</div>
</body>

</html>