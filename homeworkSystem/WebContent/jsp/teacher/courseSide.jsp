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
			<div class="left-title"><span><s:property value="semester"/></span></div>	
			<hr/>
			<div>
            <div class="left-sub-title"><span><s:property value="course.name"/></span></div>
	            <ul class="left-sub-list">
	                <li><a href="teacherCourse.action?courseId=<s:property value="course.id"/>&name=<s:property value="course.name"/>">课程学生</a></li>
	                <li><a href="showTeacherHomeworkList.action?courseId=<s:property value="course.id"/>&name=<s:property value="course.name"/>">课程作业</a></li>
	            </ul>
	            <s:iterator value="#request.courseList">
	         	 <div class="left-sub-title">
	         	 <a href="teacherCourse.action?courseId=<s:property value="id"/>&name=<s:property value="name"/>">
	         	 <s:property value="name"/>
	         	 </a></div>
	            </s:iterator>
        	</div>
		</div>

</body>
</html>