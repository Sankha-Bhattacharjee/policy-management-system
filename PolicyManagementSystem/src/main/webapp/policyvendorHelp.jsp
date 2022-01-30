<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Policy Management-Customer</title>
<link rel="stylesheet" type="text/css" href="/style.css">
<link href="/webjars/bootstrap/4.0.0/css/bootstrap.min.css"
	rel="stylesheet">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
</head>

<body>
<div class="card1">

 <form:form action="/customer/afterhelp" method="post" modelAttribute="help" style="margin-top:50px;margin-left:30px;">

<table align="center" class="tables back" >
<tr align="center"><td colspan="2" style="text-align: center;text-decoration-line: underline;">Report an Issue</td></tr>
<tr>
<td>My userId :</td>
<td>

<form:input path="userId" value='<%=session.getAttribute("uservid") %>' class="form-control"/>
</td>
</tr>

<tr>
<td>Issue:</td>
<td>
<form:input path="issue" class="form-control"/>
</tr>

<tr>
<td>Description:</td>
<td>
<form:textarea path="description" class="form-control"/>
</td>
</tr>

<td colspan="2" align="center"><input type="submit" value="Request Help" class="formsubmitbutton" />
</tr>
</table>
</form:form>
<c:if test="${message!=null }">  
   <script>alert('<c:out value="${message}"/>');
	            
				</script>  
				</c:if>
</div>
<%

RequestDispatcher rd = request.getRequestDispatcher("policyvendorHome.jsp");
rd.include(request, response);

%>

<script src="/webjars/jquery/3.4.1/jquery.min.js"></script>
<script src="/webjars/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</body>
</html>