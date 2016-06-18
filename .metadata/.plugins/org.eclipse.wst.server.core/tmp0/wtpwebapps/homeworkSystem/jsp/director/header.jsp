<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@page import="nju.edu.homework.vo.OnlineUserVO"%>
<% String localPath = request.getContextPath();%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="<%=localPath %>/css/main.css" rel="stylesheet" type="text/css"/>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<% OnlineUserVO userVO = (OnlineUserVO)session.getAttribute("onlineUser");	%>
	<header>
		<nav>
			<div class="logo"><img src="../../image/logo.png"></div>
			<div class="nav-left">
				<ul>
					<li><a href="showInitLastMonth.action">课程情况</a></li>
	                <li><a href="showAllStudentStat.action">学生情况</a></li>
	                <li><a href="showAllTeacherStat.action">教师情况</a></li>
				</ul>
			</div>
			<div class="nav-right">
				<s:include value="../user/header.jsp"></s:include>
			</div>
		</nav>
	</header>

</body>
</html>