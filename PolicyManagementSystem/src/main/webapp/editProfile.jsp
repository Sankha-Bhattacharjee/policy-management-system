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
 <form:form action="/policyvendor/updateprofile" method="post" modelAttribute="pvn" onsubmit="return validate();">
<table align="center" class="tables back" >
<tr align="center">
<td colspan="4"  align="center"style="text-align: center;text-decoration-line: underline; ">
Edit Profile</td></tr>

<tr>
<td>VendorId:</td>
<td>

<form:input path="vendorId" class="form-control" readonly="true"/>

</td>
<td>Policy Vendor Name:</td>
<td>

<form:input path="policyvendorname" class="form-control" required="required" readonly="true" />

</td>
</tr>

<tr>

</tr>

<tr>
<td>Policy Vendor Reg. No:</td>
<td>

<form:input path="policyvendorregno" class="form-control" required="required" readonly="true" />

</td>
<td>Policy Type:</td>
<td>
<form:input path="policytype" class="form-control" required="required" readonly="true" />

</td>
</tr>

<tr>
<td>Address:</td>
<td>

<form:input path="address" class="form-control" required="required" readonly="true"/>
</td>
<td>Country:</td>
<td>
<form:input path="country" class="form-control" required="required" readonly="true"/>

</td>
</tr>
<tr>

</tr>
<tr>
<td>State:</td>
<td><form:input path="State" class="form-control" required="required" readonly="true"/></td>

<td>Zipcode:</td>
<td>

<form:input path="zipcode" class="form-control" required="required" readonly="true"/>
</td>
</tr>

<tr>
<td>DateOfBirth:</td>
<td><form:input path="dateOfBirth" type="date" readonly="true"/><br>
<td>Email address:</td>
<td>
<form:input  path="emailaddress" class="form-control" required="required" readonly="true"/>
</td>
</tr>

<tr>
<td>Contact Number:</td>
<td>
<form:input path="contactnumber" class="form-control" required="required" readonly="true"/>

</td>
<td>Web Site:</td>
<td>
<form:input path="website" class="form-control" required="required" readonly="true"/>

</td>
</tr>

<tr>
<td>Certificate Issued Date<label style="color: red">*</label>:</td>
<td>
<form:input path="certificateissueddate" type="date" class="form-control" required="required" />

</td>
<td>Certificate Validity Date<label style="color: red">*</label>:</td>
<td>
<form:input path="certificatevaliditydate" type="date" class="form-control" required="required" />

</td>
</tr>

<tr>
<td>Year of Establishment<label style="color: red">*</label>:</td>
<td>
<form:input path="yearofestablishment" class="form-control" required="required" />

</td></tr>
<tr align="center">
<td colspan="4" style="text-align: center;"><input type="submit" value="Update Profile" class="formsubmitbutton" />
</tr>
</table>
</form:form>

<%

RequestDispatcher rd = request.getRequestDispatcher("policyvendorHome.jsp");
rd.include(request, response);

%>


</body>
</html>