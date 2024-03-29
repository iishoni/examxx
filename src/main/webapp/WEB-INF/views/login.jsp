<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme() + "://"
+ request.getServerName() + ":" + request.getServerPort()
+ path + "/";
%>

<!DOCTYPE html>
<html>
	<head>
		<base href="<%=basePath%>">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta charset="utf-8"><meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<title>请登录</title>
		
		<meta name="apple-mobile-web-app-capable" content="yes">
		<meta name="keywords" content="">
		<link rel="shortcut icon" href="<%=basePath%>resources/images/favicon.ico" />
		<link href="resources/bootstrap/css/bootstrap-huan.css" rel="stylesheet">
		<link href="resources/font-awesome/css/font-awesome.min.css" rel="stylesheet">
		<link href="resources/css/style.css" rel="stylesheet">
		<style type="text/css">
			.form-group {
				margin-bottom: 5px;
				height: 59px;
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
<%--			<div id="login-info" style="margin-top: 12px; margin-right: 40px;">--%>
<%--				<c:choose>--%>
<%--					<c:when test="${not empty sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.username}">--%>
<%--						<div id="login-info-user">--%>

<%--							<%-- <a href="#" id="system-info-account">${sessionScope.SPRING_SECURITY_CONTEXT.authentication.principal.username}</a>--%>
<%--							<span>|</span>--%>
<%--							<a href="j_spring_security_logout"><i class="fa fa-sign-out"></i> 退出</a>--%>
<%--						</div>--%>
<%--					</c:when>--%>
<%--					<c:otherwise>--%>
<%--						<a class="btn btn-primary" href="user-register">用户注册</a>--%>
<%--						<a class="btn btn-success" href="user-login-page">登录</a>--%>
<%--					</c:otherwise>--%>
<%--				</c:choose>--%>
<%--			</div>--%>
		</div>
		<%--			</div>--%>
	</header>
		<!-- Navigation bar starts -->

<%--		<div class="navbar bs-docs-nav" role="banner">--%>
<%--&lt;%&ndash;			<div class="container">&ndash;%&gt;--%>
<%--				<nav class="collapse navbar-collapse bs-navbar-collapse"--%>
<%--				role="navigation">--%>
<%--					<ul class="nav navbar-nav">--%>
<%--						<li class="active">--%>
<%--							<a href="home">教学资料</a>--%>
<%--						</li>--%>
<%--						<li>--%>
<%--							<a href="to-practice-exam">模拟考试</a>--%>
<%--						</li>--%>
<%--						<li>--%>
<%--							<a href="to-start-exam">正式考试</a>--%>
<%--						</li>--%>
<%--						<li>--%>
<%--							<a href="to-manage">综合管理</a>--%>
<%--						</li>--%>
<%--					</ul>--%>
<%--				</nav>--%>
<%--&lt;%&ndash;			</div>&ndash;%&gt;--%>
<%--		</div>--%>

		<!-- Navigation bar ends -->

		<div class="content" style="margin-bottom: 100px;">

			<div class="container">
				<div class="row">

					<div class="col-md-12">
						<div class="lrform">
							<h5>请登录</h5>
							<div class="form">
								<!-- Login form (not working)-->
								<form class="form-horizontal" action="j_spring_security_check" method="post">
									<!-- Username -->
									<div class="form-group">
										<label class="control-label col-md-3" for="username">用户名</label>
										<div class="col-md-7">
											<input type="text" class="form-control" name="j_username" style="background-color: #ffffff">
										</div>
									</div>
									<!-- Password -->
									<div class="form-group">
										<label class="control-label col-md-3" for="password">密码</label>
										<div class="col-md-7">
											<input type="password" class="form-control" name="j_password" style="background-color: #ffffff">
										</div>
									</div>
									<!-- Buttons -->
									<div class="form-group">
										<!-- Buttons -->
										<div class="col-md-9 col-md-offset-3">
											<button type="submit" class="btn btn-default">
												登录
											</button>
											<button type="reset" class="btn btn-default">
												取消
											</button>
											<span class="form-message">${result}</span>
										</div>
									</div>
								</form>
<%--								没有账号? <a href="user-register">注册</a>--%>
							</div>
						</div>

					</div>
				</div>

			</div>

		</div>

		<!-- Javascript files -->
		<!-- jQuery -->
		<script type="text/javascript" src="resources/js/jquery/jquery-1.9.0.min.js"></script>
		<!-- Bootstrap JS -->
		<script type="text/javascript" src="resources/bootstrap/js/bootstrap.min.js"></script>
	</body>
</html>