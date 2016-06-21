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
<%OnlineUserVO userVO = (OnlineUserVO)session.getAttribute("onlineUser");	%>
		<div class="left-sidebar">
			<div class="left-title"><span>我的消息</span></div>	
			<hr/>
            <ul class="left-list">
            	<li><a href="showUnreadMessage.action">未读消息</a></li>
            	<li><a href="showAllMessage.action">所有消息</a></li>
            </ul>
		</div>
		<div class="right-content">
			<s:if test="%{messageList.size()==0}">
			<div class="message-info-div">暂无消息</div>
			</s:if>
			<s:iterator value="messageList" >	
				<div class="message-info-div">
					<h4 class="message-title">${ title }</h4>
					<span class="message-time">${ createdTime }</span>
					<%-- <p class="message-content"> ${ content }</p> --%>
					<s:if test="%{type=='correctionOver'}">
					<a href="showTeacherHomeworkList.action?courseId=<s:property value="%{course.id}"/>&name=<s:property value="%{course.name}"/>" class="message-a"> << 查看 </a>
					</s:if>
					<s:elseif test="%{type=='publishGrade'|| type=='publishExample' || type=='publishHomework'}">
					<a href="showStudentHomeworkList.action?courseId=<s:property value="%{course.id}"/>&name=<s:property value="%{course.name}"/>" class="message-a"> << 查看 </a>
					</s:elseif>
					<s:elseif test="%{type=='reCorrect'}">
					<a href="showStudentsHomework.action?courseId=<s:property value="%{course.id}"/>&name=<s:property value="%{course.name}"/>" class="message-a"> << 查看 </a>
					</s:elseif>	
					<s:elseif test="%{type=='toCorrectHomework'}">
					<a href="showStudentsHomework.action?courseId=<s:property value="%{course.id}"/>&name=<s:property value="%{course.name}"/>" class="message-a"> << 查看</a>
					</s:elseif>
					<s:elseif test="%{type=='newAnnouncement'}">
					<a href="getAnnouncement.action?courseId=<s:property value="%{course.id}"/>&name=<s:property value="%{course.name}"/>" class="message-a"> << 查看</a>
					</s:elseif>
					<s:elseif test="%{type=='asAnnouncement'}">
					<a href="getAnnouncement.action?courseId=<s:property value="%{course.id}"/>&name=<s:property value="%{course.name}"/>" class="message-a"> << 查看</a>
					</s:elseif>
					
				</div>
			</s:iterator>
		</div>
</body>