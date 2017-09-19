<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.io.File"%>
<!DOCTYPE html>
<%
    String path=application.getRealPath("/").replace('\\', '/')+"profile_images/";
    path = path.replace("build/", "");
    String filename = path+session.getAttribute("username")+".jpg";
    String pimage = "assets/images/placeholder.jpg";
    File f = new File(filename);
    if(f.exists() && !f.isDirectory()) { 
       pimage = "profile_images/"+session.getAttribute("username")+".jpg";
   }
    //pimage = pimage.replace("build/", "");
%>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title><%="System Name" %></title>

	<!-- Global stylesheets -->
	<link href="https://fonts.googleapis.com/css?family=Roboto:400,300,100,500,700,900" rel="stylesheet" type="text/css">
	<link href="assets/css/icons/icomoon/styles.css" rel="stylesheet" type="text/css">
	<link href="assets/css/bootstrap.css" rel="stylesheet" type="text/css">
	<link href="assets/css/core.css" rel="stylesheet" type="text/css">
	<link href="assets/css/components.css" rel="stylesheet" type="text/css">
	<link href="assets/css/colors.css" rel="stylesheet" type="text/css">
	<!-- /global stylesheets -->

	<!-- Core JS files -->
	<script type="text/javascript" src="assets/js/plugins/loaders/pace.min.js"></script>
	<script type="text/javascript" src="assets/js/core/libraries/jquery.min.js"></script>
	<script type="text/javascript" src="assets/js/core/libraries/bootstrap.min.js"></script>
	<script type="text/javascript" src="assets/js/plugins/loaders/blockui.min.js"></script>
	<script type="text/javascript" src="assets/js/plugins/ui/nicescroll.min.js"></script>
	<script type="text/javascript" src="assets/js/plugins/ui/drilldown.js"></script>
	<!-- /core JS files -->

	<!-- Theme JS files -->
	<script type="text/javascript" src="assets/js/plugins/visualization/d3/d3.min.js"></script>
	<script type="text/javascript" src="assets/js/plugins/visualization/d3/d3_tooltip.js"></script>
	<script type="text/javascript" src="assets/js/plugins/forms/styling/switchery.min.js"></script>
	<script type="text/javascript" src="assets/js/plugins/forms/styling/uniform.min.js"></script>
	<script type="text/javascript" src="assets/js/plugins/forms/selects/bootstrap_multiselect.js"></script>
	<script type="text/javascript" src="assets/js/plugins/ui/moment/moment.min.js"></script>
	<script type="text/javascript" src="assets/js/plugins/pickers/daterangepicker.js"></script>

	<script type="text/javascript" src="assets/js/core/app.js"></script>
	<script type="text/javascript" src="assets/js/pages/dashboard.js"></script>

	<script type="text/javascript" src="assets/js/plugins/ui/ripple.min.js"></script>
        <script type="text/javascript" src="assets/js/plugins/forms/wizards/steps.min.js"></script>
	<script type="text/javascript" src="assets/js/plugins/forms/selects/select2.min.js"></script>
	<script type="text/javascript" src="assets/js/plugins/forms/styling/uniform.min.js"></script>
	<script type="text/javascript" src="assets/js/core/libraries/jasny_bootstrap.min.js"></script>
	<script type="text/javascript" src="assets/js/plugins/forms/validation/validate.min.js"></script>
	<script type="text/javascript" src="assets/js/plugins/extensions/cookie.js"></script>

	<script type="text/javascript" src="assets/js/core/app.js"></script>
	<script type="text/javascript" src="assets/js/pages/wizard_steps.js"></script>

	<script type="text/javascript" src="assets/js/plugins/ui/ripple.min.js"></script>
        	<!-- Theme JS files -->
	<script type="text/javascript" src="assets/js/plugins/forms/validation/validate.min.js"></script>
        <script type="text/javascript" src="assets/js/plugins/fileinput.js"></script>
	<script type="text/javascript" src="assets/js/plugins/forms/styling/uniform.min.js"></script>
	 <script>
           var app_url ='${pageContext.request.contextPath}/'; 
      </script>
	<script type="text/javascript" src="assets/js/core/app.js"></script>
	<script type="text/javascript" src="assets/js/pages/login_validation.js"></script>
	<!-- /theme JS files -->
	       

</head>

<body>

	<!-- Main navbar -->
	<div class="navbar navbar-inverse bg-indigo">
		<div class="navbar-header">
			<a class="navbar-brand" href="index.html"><i class="icon-collaboration position-left"></i><b>BLOGTRACKERS</b></a>

			<ul class="nav navbar-nav pull-right visible-xs-block">
				<li><a data-toggle="collapse" data-target="#navbar-mobile"><i class="icon-tree5"></i></a></li>
			</ul>
		</div>

		<div class="navbar-collapse collapse" id="navbar-mobile">
		

			<p class="navbar-text"><span class="label bg-success-400">Basic plan</span></p>

			
			<ul class="nav navbar-nav navbar-right">
				
				<li class="dropdown">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown">
						Select Tracker
						<span class="caret"></span>
					</a>
					
					<div class="dropdown-menu dropdown-content width-350">
						<div class="dropdown-content-heading">
							Modify your trackers
							
						</div>

						<ul class="media-list dropdown-content-body">
							<li class="media">
							<div class="media-left">
							
									<ul class="icons-list">
								<li><a href="#"><i class="icon-compose"></i></a></li>
							</ul>
							</div>

								<div class="media-body">
								
										<a class="media-annotation pull-right danger">X</a>
									<span class="media-heading">
										<span class="text-semibold">NATO Blog</span>
									</span>
										
									

									<span class="text-muted">Here is the description for the tracker</span>
								</div>
							</li>

							

						</ul>

						<div class="dropdown-content-footer">
							<a href="#" data-popup="tooltip" title="See all trackers"><i class="icon-menu display-block"></i></a>
						</div>
					</div>
				</li>
                                       
				<li class="dropdown dropdown-user">
					<a class="dropdown-toggle" data-toggle="dropdown">
						<img src="<%=pimage%>" alt="">
						<span><%=session.getAttribute("username")%></span>
						<i class="caret"></i>
					</a>

					<ul class="dropdown-menu dropdown-menu-right">
						<li><a href="<%=request.getContextPath()%>/profile"><i class="icon-user-plus"></i> My profile</a></li>
						<li class="divider"></li>
						<li><a href="<%=request.getContextPath()%>/profile"><i class="icon-cog5"></i> Account settings</a></li>
						<li><a href="<%=request.getContextPath()%>/logout"><i class="icon-switch2"></i> Logout</a></li>
					</ul>
				</li>
			</ul>
		</div>
	</div>
	<!-- /main navbar -->


	<!-- Second navbar -->
	<div class="navbar navbar-default" id="navbar-second">
		<ul class="nav navbar-nav no-border visible-xs-block">
			<li><a class="text-center collapsed" data-toggle="collapse" data-target="#navbar-second-toggle"><i class="icon-menu7"></i></a></li>
		</ul>

		<div class="navbar-collapse collapse" id="navbar-second-toggle">
			<ul class="nav navbar-nav navbar-nav-material">
				
                                <li class="dropdown active">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown">
						<i class="icon-home position-left"></i> Home <span class="caret"></span>
					</a>

					<ul class="dropdown-menu width-200">
						<li class="dropdown-header">Home</li>
                                                <li> <a href="<%=request.getContextPath()%>/Datasource" onclick="showGif()"><i class="icon-pencil3"></i> Setup Tracker </a></li>
                                                <li> <a href="<%=request.getContextPath()%>/Dashboard" onclick="showGif()"><i class="icon-select2"></i> Dashboard </a></li>
                                        </ul>
				</li>
                                
                                <li >
					<a href="${pageContext.request.contextPath}/posting_frequencey.jsp" onclick="showGif()">
						<i class="icon-history position-left"></i> Frequency
					</a>
				</li>
                                
                                <li >
					<a href="${pageContext.request.contextPath}/keyword_trends.jsp" onclick="showGif()">
						<i class="icon-cross2 position-left"></i>Trends 
					</a>
				</li>
                                
                                <li >
					<a href="${pageContext.request.contextPath}/sentiments.jsp" onclick="showGif()">
						<i class="icon-clipboard3 position-left"></i> Sentiments
					</a>      
				</li>
                                
                                <li >
					<a href="${pageContext.request.contextPath}/influence.jsp"  onclick="showGif()">
						<i class="icon-sync position-left"></i> Influence
					</a>      
				</li>
                                
                                <li class="dropdown">
					<a href="${pageContext.request.contextPath}/blog_network.jsp" onclick="showGif()" >
						<i class="icon-tree5 position-left"></i> Blog Network 
					</a>

				</li>
                                
                                <li class="dropdown">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown">
						<i class="icon-bubbles4 position-left"></i>Information <span class="caret"></span>
					</a>

					<ul class="dropdown-menu width-200">
						<li class="dropdown-header">Additional Information</li>
                                                <li> <a href="/BT/additional_blog_info.jsp" onclick="showGif()"><i class="icon-accessibility position-left"></i> Additional Blog Info</a></li>
                                                <li> <a href="/BT/additional_blogger_info.jsp" onclick="showGif()"><i class="icon-user-plus position-left"></i> Additional Blogger Info</a></li>
                                        </ul>
				</li>
                                
                                <li class="dropdown">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown">
						<i class="icon-bars-alt position-left"></i> Presentation <span class="caret"></span>
					</a>

					<ul class="dropdown-menu">
						<li class="dropdown-header">Data Presentation</li>
                                                <li class="current-page"> <a href="/BT/data_presentation.jsp" onclick="showGif()"><i class="icon-bars-alt position-left"></i> Data Export in JSON</a></li>
                                        </ul>
				</li>
                               
                                <li class="dropdown mega-menu mega-menu-wide">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="icon-puzzle4 position-left"></i> Services <span class="caret"></span></a>

					<div class="dropdown-menu dropdown-content">
						<div class="dropdown-content-body">
							<div class="row">
								<div class="col-md-3">
									<span class="menu-heading underlined">Upgrade Options</span>
									<ul class="menu-list">
										<li>
											<a href="#"><i class="icon-pencil3"></i> Plans</a>
										</li>
										<li>
											<a href="#"><i class="icon-file-css"></i> Testimonials</a>
                                                                                </li>
									</ul>
								</div>
								<div class="col-md-3">
									<span class="menu-heading underlined">Training</span>
									<ul class="menu-list">
										<li>
											<a href="#"><i class="icon-play"></i> Video Tutorial</a>
										</li>
										<li>
											<a href="#"><i class="icon-file-stats"></i> Download PDF</a>	
										</li>
										
									</ul>
								</div>
								
								<div class="col-md-3">
									<span class="menu-heading underlined">Customer Support</span>
									<ul class="menu-list">
										<li>
											<a href="#"><i class="icon-people"></i> Customer Support</a>
										</li>
									</ul>
								</div>
							</div>
						</div>
					</div>
				</li>
                              
				<li>
					<a>
						<i class="icon-history position-left"></i>
						Blogtrackers
						<span class="label label-inline position-right bg-success-400">Live</span>
					</a>
				</li>
				
				

			</ul>  
				


		</div>
	</div>