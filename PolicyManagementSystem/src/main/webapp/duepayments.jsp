
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Policy Management-PolicyVendor</title>
<link rel="stylesheet" type="text/css" href="/style.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
</head>

<body>

 <form:form action="/customer/cardpayment1" name="cardform" method="post" modelAttribute="payment" style="margin-top:50px;margin-left:30px;" align="center" onsubmit="return validate()">

<table align="center" class="tables back" style="display: inline-block;float:inherit;margin-bottom: 30%;">
<tr align="center"><td colspan="2" style="text-align: center;text-decoration-line: underline;">Card Details Form</td></tr>

<tr>
<td>Card No:</td>
<td><input type="number" name="cardno" placeholder="enter card Number" required="required"></td>
</tr>
<tr>
<td>CVV:</td>
<td><input type="number" name="cvv" placeholder="enter CVV" required="required"></td>
</tr>
<tr>
<td>Expiry Date:</td>
<td><input type="date" name="expirydate" placeholder="dd/mm/yyyy" required="required"></td>
</tr>
<tr>
<td>CardHolder Name:</td>
<td><input type="text" name="cardname" placeholder="Enter cardHolder name" required="required"></td>
</tr>
<tr align="center">
<td colspan="2" style="text-align: center;"><input type="submit" value="Pay" class="formsubmitbutton" />
</tr>
</table>
</form:form>

<script type="text/javascript">
function validate(){
	var Regex='/^[^a-zA-Z]*$/';
	var cno=document.cardform.cardno.value;
	var cv=document.cardform.cvv.value;
	var cname=document.cardform.cardname.value;
	var cedate=document.cardform.expirydate.value;
	if(cno.toString().length<16 || cv.toString().length<3||cno.toString().length>16 || cv.toString().length>3){
		alert("Please,enter valid CardNumber and CVV");
		return false;
		}
	else if(Regex.test(cname)){
			alert("Please enter valid name");
			return false;
		}
	else if(isNaN(Date.parse(cedate)))
	{
		alert("please enter a valid date");
		return false;
	}
}
</script>

<%

RequestDispatcher rd = request.getRequestDispatcher("customerHome.jsp");
rd.include(request, response);

%>


</body>
</html>