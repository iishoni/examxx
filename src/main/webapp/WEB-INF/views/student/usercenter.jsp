<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<%-- <%@taglib uri="spring.tld" prefix="spring"%> --%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
  <head>
    	<base href="<%=basePath%>">
    
    	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta charset="utf-8"><meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<title>用户中心</title>
		<meta name="apple-mobile-web-app-capable" content="yes">
		<meta name="keywords" content="">
		<link rel="shortcut icon" href="<%=basePath%>resources/images/favicon.ico" />
		<link href="resources/bootstrap/css/bootstrap-huan.css" rel="stylesheet">
		<link href="resources/font-awesome/css/font-awesome.min.css" rel="stylesheet">
		<link href="resources/css/style.css" rel="stylesheet">
		
		<link href="resources/css/exam.css" rel="stylesheet">
		<link href="resources/chart/morris.css" rel="stylesheet">
		<!--[if lte IE 8]>
			<script type="text/javascript" src="resources/chartjs/excanvas.js"></script>
		<![endif]-->
		<style>
			.table-striped a{
				text-decoration: underline;
			}
			
			.span-success{
				color:#5cb85c;
				font-weight:bolder;
			}
			
			.span-danger{
				color:#d9534f;
				font-weight:bolder;
			}
			
			.span-info{
				color:#5bc0de;
				font-weight:bolder;
			}
			
			h6{
				font-weight:bold !important; 
			}
			
			.radar-legend li span {
				display: block;
				position: absolute;
				left: 0;
				top: 0;
				width: 20px;
				height: 100%;
				border-radius: 5px;
			}
			
			.radar-legend li {
				display: block;
				padding-left: 30px;
				position: relative;
				margin-bottom: 4px;
				border-radius: 5px;
				padding: 2px 8px 2px 28px;
				font-size: 14px;
				cursor: default;
				-webkit-transition: background-color 200ms ease-in-out;
				-moz-transition: background-color 200ms ease-in-out;
				-o-transition: background-color 200ms ease-in-out;
				transition: background-color 200ms ease-in-out;
			}				
		</style>
	</head>
	<body>
	<header>
		<%--			<div class="container">--%>
		<div class="row" style="background-image: url(resources/images/bpic.png); margin-right: 0">
			<div class="col-xs-1">
				<div class="logo">
					<h1><a href="#"><img alt="" src="resources/images/blogo.png"></a></h1>
				</div>
			</div>
			<div id="login-info" class="col-xs-11">
				<c:choose>
					<c:when test="${not empty sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.username}">
						<div id="login-info-user">

							<a href="#" id="system-info-account">${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.username}</a>
							<span>|</span>
							<a href="j_spring_security_logout"><i class="fa fa-sign-out"></i> 退出</a>
						</div>
					</c:when>
					<c:otherwise>
						<div id="login-info-user">
							<a href="user-login-page"> 请登录</a>
						</div>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
		<%--			</div>--%>
		</header>

		<!-- Navigation bar starts -->
		<div class="navbar bs-docs-nav" role="banner">
			<%--			<div class="container">--%>
			<nav class="collapse navbar-collapse bs-navbar-collapse" role="navigation">
				<ul class="nav navbar-nav">
					<li>
						<a href="home">教学资料</a>
					</li>
					<li>
						<a href="to-practice-exam">模拟考试</a>
					</li>
					<li>
						<a href="to-start-exam">正式考试</a>
					</li>
					<li>
						<a href="to-manage">综合管理</a>
					</li>
				</ul>
			</nav>
			<%--			</div>--%>
		</div>
		<!-- Navigation bar ends -->

		<!-- Slider starts -->

		<div>
			<!-- Slider (Flex Slider) -->

			<div class="container" style="min-height:500px;">

				<div class="row">
					<div class="col-xs-1">
					</div>
					<div class="col-xs-9">
						<div class="page-header">
							<h1><i class="fa fa-dashboard"></i> 用户中心</h1>
						</div>
						<div class="page-content row">
							<div class="col-xs-4">
								<h6>个人信息</h6>
								<div>
									<span >姓名：</span>
									<span> ${username }</span>
								</div>
								<div>
									<span >邮箱：</span>
									<span> ${email } </span>
								</div>
								<div>
									<span >专业：</span>
									<span> ${field } </span>
								</div>
								<div>
									<span >上次登录：</span>
									<span> <fmt:formatDate value="${lastLoginTime }" pattern="yyyy-MM-dd"/> </span>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-xs-12" id="radar-div">
								<h6>知识掌握情况</h6>

								<div class="page-content row">
									<div class="col-xs-8">
										<canvas id="canvas" height="450" width="450"></canvas>
										<p>此统计数据不包括简答、论述、分析等主观题</p>
									</div>
									<div class="col-xs-4" id="radar-legend">
									</div>
								</div>

							</div>
						</div>

					</div>
				</div>
			</div>
		</div>

<%--		<footer>--%>
<%--			<div class="container">--%>
<%--				<div class="row">--%>
<%--					<div class="col-md-12">--%>
<%--						<div class="copy">--%>
<%--							<p>--%>
<%--								Exam++ Copyright © <a href="http://www.examxx.net/" target="_blank">Exam++</a> - <a href="." target="_blank">主页</a> | <a href="http://www.examxx.net/" target="_blank">关于我们</a> | <a href="http://www.examxx.net/" target="_blank">FAQ</a> | <a href="http://www.examxx.net/" target="_blank">联系我们</a>--%>
<%--							</p>--%>
<%--						</div>--%>
<%--					</div>--%>
<%--				</div>--%>

<%--			</div>--%>

<%--		</footer>--%>

		<!-- Slider Ends -->

		<!-- Javascript files -->
		<!-- jQuery -->
		<script type="text/javascript" src="resources/js/jquery/jquery-1.9.0.min.js"></script>
		<script type="text/javascript" src="resources/chartjs/Chart.min.js"></script>
		
		<!-- Bootstrap JS -->
		<script type="text/javascript" src="resources/bootstrap/js/bootstrap.min.js"></script>
		
		<script type="text/javascript">
		var radarChartData = {
				labels: [${labels}],
				datasets: [
					{
						label: "完成率",
						fillColor: "rgba(220,220,220,0.2)",
						strokeColor: "rgba(220,220,220,1)",
						pointColor: "rgba(220,220,220,1)",
						pointStrokeColor: "#fff",
						pointHighlightFill: "#fff",
						pointHighlightStroke: "rgba(220,220,220,1)",
						data: [${finishrate}]
					},
					{
						label: "正确率",
						fillColor: "rgba(151,187,205,0.2)",
						strokeColor: "rgba(64, 170, 83,1)",
						pointColor: "rgba(151,187,205,1)",
						pointStrokeColor: "#fff",
						pointHighlightFill: "#fff",
						pointHighlightStroke: "rgba(151,187,205,1)",
						data: [${correctrate}]
					}
				]
			};

			window.onload = function(){
			
				
				var ctx = document.getElementById("canvas").getContext("2d");
				window.myBar = new Chart(ctx).Radar(radarChartData, {
					responsive : false,
					scaleShowLabels : true
				});
				
				var html = window.myBar.generateLegend();
				
				$("#radar-legend").append(html);
			};
		</script>
	</body>
</html>