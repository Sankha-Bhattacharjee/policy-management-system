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

 <form:form action="/customer/searchpol" method="post" modelAttribute="searchpo" style="margin-top:50px;margin-left:30px;">

<table align="center" class="tables back" >

<tr>
<td>

<form:input path="text" class="form-control" placeholder="enter category or policy name"/>
<br>
 <form:errors path="text" cssClass="errors"></form:errors> 
</td>
<td colspan="3" align="center"><button><i class="fas fa fa-search" style:"font-size:10px;"><input type="hidden"/>Search</i></button>

</tr>

</table>
</form:form>
<%

RequestDispatcher rd = request.getRequestDispatcher("customerHome.jsp");
rd.include(request, response);

%>

<footer>

</body>
</html>