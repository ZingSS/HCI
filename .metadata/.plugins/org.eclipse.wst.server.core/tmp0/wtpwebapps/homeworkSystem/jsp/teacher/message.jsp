<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>消息列表</title>
</head>
<body>
	<s:include value="../teacher/header.jsp"></s:include>
	<div class="content">
		<div class="left-sidebar">
			<div class="left-title"><span>我的消息</span></div>	
			<hr/>
            <ul class="left-list">
            	<li><a href="showUnreadMessage.action">未读消息</a></li>
            	<li><a href="showAllMessage.action">所有消息</a></li>
            </ul>
		</div>
		<s:include value="../user/message.jsp"></s:include>
	</div>

</body>
</html>