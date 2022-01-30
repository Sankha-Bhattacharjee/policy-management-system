<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE html>
<html>
<head>
<title> Home</title>
<link rel="stylesheet" type="text/css" href="/style.css">
<link href="/webjars/bootstrap/4.0.0/css/bootstrap.min.css"
	rel="stylesheet">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
</head>
<body>
<%
String username =(String) session.getAttribute("username");
String type=(String) session.getAttribute("ptype");
int userid=(Integer)session.getAttribute("userId");
session.setAttribute("policyty",type);
session.setAttribute("uservid", userid);
if(username==null || userid==0)
{
	response.sendRedirect("/policyvendorlogin/");
}
%>
<!--  <div class="header"><header><b class="heading">Policy Management</b>

</header>

</div>
 <div class="topnav">
  <a href="/policyvendorHome.jsp" class="fas fa-home back">  My Home</a>
  <a href="/policyvendor/addpolicy1" class="fas fa fa-plus-square back"> Add Policy</a>
  <a href="/policyvendor/listpolicies" class="fa fa-file back">  MyPolicies</a>
  <a href="/policyvendor/claims" class="fa fa-file back">  SeeClaims</a>
  <div class="dropdown">
  
  <button class="dropbtn "style="size: 20px;"><i class="fas fa-sticky-note" style="font-size:20px;"></i> Generate Report <i class="fas fa-caret-down"></i></button>
  <div class="dropdown-content">
  
    <a href="/policyvendor/grpurchased" class="" >No. of Policies Purchased</a>
    <a href="/policyvendor/grclaims" class="" >No. of claims Submitted</a>
    <a href="/policyvendor/grclaima" class="" >No. of claims approved</a>
    <a href="/policyvendor/grclaimr" class="" >No. of claims rejected</a>
  </div>
  </div>
  <a href="/policyvendor/logout/" class="fas fa-power-off back" style="float: right;">  Logout</a>
  <div class="dropdown" style="float:right;" >
  <button class="dropbtn" style="font-size:20px;"><i class=" fa fa-headphones" style="font-size:20px;"></i>Support</button>
  <div class="dropdown-content" >
  <a href="/policyvendor/beforehelp" class="fas fa fa-wrench">Help</a>
  </div>
  </div>  
  <!-- <div class="dropdown" style="float:right;" >
  
  <button class="dropbtn" style="font-size:20px;"><i class="far fa-address-book" style="font-size:20px;"></i>ContactUs</button>
  <div class="dropdown-content">
  	
    <a class="fas fa-phone-alt" > 9876543210</a>
    <a class="fas fa-envelope" style="font-size:16px;"> abc@pms.com</a>
  </div>
  </div>  

 <a href="/policyvendor/editprofile?userid=<%=userid %>" style="float: right;"> My Profile</a> 
 <a href="/policyvendor/editprofile?userid=<%=userid %>" style="float: right;"> Welcome <%=username %>(<%=userid %>)</a>
 
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
				<li class="nav-item active"><a class="nav-link"
					href="/policyvendorHome.jsp"> My Home <span class="sr-only">(current)</span>
				</a></li>
				<li class="nav-item"><a class="nav-link" href="/policyvendor/addpolicy1">Add Policy</a></li>
				<li class="nav-item"><a class="nav-link" href="/policyvendor/listpolicies">My Policies</a></li>
				<li class="nav-item"><a class="nav-link" href="/policyvendor/claims">See Claim</a></li>
				<li class="nav-item dropdown"><a class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> Generate Report </a>
					<div class="dropdown-menu mydropdown" aria-labelledby="navbarDropdown">
						<a class="dropdown-item" href="/policyvendor/grpurchased">No. of Policies Purchased</a> 
						<a class="dropdown-item" href="/policyvendor/grclaims">No. of claims Submitted</a> 
						<a class="dropdown-item" href="/policyvendor/grclaima">No. of claims approved</a> 
						<a class="dropdown-item" href="/policyvendor/grclaimr">No. of claims rejected</a>

					</div></li>
				<li class="nav-item"><a class="nav-link" href="/policyvendor/beforehelp">Help</a></li>
				<li class="nav-item"><a class="nav-link" href="#">Welcome <%=username%>(<%=userid%>)
				</a></li>
				<li class="nav-item"><a class="nav-link" href="/policyvendor/logout/">Logout</a></li>
			</ul>
		</div>
	</nav>
 
    <div class="card1">
      <table align="center" class="tables back" border="1px solid">
      <c:if test="${policyl !=null}">
      <tr>
       <td>PolicyId</td><td>PolicyName</td><td>DurationOfPolicy</td>
       <td>Premium_Amount</td><td>PolicyType</td><td>Edit the Policy</td>
       </tr>
       <c:forEach items="${policyl }" var="policyl1">
           <tr style="font-size: 18px; " >
           
      <td><c:out value="${policyl1.policyId}"></c:out></td>
       <td><c:out value="${policyl1.policyName }"></c:out></td>
       <td><c:out value="${policyl1.durationOfPolicy }"></c:out></td>
       <td><c:out value="${policyl1.sumassured }"></c:out></td>
       <td><c:out value="${policyl1.policytype }"></c:out></td>
       <td> <button><a href="/policyvendor/editpolicy?policyid=${policyl1.policyId}" style="color: black;">Edit Policy</a></button> </td>
    
    </tr>
    </c:forEach>
</c:if>

<c:if test="${claimlist!=null}">
<tr >
<td>PaymentId</td>
<td>CustomerId</td>
<td>PolicyName</td>
<td>Reason for Claim</td>
<td>Status</td>
<td>Response to<br>Claim</td>
</tr>
<tr>
<td><c:out value="${claimlist.payid}"></c:out></td>
<td><c:out value="${claimlist.userid}"></c:out></td>
<td><c:out value="${claimlist.policyname}"></c:out></td>
<td style="text-transform: capitalize;"><c:out value="${claimlist.reasonbyc}"></c:out></td>
<td style="text-transform: uppercase;"><c:out value="${claimlist.cstatus}"></c:out></td>
<c:choose>
<c:when test="${claimlist.cstatus== 'approved' || claimlist.cstatus== 'rejected'}">
<td><button title="this link is disabled" style="background-color: 'Grey'; border:none;">Approve</button><br>
<button title="this link is disabled" style="background-color: 'Grey'; border:none;">Reject</button> 
</td>
</c:when>
<c:otherwise>
<td> <button><a href="/policyvendor/acceptclaim?cid=${claimlist.claimid }" style="color: black;">Approve</a></button>
<button><a href="/policyvendor/rejectclaim?cid=${claimlist.claimid }" style="color: black;">Reject</a></button> </td>
</c:otherwise>
</c:choose>
</tr>
 
</c:if>
<c:if test="${message1!=null }">
<tr>
<td>${message1 }</td>
</tr>
</c:if>
<c:if test="${paym!=null }">
<tr><b style="font-size: x-large;color:white;">No. of Policies Purchased</b></tr>
<tr>
<td>PaymentId</td>
<td>Policy Type</td>
<td>Policy Name</td>
<td>PolicyVendor Name</td>
<td>CustomerId(who bought)</td>
<td>DurationOfPolicy</td>
</tr>
<tr>

<td><c:out value="${paym.payid}"></c:out></td>
<td><c:out value="${poli.policytype }"></c:out></td>
<td><c:out value="${poli.policyName }"></c:out></td>
<td><c:out value="${vend.policyvendorname }"></c:out></td>
<td><c:out value="${paym.userId }"></c:out></td>
<td><c:out value="${poli.durationOfPolicy }"></c:out></td>
</tr>

</c:if>

<c:if test="${claimp!=null }">
<tr><b style="font-size: x-large;color:white;">Claims Submitted</b></tr>
<tr>
<td>ClaimId</td>
<td>CustomerId</td>
<td>PolicyId</td>
<td>PolicyName</td>
<td>PolicyVendorId</td>
<td>PolicyVendorName</td>
</tr>
<tr>
<td>${claimp.claimid }</td>
<td>${claimp.userid }</td>
<td>${payme.policyId }</td>
<td>${policy.policyName }</td>
<td>${policy.policyvendorId }</td>
<td>${polve.policyvendorname }</td>
</tr>

</c:if>
<c:if test="${claimp1!=null }">
<tr><b style="font-size: x-large;color:white;">Claims Rejected</b></tr>
<tr>
<td>ClaimId</td>
<td>CustomerId</td>
<td>ClaimStatus</td>
<td>PolicyId</td>
<td>PolicyName</td>
<td>PolicyVendorId</td>
<td>PolicyVendorName</td>
</tr>
<tr>
<td>${claimp1.claimid }</td>
<td>${claimp1.userid }</td>
<td style="text-transform: uppercase;">${claimp1.cstatus }</td>
<td>${payme1.policyId }</td>
<td>${policy1.policyName }</td>
<td>${policy1.policyvendorId }</td>
<td>${polve1.policyvendorname }</td>
</tr>
</c:if>


<c:if test="${claimp2!=null }">
<tr><b style="font-size: x-large;color:white;">Claims Approved</b></tr>
<tr>
<td>ClaimId</td>
<td>CustomerId</td>
<td>ClaimStatus</td>
<td>PolicyId</td>
<td>PolicyName</td>
<td>PolicyVendorId</td>
<td>PolicyVendorName</td>
</tr>
<tr>

<td>${claimp2.claimid }</td>
<td>${claimp2.userid }</td>
<td style="text-transform: uppercase;">${claimp2.cstatus }</td>
<td>${payme2.policyId }</td>
<td>${policy2.policyName }</td>
<td>${policy2.policyvendorId }</td>
<td>${polve2.policyvendorname }</td>

</tr>

</c:if>
      </table>
     
      <c:if test="${message!=null }">  
   <script type="text/javascript">alert('<c:out value="${message}"/>');
	            
				</script>  
				</c:if>
 </div>
 

	<script src="/webjars/jquery/3.4.1/jquery.min.js"></script>
	<script src="/webjars/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</body>
</html>