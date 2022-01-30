
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
  
<!-- <div class="card"> -->

 <form:form action="/cardpayments.jsp" name="payform" method="post" modelAttribute="payment" style="margin-top:5px;margin-left:30px;" >

<table align="center" class="tables back" >
<tr align="center"><td colspan="2" style="text-align: center;text-decoration-line: underline;">Policy Payment Form</td></tr>
<tr>
<td>PolicyId  :</td>
<td>

<form:input path="policyId"  class="form-control"/>
<br>
 <form:errors path="policyId" cssClass="errors"></form:errors> 
</td>
</tr>
<tr>
<td>My Id  :</td>
<td>

<form:input path="userId" class="form-control"/>
<br>
 <form:errors path="userId" cssClass="errors"></form:errors> 
</td>
</tr>
<tr>
<td>SumAssured:</td>
<td>

<form:input path="sumassured" class="form-control"/>
<br>
 <form:errors path="sumassured" cssClass="errors"></form:errors> 
</td>
</tr>
<tr>
<td>DurationOfPolicy:</td>
<td>

<form:input path="durationOfPolicy" class="form-control"/>
<br>
 <form:errors path="durationOfPolicy" cssClass="errors"></form:errors> 
</td>
</tr>


<tr>
<td>finePerday:</td>
<td>

<form:input path="fineperday" class="form-control"/>
<br>
 <form:errors path="fineperday" cssClass="errors"></form:errors> 
</td>
</tr>
<tr>
<td>fineamount:</td>
<td>

<form:input path="fineamount"  class="form-control"/>
<br>
 <form:errors path="fineamount" cssClass="errors"></form:errors> 
</td>
</tr>
<tr>
<td >Reminder:</td>
<td><form:radiobutton path="reminder" value="yes" label="Yes" />
<form:radiobutton path="reminder" value="no" label="No"/></td> 
</tr>
<tr>
<td >PaymentPeriod:</td>
<td><form:radiobutton path="paymentperiod" value="30" label="Monthly" />
<form:radiobutton path="paymentperiod" value="90" label="Quaterly"/>
<form:radiobutton path="paymentperiod" value="180" label="HalfYearly"/>
<form:radiobutton path="paymentperiod" value="360" label="Yearly"/></td> 
</tr>
<tr align="center">
		<td colspan="2" style="text-align: center;"><input type="submit" value="Enter Card Details" />
		</tr>

</table>
</form:form>

<%

RequestDispatcher rd = request.getRequestDispatcher("customerHome.jsp");
rd.include(request, response);

%>


</body>
</html>