<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Forgot User id</title>
<link rel="stylesheet" type="text/css" href="/style.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<script type="text/javascript">
function validate(){
	var qsn1=document.getElementById("qstn1").value;
	var answr1=document.getElementById("ans1").value;
	var qsn2=document.getElementById("qstn2").value;
	var answr2=document.getElementById("ans2").value;
    var qsn3=document.getElementById("qstn3").value;
	var answr3=document.getElementById("ans3").value;
	
	var phn=document.getElementById("phno").value;
	if(qsn1==""){
		document.getElementById("qstn1").style.borderColor = "red";
		alert("please select the first secret question");
		return false;
		}else if(answr==""){
			document.getElementById("ans").style.borderColor = "red";
			alert("please update first answer field");
				return false;
			}
		else if(qsn2==""){
		document.getElementById("qstn2").style.borderColor = "red";
		alert("please select the second secret question");
		return false;
		}else if(answr2==""){
			document.getElementById("ans2").style.borderColor = "red";
			alert("please update second answer field");
				return false;
			}

		else if(qsn3==""){
		document.getElementById("qstn3").style.borderColor = "red";
		alert("please select the third secret question");
		return false;
		}else if(answr3==""){
			document.getElementById("ans3").style.borderColor = "red";
			alert("please update first answer field");
				return false;
			}
	
		else if(phn=="")
			{
			document.getElementById("phn").style.borderColor = "red";
			alert("please update contact number field");
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

<form:form onsubmit="return validate()" action="forgotuid1" method="post" modelAttribute="name" style="margin-top:50px;margin-left:30px;">
<table align="center" class="tables back" >
<td colspan="4"  align="center"style="text-align: center;text-decoration-line: underline; ">
Forgot Userid??</td></tr>
<tr><td colspan="2" align="center" style="text-align: center;">${message }</td></tr>
<tr>
<td>ContactNumber:</td>
<td><form:input path="contactNumber" id="contactNumber" type="text" placeholder="Enter contact number"/>
</tr>
<tr>
<td>Secret Question 1:</td>
<td>
<form:select path="qstn1" id="qstn1" class="select-box" >
<option  selected="selected" value="What is your Birthdate?">What is your Birthdate?</option>
  <option value="In which school you have studied first?">In which school have you studied first?</option>
  <option value="What is your favourite color?">What is your favourite color?</option>
</form:select>
</td>
</tr>
<tr>
<td colspan="2" align="right">
<form:input path="ans1" id="ans1" placeholder="Answer" width="170px" />
</td>
</tr>
<tr>
<td>Secret Question 2:</td>
<td>
<form:select path="qstn2" id="qstn2" class="select-box" >
<option  selected="selected" value="What is your favourite place?">What is your favourite place?</option>
  <option value="What is your parent's anniversary?">What is your parent's anniversary?</option>
  <option value="What is your highest education?">What is your highest education?</option>
</form:select>
</td>
</tr>
<tr>
<td colspan="2" align="right">
<form:input path="ans2" id="ans2" placeholder="Answer" width="170px" />
</td>
</tr>
<tr>
<td>Secret Question 3:</td>
<td>
<form:select path="qstn3" id="qstn3" class="select-box" >
<option  selected="selected" value="What is your favourite comic?">What is your favourite comic?</option>
  <option value="What is your hometown?">What is your hometown?</option>
  <option value="In what town or city did you meet your spouse/partner?">In what town or city did you meet your spouse/partner?</option>
</form:select>
</td>
</tr>
<tr>
<td colspan="2" align="right">
<form:input path="ans3" id="ans3" placeholder="Answer" width="170px" />
</td>
</tr>
<tr align="center">
<td colspan="2" style="text-align: center;" > <input type="submit" value="Submit" class="formsubmitbutton" /><!-- </td> -->
<label style="font-size: 15px;">Want to SignIn?</label><a href="/admin/" style="color:white;"> Click Here</a>
</td></tr>
		

</table>


</form:form>
</div>
</body>
<%

RequestDispatcher rd = request.getRequestDispatcher("home.jsp");
rd.include(request, response);

%>
</html>