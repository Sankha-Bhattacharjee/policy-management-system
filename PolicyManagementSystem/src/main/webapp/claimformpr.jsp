
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Policy Management-Customer</title>
<link rel="stylesheet" type="text/css" href="/style.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
</head>

<body>
  
 <form:form action="/policyvendor/claimp1" name="payform" method="post" modelAttribute="reason1" style="margin-top:50px;margin-left:30px;">

<table align="center" class="tables back" style="margin-bottom: 50%;" >
<tr align="center"><td colspan="2" style="text-align: center;text-decoration-line: underline;">Policy Payment Form</td></tr>
<tr>
<td>ClaimId:</td>
<td>

<form:input path="claimid"  class="form-control" readonly="readonly"/>
</td>
</tr>
<tr>
<td>PayId:</td>
<td>

<form:input path="payid"  class="form-control" readonly="readonly"/>
</td>
</tr>
<tr>
<td>My Id:</td>
<td>

<form:input path="userid"  class="form-control" readonly="readonly"/>
</td>
</tr>
<tr>
<td>PolicyName:</td>
<td>

<form:input path="policyname" class="form-control" readonly="readonly"/>
</td>
</tr>
<tr>
<td>Reason for Claim:</td>
<td>

<form:textarea path="reasonbyc" class="form-control" readonly="readonly"/>
</td>
</tr>

<tr>
<td>Reason for claim approval/rejection:</td>
<td>

<form:textarea path="reasonbypv" class="form-control" readonly="readonly"/>
</td>
</tr>
<tr align="center">
<td colspan="2" style="text-align: center;"><input type="submit" value="Claim Response" class="formsubmitbutton" />
</tr>
</table>
</form:form>

<%

RequestDispatcher rd = request.getRequestDispatcher("policyvendorHome.jsp");
rd.include(request, response);

%>


</body>
</html>