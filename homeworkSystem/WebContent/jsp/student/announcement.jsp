<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@ page language="java" import="java.util.List"%>
<%@ page language="java" import="nju.edu.homework.model.Announcement"%>
<%
	String localPath = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><s:property value="course.name" /></title>
</head>
<body>
	<s:include value="../student/header.jsp"></s:include>
	<div class="content">
		<s:include value="../student/courseSide.jsp"></s:include>
		<div class="right-content">
			<%-- <div><a href="exportCourseExcel.action?courseId=<s:property value="course.id"/>">生成课程Excel文件</a></div> --%>
			<div class="course-header-info">
				<div class="course-header-main">
					<span id="course-header-name"><s:property
							value="course.name" /></span> <br /> <span id="course-header-id"><s:property
							value="course.courseId" /></span>
				</div>
				<div class="course-header-left">
					<span><s:property value="course.time" /></span> <br /> <span><s:property
							value="course.location" /></span> <br />
					<s:iterator value="%{course.assistant}">
						<span>${ name }</span>
					</s:iterator>
					<%-- <s:if test="%{course.semester.startTime.after(currentDate)}">
                	<a href="assistantManagement.action?courseId=<s:property value="course.id"/>" class="add-td-a">管理助教</a>
                </s:if> --%>
				</div>
			</div>
			<s:if test="%{announcementList.size() == 0}">
				<div class="t-homework">暂无公告</div>
			</s:if>
			<s:iterator value="announcementList" >
			    <div class="announce-header-info" style="margin-top:2%">
					<div class="announce-header-main">
						<span style="font-size: 25px;margin-left:1%;margin-top:2%"><s:property value="title" /></span>
						<h3 style="font-size: 15px;margin-left:1%;margin-top:1%"><s:property value="tname" />&nbsp<s:property value="atime" /></h3>
						<h3 style="font-size: 15px;margin-left:1%;margin-top:1%;margin-bottom: 2%">&nbsp &nbsp<s:property value="content" /></h3>
					</div>
				</div>
			    </s:iterator>
		</div>
	</div>
</body>
</html>