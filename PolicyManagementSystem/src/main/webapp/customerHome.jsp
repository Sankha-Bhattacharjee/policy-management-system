<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<title>Home</title>
<link rel="stylesheet" type="text/css" href="/style.css">
<link href="/webjars/bootstrap/4.0.0/css/bootstrap.min.css"
	rel="stylesheet">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
</head>
<body>
	<%
		String username = (String) session.getAttribute("username");
		int userid = (Integer) session.getAttribute("userId");
		session.setAttribute("uservid", userid);
		if (username == null || userid == 0) {
			response.sendRedirect("/customlogin/");
		}
	%>
	<!--  <div class="header">
		<header>
			<b class="heading">Policy Management</b>
		</header>
	</div>
	<div class="topnav">
		<a href="/customerHome.jsp" class="fas fa-home back"> My Home</a>
		 <a
			href="/customer/listofpolicies" class="fas fa-user-plus back">
			List of Policies</a> 
			<a href="/customer/listofmypolicies"
			class="fa fa-file back"> MyPolicies</a>
			 <a href="/customer/rminders"
			class="far fa-bell back">Check Notifications </a> 
			<a
			href="/customer/logout/" class="fas fa-power-off back"
			style="float: right;"> Logout</a>
			 <a href="/customerHome.jsp"
			style="float: right;"> Welcome <%=username%>(<%=userid%>)
		</a>
		<div class="dropdown" style="float: right;">
			<button class="dropbtn" style="font-size: 20px;">
				<i class=" fa fa-headphones" style="font-size: 20px;"></i>Support
			</button>
			<div class="dropdown-content">
				<a href="/customer/beforehelp" class="fas fa fa-wrench">Help</a>
			</div>
		</div>


		<a href="/customer/searchp" class="fas fa fa-search"
			style="float: right;"></a>

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
				<li class="nav-item active"><a class="nav-link" href="/customerHome.jsp">My Home
						<span class="sr-only">(current)</span>
				</a></li>
				<li class="nav-item"><a class="nav-link" href="/customer/listofpolicies">List of Policies</a></li>
				<li class="nav-item"><a class="nav-link" href="/customer/listofmypolicies">My Policies</a></li>
				<li class="nav-item"><a class="nav-link" href="/customer/rminders">Check Notification</a></li>
				<li class="nav-item float-right"><a class="nav-link" href="/customer/beforehelp" >Help</a></li>
				<li class="nav-item float-right"><a class="nav-link" href="/customer/searchp">Search</a></li>
				<li class="nav-item float-right"><a class="nav-link" href="#">Welcome <%=username%>(<%=userid%>)</a></li>
				<li class="nav-item float-right"><a class="nav-link" href="/customer/logout/" >Logout</a></li>
				
			</ul>
		</div>
		
	</nav>

	<div class="card1">
		<table align="center" class="tables back" border="1px solid">
			<!--  JSTL Core Tag    
-->
			<c:if test="${policylist!=null}">

				<tr>
					<td>PolicyId</td>
					<td>PolicyName</td>
					<td>DurationOfPolicy</td>
					<td>Sumassured</td>
					<td>PolicyType</td>
					<td>Buy Policy</td>
				</tr>
				<c:forEach items="${policylist}" var="policylist1">
					<tr style="font-size: 18px;">
						<td><c:out value="${policylist1.policyId}"></c:out></td>
						<td><c:out value="${policylist1.policyName }"></c:out></td>
						<td><c:out value="${policylist1.durationOfPolicy }"></c:out></td>
						<td><c:out value="${policylist1.sumassured }"></c:out></td>
						<td><c:out value="${policylist1.policytype }"></c:out></td>
						<td style="text-align: center;">
							<button>
								<a href="/customer/buypolicy?policyid=${policylist1.policyId}"
									style="color: black;">Buy Policy</a>
							</button>
						</td>
					</tr>
				</c:forEach>
			</c:if>

			<c:if test="${searchlist!=null}">
				<tr>
					<td>PolicyId</td>
					<td>PolicyName</td>
					<td>DurationOfPolicy</td>
					<td>Sumassured</td>
					<td>PolicyType</td>
					<td>Buy Policy</td>
				</tr>
				<c:forEach items="${searchlist}" var="searchlist1">
					<tr style="font-size: 18px;">
						<td><c:out value="${searchlist1.policyId}"></c:out></td>
						<td><c:out value="${searchlist1.policyName }"></c:out></td>
						<td><c:out value="${searchlist1.durationOfPolicy }"></c:out></td>
						<td><c:out value="${searchlist1.sumassured }"></c:out></td>
						<td><c:out value="${searchlist1.policytype }"></c:out></td>
						<td>
							<button>
								<a href="/customer/buypolicy?policyid=${searchlist1.policyId}"
									style="color: black;">Buy Policy</a>
							</button>
						</td>
					</tr>
				</c:forEach>
			</c:if>

			<c:if test="${mypol!=null }">
				<c:if test="${mypol1!=null }">

					<label
						style="background-color: rgba(0, 0, 0, 0.9); color: #e6e6e6; font-size: x-large; border: 1px solid;">TotalAmount=PremiumAmount+fineAmount</label>
					<tr>
						<td>PolicyId</td>
						<td>PolicyName</td>
						<td>DurationOfPolicy</td>
						<td>Payment<br>Period
						</td>
						<td>PolicyType</td>
						<td>PremiumAmount</td>
						<td>FineAmount</td>
						<td>NextPay date</td>
						<td>TotalAmount</td>
						<td>Status</td>
						<td>Payment/<br>Claim
						</td>
						<!-- <td>Claim? just press</td> -->
					</tr>

					<c:forEach items="${mypol1}" var="mypolicy1">
						<c:forEach items="${ mypol}" var="mypolicy">
							<c:if test="${mypolicy.policyId== mypolicy1.policyId}">
								<tr>
									<td>${mypolicy.policyId}</td>
									<td>${mypolicy.policyName}</td>
									<td>${mypolicy.durationOfPolicy}</td>
									<c:choose>
										<c:when test="${mypolicy1.paymentperiod==30 }">
											<td>Monthly</td>
										</c:when>
										<c:when test="${mypolicy1.paymentperiod==90 }">
											<td>Quarterly</td>
										</c:when>
										<c:when test="${mypolicy1.paymentperiod==180 }">
											<td>HalfYearly</td>
										</c:when>
										<c:when test="${mypolicy1.paymentperiod==360 }">
											<td>Yearly</td>
										</c:when>
									</c:choose>
									<td>${mypolicy.policytype}</td>

									<td><fmt:formatNumber type="number" maxFractionDigits="2"
											value="${mypolicy1.amount}" /></td>
									<td><fmt:formatNumber type="number" maxFractionDigits="2"
											value="${mypolicy1.fineamount}" /></td>
									<td>${mypolicy1.nextpayDate}</td>
									<td><fmt:formatNumber type="number" maxFractionDigits="2"
											value="${mypolicy1.totalamount}" /></td>

									<c:if test="${noofdays<1 && mypolicy1.paystatus!='claimed'}">
										<td style="text-transform: capitalize;">${mypolicy1.paystatus}
											(delayed by <fmt:formatNumber type="number"
												value="${noofdays < 0 ? -noofdays:noofdays}" /> days)
										</td>
									</c:if>
									<c:if test="${noofdays>=1 && mypolicy1.paystatus!='claimed' }">
										<td style="text-transform: capitalize;">${mypolicy1.paystatus}
											(due in ${noofdays} days)</td>
									</c:if>
									<c:if test="${mypolicy1.paystatus=='claimed' }">
										<td style="text-transform: uppercase;">${mypolicy1.paystatus}</td>
									</c:if>
									<td><c:choose>
											<c:when
												test="${mypolicy1.paystatus=='claimed' || mypolicy1.paystatus=='requested for claim'}">
												<button title="this link is disabled"
													style="background-color: 'Grey'; border: none;">Pay
													Bill</button>
												<br>
												<!-- </td> -->
											</c:when>
											<c:otherwise>
												<!-- <td> -->
												<button>
													<a href="/customer/duebill?pid=${mypolicy1.payid}"
														style="color: black;">Pay Bill</a>
												</button>
												<br>
												<!-- </td> -->
											</c:otherwise>
										</c:choose> <c:choose>
											<c:when
												test="${mypolicy1.paystatus=='paid' || mypolicy1.paystatus=='pending'  || mypolicy1.paystatus=='claim rejected'}">
												<!-- <td> -->
												<button style="color: black;">
													<a href="/customer/claim?payid=${mypolicy1.payid }"
														style="color: black;">Claim</a>
												</button>
												<!-- </td> -->
											</c:when>
											<c:when
												test="${mypolicy1.paystatus=='requested for claim'  }">
												<!-- <td> -->
												<button title="this link is disabled">${mypolicy1.paystatus}</button>
												<!-- </td> -->
											</c:when>
											<c:otherwise>
												<!-- <td> -->
												<button title="this link is disabled"
													style="background-color: 'Grey'; border: none;">Claim</button>
												<!-- </td> -->
											</c:otherwise>
										</c:choose></td>
								</tr>
							</c:if>
						</c:forEach>
					</c:forEach>

				</c:if>
			</c:if>


			<c:if test="${rem!=null }">
				<tr>
					<td>${rem }</td>
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