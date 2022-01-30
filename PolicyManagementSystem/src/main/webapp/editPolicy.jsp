<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Policy Management-PolicyVendor</title>
<link rel="stylesheet" type="text/css" href="/style.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
</head>

<body>
 

 <form:form action="/policyvendor/addeditpolicy" method="post" modelAttribute="policy" style="margin-top:50px;margin-left:30px;">

<table align="center" class="tables back" >
<tr align="center"><td colspan="2" style="text-align: center;text-decoration-line: underline;">Edit Policy Form</td></tr>
<tr>
<td>Policy Id</td>
<td>
<form:input path="policyId" class="form-control" readonly="true"/>
<br>
 <form:errors path="policyId" cssClass="errors"></form:errors> 
</td>
</tr>
<tr>
<td>Policy Name :</td>
<td>

<form:input path="policyName" class="form-control" required="required"/>
<br>
 <form:errors path="policyName" cssClass="errors"></form:errors> 
</td>
</tr>

<tr>
<td>Duration of Policy:</td>
<td>

<form:input path="durationOfPolicy" class="form-control" required="required"/>
<br>
 <form:errors path="durationOfPolicy" cssClass="errors"></form:errors> 
</td>
</tr>

<tr>
<td>SumAssured :</td>
<td>

<form:input path="sumassured" class="form-control" required="required"/>
<br>
 <form:errors path="sumassured" cssClass="errors"></form:errors> 
</td>
</tr>
<tr>
<td>My userId :</td>
<td>

<form:input path="policyvendorId" value='<%=session.getAttribute("uservid") %>' class="form-control" readonly="true"/>
<br>
 <form:errors path="policyvendorId" cssClass="errors"></form:errors> 
</td>
</tr>
<tr>
<td>PolicyType:</td>
<td>

<form:input path="policytype" value='<%=session.getAttribute("policyty") %>' class="form-control" readonly="true" />
<br>
 <form:errors path="policytype" cssClass="errors"></form:errors> 
</td>
</tr>

<tr align="center">
<td colspan="2" style="text-align: center;"><input type="submit" value="Register Policy" class="formsubmitbutton" />
</tr>
</table>
</form:form>
<a href="policyvendorHome.jsp" style="color:slateblue;"> Back</a>
</div>
<%

RequestDispatcher rd = request.getRequestDispatcher("policyvendorHome.jsp");
rd.include(request, response);

%>


</body>
</html>