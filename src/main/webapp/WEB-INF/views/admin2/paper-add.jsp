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
		<title>试卷管理-添加试卷</title>
		<meta name="keywords" content="">
		<link rel="shortcut icon" href="<%=basePath%>resources/images/favicon.ico" />
		<link href="resources/bootstrap/css/bootstrap-huan.css" rel="stylesheet">
		<link href="resources/font-awesome/css/font-awesome.min.css" rel="stylesheet">
		<link href="resources/css/style.css" rel="stylesheet">

		<link href="resources/css/question-add.css" rel="stylesheet">
		<link href="resources/chart/morris.css" rel="stylesheet">
		<style>
			input.add-ques-amount,input.add-ques-score{
				width:50px;
				margin-right:0;
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
			<div class="col-xs-11" id="login-info">
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
					<li class="active">
						<a href="admin/question">综合管理</a>
					</li>
				</ul>
			</nav>
			<%--			</div>--%>
		</div>
		<!-- Navigation bar ends -->

		<div style="margin-bottom: 100px;">
			<div class="col-xs-2" style="padding-left:0">
				<ul class="nav default-sidenav">
					<li>
						<a href="admin/question"> <i class="fa fa-list-ul"></i> 试题管理 </a>
					</li>
					<li class="active">
						<a href="admin/paper"> <i class="fa fa-list-ul"></i> 试卷管理 </a>
					</li>
					<li>
						<a href="admin/media"> <i class="fa fa-list-ul"></i> 资料上传 </a>
					</li>
					<li>
						<a href="admin/user-list"> <i class="fa fa-list-ul"></i> 会员管理 </a>
					</li>
				</ul>
			</div>
			<div class="col-xs-10">
				<div>
					<h1> 添加试卷 </h1>
				</div>
				<div class="page-content row">
					<form id="form-exampaper-add">
						<div class="form-line add-update-exampapername">
							<span class="form-label"><span class="warning-label">*</span>试卷名称：</span>
							<input type="text" class="df-input-narrow">
							<span class="form-message"></span>
						</div>
						<div class="form-line add-update-exampaper-creat-type">
							<span class="form-label"><span class="warning-label">*</span>组卷方式：</span>
							<select class="df-input-narrow">
								<option value="2">自动组卷</option>
								<option value="1">手动组卷</option>

							</select>
							<span class="form-message"></span>
						</div>
						<div class="form-line add-update-exampaper-type">
							<span class="form-label"><span class="warning-label">*</span>试卷类型：</span>
							<select class="df-input-narrow">
								<option value="3">专家试卷</option>
								<option value="2" selected="selected">模拟考试</option>
								<option value="1">随机试卷</option>

							</select>
							<span class="form-message"></span>
						</div>
						<div class="form-line add-update-pass-point">
							<span class="form-label"><span class="warning-label">*</span>及格分数：</span>
							<input type="text" class="df-input-narrow">
							<span class="form-message"></span>
						</div>
						<div class="form-line add-update-duration">
							<span class="form-label"><span class="warning-label">*</span>时长（分钟）：</span>
							<input type="text" class="df-input-narrow">
							<span class="form-message"></span>
						</div>
						<div class="form-line add-update-types" style="display: block;">
							<span class="form-label"><span class="warning-label">*</span>题型：</span>
							<fieldset>
								<legend>
									选择题型分布
								</legend>
								<span class="add-ques-type">
									<label >单选题</label>
									<input type="hidden" class="ques-id" value="1">
									<input type="text" class="df-input-narrow add-ques-amount">
									<span>道</span>
									<label >每道题</label>
									<input type="text" class="df-input-narrow add-ques-score">
									<span>分</span>
								</span>
								<br>
								<span class="add-ques-type">
									<label >多选题</label>
									<input type="hidden" class="ques-id" value="2">
									<input type="text" class="df-input-narrow add-ques-amount">
									<span>道</span>
									<label >每道题</label>
									<input type="text" class="df-input-narrow add-ques-score">
									<span>分</span>
								</span>
								<br>
								<span class="add-ques-type">
									<label >判断题</label>
									<input type="hidden" class="ques-id" value="3">
									<input type="text" class="df-input-narrow add-ques-amount">
									<span>道</span>
									<label >每道题</label>
									<input type="text" class="df-input-narrow add-ques-score">
									<span>分</span>
								</span>
								<br>
								<span class="add-ques-type">
									<label >填空题</label>
									<input type="hidden" class="ques-id" value="4">
									<input type="text" class="df-input-narrow add-ques-amount">
									<span>道</span>
									<label >每道题</label>
									<input type="text" class="df-input-narrow add-ques-score">
									<span>分</span>
								</span>
								<br>
								<span class="add-ques-type">
									<label >简答题</label>
									<input type="hidden" class="ques-id" value="5">
									<input type="text" class="df-input-narrow add-ques-amount">
									<span>道</span>
									<label >每道题</label>
									<input type="text" class="df-input-narrow add-ques-score">
									<span>分</span>
								</span>
								<br>
								<span class="add-ques-type">
									<label >论述题</label>
									<input type="hidden" class="ques-id" value="6">
									<input type="text" class="df-input-narrow add-ques-amount">
									<span>道</span>
									<label >每道题</label>
									<input type="text" class="df-input-narrow add-ques-score">
									<span>分</span>
								</span>
								<br>
								<span class="add-ques-type">
									<label >分析题</label>
									<input type="hidden" class="ques-id" value="7">
									<input type="text" class="df-input-narrow add-ques-amount">
									<span>道</span>
									<label >每道题</label>
									<input type="text" class="df-input-narrow add-ques-score">
									<span>分</span>
								</span>
								<br>
							</fieldset>
							<span class="form-message"></span>
						</div>
						<div class="form-line add-total-point">
							<span class="form-label"><span class="warning-label">*</span>总分：</span>
							<input id="total-point" type="text" class="df-input-narrow" disabled="disbaled">
							<span class="form-message"></span>
						</div>
						<div class="form-line add-update-exampaper-scope" style="display: block;">
							<span class="form-label"><span class="warning-label">*</span>知识点：</span>
							<fieldset>
								<legend>
									知识点范围
								</legend>
								<div>
								<div class="clearfix">
									<div id="aq-course1" style="padding:0px;float:left; width:48%;">
										<select id="field-select" class="df-input-narrow" size="4" style="width:100%;">
											<c:forEach items="${fieldList }" var="item">
												<option value="${item.fieldId }">${item.fieldName }</option>
											</c:forEach>
										</select>
									</div>
									<div id="aq-course2" style="padding:0px; float:right;width:48%;">
										<select id="point-from-select" class="df-input-narrow" size="4" style="width:100%;">
										</select>
									</div>
								</div>

								<div style="text-align:center;margin:10px 0;">
									<button id="add-point-btn" class="btn btn-primary btn-xs">选择知识点</button>
									<button id="del-point-btn" class="btn btn-danger btn-xs">删除知识点</button>
									<button id="remove-all-point-btn" class="btn btn-warning btn-xs">清除列表</button>
								</div>
								<div id="kn-selected" style="padding-left:0px;text-align:center;margin-bottom:20px;">
										<select id="point-to-select" class="df-input-narrow" size="4" style="width:80%;">
										</select>
										<p style="font-size:12px;color:#AAA;">您可以从上面选择4个知识点</p>
								</div>
							</div>
							</fieldset>
							<span class="form-message"></span>
						</div>
						<div class="form-line">
							<input value="下一步" type="submit" class="df-submit">
						</div>
					</form>
				</div>
			</div>
		</div>

		<!-- Javascript files -->
		<!-- jQuery -->
		<script type="text/javascript" src="resources/js/jquery/jquery-1.9.0.min.js"></script>
		<script type="text/javascript" src="resources/js/all.js"></script>
		
		<!-- Bootstrap JS -->
		<script type="text/javascript" src="resources/bootstrap/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="resources/js/field-2-point.js"></script>
		<script type="text/javascript" src="resources/js/exampaper-add.js"></script>
	</body>
</html>