<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Reset Password</title>
<link rel="stylesheet" type="text/css" href="/style.css"/>
<link href="/webjars/bootstrap/4.0.0/css/bootstrap.min.css"
	rel="stylesheet">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<script type="text/javascript">
function validate(){
	var pwd=document.getElementById("password").value;
	var cpwd=document.getElementById("cpassword").value;
	 if(pwd=="" ){
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

<form:form onsubmit="return validate()" action="cupdatepwd" method="post" modelAttribute="name1" style="margin-top:50px;margin-left:30px;">
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
<td colspan="2" style="text-align: center;" > <input type="submit" value="Submit" class="formsubmitbutton" /><!-- </td> -->
<label style="font-size: 15px;">Want to SignIn?</label><a href="/customer/" style="color:white;"> Click Here</a>
</td></tr>
</table>

</form:form>
</div>
<script src="/webjars/jquery/3.4.1/jquery.min.js"></script>
<script src="/webjars/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</body>
</html>