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
	<div class="left-sidebar">
			<div class="left-title"><span><s:property value="course.semester.name"/></span></div>	
			<hr/>
			<div>
	         
	            <s:iterator value="#request.courseList" id="cList">
	         	 <div class="left-sub-title">
	         	 <a href="showStudentHomeworkList.action?courseId=<s:property value="id"/>&name=<s:property value="name"/>">
	         	 <s:property value="name"/>
	         	 </a></div>
	         	  <s:if test="#cList.name==#request.course.name">
	         	    <ul class="left-sub-list">
	                <li><a href="showStudentHomeworkList.action?courseId=<s:property value="#request.course.id"/>&name=<s:property value="#request.course.name"/>">作业列表</a></li>
	            </ul>
	         	 </s:if>
	            </s:iterator>
        	</div>
		</div>

</body>
</html>