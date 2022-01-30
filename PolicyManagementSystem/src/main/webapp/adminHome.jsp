<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<title>Home</title>
<link rel="stylesheet" type="text/css" href="/style.css">
<link href="/webjars/bootstrap/4.0.0/css/bootstrap.min.css"
	rel="stylesheet">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<style type="text/css">
table {
	table-layout: fixed;
	width: 100%;
}

td {
	width: 30%;
	word-break: break-all;
}
</style>
</head>
<body>
	<%
		String username = (String) session.getAttribute("username");
		int userid = (Integer) session.getAttribute("userId");
		if (username == null || userid == 0) {
			response.sendRedirect("/policyvendorlogin/");
		}
	%>
	<!--  <div class="header"><header><b class="heading">Policy Management</b></header></div>
  <div class="topnav">
  <a href="/adminHome.jsp" class="fas fa-home back">  My Home</a>
  <a href="/admin/listvendors" class="fas fa-user-plus back"> List PolicyVendors</a>
  <div class="dropdown">
  <button class="dropbtn "style="size: 20px;"><i class="fas fa-sticky-note" style="font-size:20px;"></i> Generate Report <i class="fas fa-caret-down"></i></button>
  <div class="dropdown-content">
  
    <a href="/admin/grpurchased" class="" >No. of Policies Purchased</a>
    <a href="/admin/grclaims" class="" >No. of claims Submitted</a>
    <a href="/admin/grclaima" class="" >No. of claims approved</a>
    <a href="/admin/grclaimr" class="" >No. of claims rejected</a>
  </div>
  </div> 
  <a href="/admin/logout/" class="fas fa-power-off back" style="float: right;" >  Logout</a>
  <a href="/adminHome.jsp" style="float: right;">Welcomeusernameame %>useridrid %>)</a>
  <a href="/admin/helpreq" class="fas fa fa-wrench" style="float: right;">  Help</a>
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
					href="/adminHome.jsp"> My Home <span class="sr-only">(current)</span>
				</a></li>
				<li class="nav-item"><a class="nav-link"
					href="/admin/listvendors">Policy Vendor List</a></li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> Generate Report </a>
					<div class="dropdown-menu mydropdown"
						aria-labelledby="navbarDropdown">
						<a class="dropdown-item" href="/admin/grpurchased">No. of
							Policies Purchased</a> <a class="dropdown-item"
							href="/admin/grclaims">No. of claims Submitted</a> <a
							class="dropdown-item" href="/admin/grclaima">No. of claims
							approved</a> <a class="dropdown-item" href="/admin/grclaimr">No.
							of claims rejected</a>

					</div></li>
				<li class="nav-item"><a class="nav-link" href="/admin/helpreq">Help</a></li>
				<li class="nav-item"><a class="nav-link" href="#">Welcome <%=username%>(<%=userid%>)
				</a></li>
				<li class="nav-item"><a class="nav-link" href="/admin/logout/">Logout</a></li>
			</ul>
		</div>
	</nav>

	</div>
	<div class="card1">
		<table align="center" class="tables back" border="1px solid">
			<c:if test="${vendorlist!=null}">
				<tr>
					<td>Id</td>
					<td>Name</td>
					<td>Reg_No.</td>
					<td>PolicyType</td>
					<td>email</td>
					<td>Mobile</td>
					<td>website</td>
					<td>certificateissue</td>
					<td>certificateValidity</td>
					<td>Yearofestablishment</td>
					<td>activate</td>
					<td>Deactivate</td>
					<td>sfc</td>

				</tr>
				<!--  JSTL Core Tag -->
				<c:forEach items="${vendorlist}" var="vendors">

					<tr style="font-size: 18px;">
						<td>${vendors.vendorId}</td>
						<td>${vendors.policyvendorname}</td>
						<td>${vendors.policyvendorregno}</td>
						<td>${vendors.policytype}</td>
						<td>${vendors.emailaddress}</td>
						<td>${vendors.contactnumber }</td>
						<td>${vendors.website }</td>
						<td>${vendors.certificateissueddate}</td>
						<td>${vendors.certificatevaliditydate }</td>
						<td>${vendors.yearofestablishment }</td>
						<c:if test="${vendors.status!='activate'}">
							<td>
								<button>
									<a href="/admin/activate?vendorid=${vendors.vendorId}"
										style="color: black;">Activate</a>
								</button>
							</td>
						</c:if>
						<c:if test="${vendors.status=='activate'}">
							<td>
								<button title="this link is disabled"
									style="background-color: 'Grey'; border: none;">Activate</button>
							</td>
						</c:if>
						<c:if test="${vendors.status!='deactivate'}">
							<td>
								<button>
									<a href="/admin/deactivate?vendorid=${vendors.vendorId}"
										style="color: black;">Deactivate</a>
								</button>
							</td>
						</c:if>
						<c:if test="${vendors.status=='deactivate'}">
							<td>
								<button title="this link is disabled"
									style="background-color: 'Grey'; border: none;">Deactivate</button>
							</td>
						</c:if>
						<td><button>
								<a href="/admin/sendforcorrection?vendorid=${vendors.vendorId}"
									style="color: black;">Send for Correction</a>
							</button></td>
						<c:if test="${vendors.status=='sent for verification'}">
							<td>
								<button title="this link is disabled"
									style="background-color: 'Grey'; border: none;">sent
									for verification</button>
							</td>
						</c:if>
					</tr>

				</c:forEach>
			</c:if>
			<c:if test="${helpList!=null }">
				<tr>
					<td>UserId</td>
					<td>Issue</td>
					<td>Description</td>
					<td>Status</td>
					<td>Action</td>
				</tr>
				<c:forEach items="${helpList}" var="u">
					<tr>
						<td>${u.userId}</td>
						<td>${u.issue}</td>
						<td>${u.description}</td>
						<td>${u.status}</td>
						<td><c:choose>
								<c:when test="${u.status =='solved' }">

									<button>
										<a style="color: black;" disabled="disabled"
											title="link disabled">Respond</a>
									</button>
								</c:when>
								<c:otherwise>
									<button>
										<a href="/admin/respondhelp?helpid=${u.hid}"
											style="color: black;">Respond</a>
									</button>
								</c:otherwise>
							</c:choose></td>
					</tr>
				</c:forEach>
			</c:if>
			<c:if test="${paym!=null }">
				<tr>
					<b style="font-size: x-large;color:white;">No. of Policies Purchased</b>
				</tr>
				<tr>
					<td>PaymentId</td>
					<td>Policy Type</td>
					<td>Policy Name</td>
					<td>PolicyVendor Name</td>
					<td>CustomerId(who bought)</td>
					<td>DurationOfPolicy</td>
				</tr>
				<tr>
					<c:forEach items="${paym}" var="pay">
						<c:forEach items="${poli}" var="pol">
							<c:forEach items="${vend }" var="ven">
								<c:if
									test="${pay.policyId==pol.policyId && pol.policyvendorId==ven.vendorId}">
									<td><c:out value="${pay.payid}"></c:out></td>
									<td><c:out value="${pol.policytype }"></c:out></td>
									<td><c:out value="${pol.policyName }"></c:out></td>
									<td><c:out value="${ven.policyvendorname }"></c:out></td>
									<td><c:out value="${pay.userId }"></c:out></td>
									<td><c:out value="${pol.durationOfPolicy }"></c:out></td>
				</tr>
			</c:if>
			</c:forEach>
			</c:forEach>
			</c:forEach>
			</c:if>

			<c:if test="${claimp!=null }">
				<tr>
					<b style="font-size: x-large;color:white;">Claims Submitted</b>
				</tr>
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
				<tr>
					<b style="font-size: x-large;color:white;">Claims Rejected</b>
				</tr>
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
					<td>${claimp1.cstatus }</td>
					<td>${payme1.policyId }</td>
					<td>${policy1.policyName }</td>
					<td>${policy1.policyvendorId }</td>
					<td>${polve1.policyvendorname }</td>
				</tr>
			</c:if>


			<c:if test="${claimp2!=null }">
				<tr>
					<b style="font-size: x-large;color:white;">Claims Approved</b>
				</tr>
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
					<td>${claimp2.cstatus }</td>
					<td>${payme2.policyId }</td>
					<td>${policy2.policyName }</td>
					<td>${policy2.policyvendorId }</td>
					<td>${polve2.policyvendorname }</td>
				</tr>

			</c:if>
		</table>

		<c:if test="${message!=null }">
			<script type="text/javascript">
				alert('<c:out value="${message}"/>');
			</script>
		</c:if>
	</div>

	<script src="/webjars/jquery/3.4.1/jquery.min.js"></script>
	<script src="/webjars/bootstrap/4.0.0/js/bootstrap.min.js"></script>

</body>
</html>