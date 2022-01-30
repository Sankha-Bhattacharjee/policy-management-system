<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
	<!--  <div class="header">
		<header>
			<b class="heading">Policy Management</b>
		</header>
	</div>
	<div class="topnav">
		<a href="/" class="fas fa fa-home back">Home</a> <a href="/admin/"
			class="fas fa-user-circle back">Admin</a> <a href="/policyvendor/"
			class="fas fa-user-plus back">Policy Vendor</a> <a href="/customer/"
			class="fas fa-user-alt back">Customer</a>

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
		<b style="color: white; background-color: black;">${message}</b>

		<form:form action="/admin/adminlogin" method="post"
			modelAttribute="adlogin" style="margin-top:50px;">
			<table align="center" class="tables back">
				<tr align="center">
					<td colspan="2"
						style="text-align: center; text-decoration-line: underline;">Login
						Form</td>
				</tr>

				<tr>
					<td><i class="fas fa fa-user back" title="UserId"
						style="border-spacing: 10px;"> UserId</i></td>
					<td><form:input path="adminId" required="required"
							placeholder="Enter your userId" title="Enter UserId"
							oninvalid="return useridv(this)" /><br></td>
				</tr>
				<tr>
					<td><i class="fa fa-key" title="Password"> Password</i></td>
					<td><form:password path="password" required="required"
							placeholder="Enter your Password" title="Enter Password"
							oninvalid="return passwordv(this)" /><br></td>
				</tr>
				<tr align="center">
					<td colspan="2" style="text-align: center;"><input
						type="submit" value="Login" class="formsubmitbutton" /></td>
				</tr>
				<tr>
					<td colspan="2" style="text-align: center;"><label
						style="font-size: 15px;">New Admin?<a
							href="/admin/register/" style="color: white;"> Register</a></label></td>
				</tr>
				<tr>
					<td colspan="2" style="text-align: center;"><a
						href="forgotuid" style="font-size: 15px; color: white;">Forgot
							Userid?</a> <a href="forgotpswd"
						style="font-size: 15px; color: white;">Forgot Password?</a></td>
				</tr>

			</table>
		</form:form>


		<script type="text/javascript">
			function passwordv(textbox) {

				if (textbox.value == '') {

					/* textbox.setCustomValidity("Contact Number should not be emplty") */
					textbox.style.border = "3px solid red";
				} else {
					textbox.setCustomValidity("");
					textbox.style.border = "";
				}

			}
			function useridv(textbox) {

				if (textbox.value == '') {

					/* textbox.setCustomValidity("Contact Number should not be emplty") */
					textbox.style.border = "3px solid red";
				} else {
					textbox.setCustomValidity("");
					textbox.style.border = "";
				}

			}
		</script>


	</div>
	<script src="/webjars/jquery/3.4.1/jquery.min.js"></script>
	<script src="/webjars/bootstrap/4.0.0/js/bootstrap.min.js"></script>

</body>
</html>