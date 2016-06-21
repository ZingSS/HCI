<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<% String localPath = request.getContextPath();%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="<%=localPath %>/css/main.css" rel="stylesheet" type="text/css"/>
<title>作业系统</title>
</head>
<body id="login-page">
	<div class="login-content">
		<img src="<%=localPath %>/image/title.png" />
	    <form id="login-form" action="login.action" method="post">
	        <input type="text" placeholder="请输入帐号" name="userId"><br/>
	        <input type="password" placeholder="请输入密码" name="password"><br/>
	        <button type="submit">登录</button>
	        <span id="login-error">${FieldErrors.loginMessage[0]}</span>
	    </form>
	    <div class="login-bottom"></div>
	</div>

</body>
</html>