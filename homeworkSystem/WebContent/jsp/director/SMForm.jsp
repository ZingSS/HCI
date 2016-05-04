<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<% String localPath = request.getContextPath();%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="semester-month-form">
				<form action="setSemesterAndMonth.action" method="post">
	                <label>学期</label>
	                <s:select name="semester" list="semesterList" id="semester-list">
	            	</s:select>
	                <label>月份</label>
	                <s:select name="month" list="monthList" id="month-list">
	            	</s:select>
	            	<%@page import="com.opensymphony.xwork2.ognl.OgnlValueStack"%>  
					<%  
					 ((OgnlValueStack) request.getAttribute("struts.valueStack")).set(  
					   "jumpType", request.getParameter("jumpType"));  
					%>  
					<s:hidden name="jumpType" value="%{jumpType}"/>
					<s:hidden name="courseId" value="%{course.id}"/>
					<s:hidden name="userId" value="%{user.id}"/>
	            	<button type="submit" class="stat-btn">统计</button>
	        </form>
	</div>
<script type="text/javascript" src="<%=localPath %>/js/jquery.js" charset="utf-8"></script>
<script type="text/javascript" src="<%=localPath %>/js/stat.js" charset="utf-8"></script>

</body>
</html>