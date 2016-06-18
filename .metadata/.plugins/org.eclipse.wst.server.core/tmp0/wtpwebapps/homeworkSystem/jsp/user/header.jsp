<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@page import="nju.edu.homework.vo.OnlineUserVO"%>
<% String localPath = request.getContextPath();%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="<%=localPath %>/css/main.css" rel="stylesheet" type="text/css"/>

<title></title>
</head>
<body>
	<%
		OnlineUserVO userVO = (OnlineUserVO)session.getAttribute("onlineUser");
		
	%>
<ul>
	<li id="nav-user-name"><% out.print(userVO.getName()); %></li>
	<li><a href="showUnreadMessage.action">消息 
	<% int messageNum = (int)session.getAttribute("unreadMessage"); 
		if(messageNum != 0){
			out.print("<span id='message-tip'>"+session.getAttribute("unreadMessage")+"</span>");
		}
	%>
	</a></li>
	<li><a href="logout.action">退出登录</a></li>
</ul>

</body>
</html>