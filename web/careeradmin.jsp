<%-- 
    Document   : careeradmin
    Created on : 18-Aug-2018, 13:46:24
    Author     : aojinadu
--%>

<%@page import="com.adio.career.Dao.ApplicantDao"%>
<%@page import="java.util.List"%>
<%@page import="com.adio.career.processor.control"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
	String fname = "", sname = "", phone = "", email = "", cletter = "", pass = "", resume = "";
	try {
		String login = (String)session.getAttribute("login");
		if(!login.equalsIgnoreCase("TRUE")){
			response.sendRedirect("login.jsp");
		}
		control c = new control();
		List<ApplicantDao> lst = c.ReadFiles();

		for (ApplicantDao a : lst) {
			fname = a.getFirstname();
			sname = a.getSurname();
			phone = a.getPhoneNumber();
			cletter = a.getCoverLetter();
			pass = a.getPassprt().getPath();
			resume = a.getResume().getPath();
		}
	} catch (Exception e) {
	}

%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="WEB-INF/jspf/header.jspf" %>
        <script type="text/javascript">
			function controlId(btn) {
				var cmd = document.getElementById("command");
				cmd.value = btn;
				//var btn1 = cmd.value;
				//alert(btn1);
			}
        </script>
        <script>
			$(document).ready(
					var deptN = #nxtDept.value;
			deptN === $('#deptSel option:last').val();
					deptN == $(#deptSel).last().val();
					);
        </script>
    </head>
    <body>

        <form method="get" action="adminservlet.java" id="superform" name="superform">
			<section class="banner" role="banner">
				<header id="header">
					<div class="header-content clearfix">
						<!--<a class="logo" href="#"><img src="images/ubn.png" alt=""></a>-->
						<nav class="navigation" role="navigation">
							<ul class="primary-nav">
							</ul>
						</nav>
						<a href="#" class="nav-toggle">Menu<span></span></a>
					</div><!-- header content -->
				</header><!-- header -->
			</section>

			<section id="teams" class="section teams">
				<div class="container">
					<div class="row">
						<div class="headingsyle">
							<h1><span>Career Portal</span></h1>
						</div>
						<div class="row" id="testimonials">
							<div class="container-fluid">
								<div class="flexslider">
									<ul class="slides">
										<li>
											<div class="col-md-10">
												<div class="col-md-12 col-sm-12">
													<div class="feature-content">
														<div class="row">
															<div class="col-sm-12 wow fadeInDown" data-wow-delay="0.2s">
																<!--Header for name and nickname-->
																<div class="row">
																	<div class="panel-title">
																		<h4><span class="icon-pencil"></span>Application</h4>
																	</div>
																	<div class="person-content">

																		<div class="row">
																			<div class="col-md-12">
																				<div class="table-responsive">
																					<div id="memDetails">
																						<table  id="memTable" class="table preview-table  table-bordered">
																							<thead class="bg-primary">
																								<tr>    
																									<th width="15%" class="text-left">Firstname</th>
																									<th width="15%" class="text-left">Surname</th>
																									<th width="15%" class="text-left">Phone Number</th>
																									<th width="15%" class="text-left">Email Address</th>
																									<th width="20%" class="text-left">Cover Letter</th>
																									<th width="10%" class="text-left">Resume</th>
																									<th width="10%" class="text-left">Passport</th>
																								</tr>
																							</thead>
																							<tbody> 
																								<tr>
																									<td  id="firstname" width="500"><%= fname%></td>
																									<td  id="surname" width="500"><%= sname%></td>
																									<td  id="phone" width="500"><%= phone%></td>
																									<td  id="email" width="500"><%= email%></td>
																									<td  id="cletter" width="500"><%= cletter%></td>
																									<td  id="resume" width="500"><%= resume%></td>
																									<td  id="passport" width="500"><%= pass%></td>
																								</tr>
																							</tbody>
																						</table>

																					</div>
																				</div>
																			</div>
																		</div>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
										</li>
									</ul>
								</div>
							</div>
						</div>
					</div>
				</div>
			</section>
			<%@include file="WEB-INF/jspf/footer.jspf" %>
    </body>
</html>

