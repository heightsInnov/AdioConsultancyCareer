<%-- 
    Document   : index
    Created on : 18-Aug-2018, 12:26:28
    Author     : aojinadu
--%>

<%@page import="com.adio.career.Dao.ApplicantDao"%>
<%@page import="java.util.List"%>
<%@page import="com.adio.career.processor.control"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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

        <%@include file="WEB-INF/jspf/nav.jspf" %>

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
																<%
																	int count;
																	try {
																		control c = new control();
																		List<ApplicantDao> a = c.ReadFiles();

																		count = a.size();
																		if (count >= 4) {
																%>
																<div class="alert alert-danger text-center alert-dismissable sticky"><button class="close" aria-hidden="true" data-dismiss="alert" type="button">&times;</button><h4>Application Closed!!!</h4></div>
																<%
																		}
																	} catch (Exception e) {
																		System.out.println("Application Error, Contact Admin!!");
																	}
																%>
                                                                <div class="person-content">
																	<div class="row">
																		<div class="col-md-4">
																			<div class="form-group">
																				<div class="row">
																					<div class="col-md-12">
																						<img id="passp" name="passp" src="images/malePass.png" class="img-responsive"/>
																					</div>
																				</div>
																				<div class="row">
																					<div class="col-md-12">
																						<input type="file" required name="pass" class="contact-message form-control"
																							   id="pass"/>
																					</div>
																				</div>
																				<div class="row">
																					<div class="col-md-12">
																						<input type="submit" class="btn-default" value="upload"/>
																					</div>
																				</div>
																				</form>
																				<form enctype="multipart/form-data" action="supercontrol.java" method="post">
																					<br/>
																					<div class="row">
																						<div class="col-md-12">
																							<label style="font-size: medium; color: black">Resume</label>
																						</div>
																					</div>
																					<div class="row">
																						<div class="col-md-12">
																							<input type="file" name="resume" required class="contact-message form-control"
																								   id="resume"/>
																						</div>
																					</div>
                                                                            </div>
																		</div>
																		<div class="col-md-8">
																			<br/>
																			<div class="row">
																				<div class="col-md-12">
																					<div class="form-group">
																						<label class="sr-only" for="contact-name">
																							Firstname</label>
																						<input type="text" id="fname" required name="fname" placeholder="Firstname" class="form-control"/>
																					</div>
																				</div>
																			</div>
																			<div class="row">
																				<div class="col-md-12">
																					<div class="form-group">
																						<label class="sr-only" for="contact-name">
																							Surname</label>
																						<input type="text" id="sname" required name="sname" placeholder="Surname" class="form-control"/>
																					</div>
																				</div>
																			</div>
																			<div class="row">
																				<div class="col-md-12">
																					<div class="form-group">
																						<label class="sr-only" for="contact-name">
																							Phone Number</label>
																						<input type="text" id="phone" required name="phone" placeholder="Phone Number" class="form-control"/>
																					</div>
																				</div>
																			</div>
																			<div class="row">
																				<div class="col-md-12">
																					<div class="form-group">
																						<label class="sr-only" for="contact-name">
																							Email Address</label>
																						<input type="email" id="email" required name="email" placeholder="Email Address" class="form-control"/>
																					</div>
																				</div>
																			</div>
																			<div class="row">
																				<div class="col-md-12">
																					<div class="form-group">
																						<label class="sr-only" for="contact-name">
																							Cover Letter</label>
																						<textarea name="cletter" required placeholder="Cover Letter" class="contact-message form-control"
																								  id="cletter"></textarea>
																					</div>
																				</div>
																			</div>
																			<div class="row">
																				<div class="col-md-12">
																					<div class="form-group">
																						<input type="submit" id="submit" name="submit" value="Submit" class="btn-default"/>
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
