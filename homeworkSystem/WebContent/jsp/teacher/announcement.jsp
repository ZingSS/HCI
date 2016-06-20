<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
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
	<s:include value="../teacher/header.jsp"></s:include>
	<div class="content">
		<s:include value="../teacher/courseSide.jsp"></s:include>
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

			<div class="t-homework">
				<ul>
					<li><a
						href="toAddAnnouncement.action?courseId=<s:property value="course.id"/>"
						class="add-td-a">添加公告</a></li>
				</ul>
			</div>
			<s:if test="%{announcementList.size() == 0}">
				<div class="t-homework">暂无公告</div>
			</s:if>
			    <s:iterator value="announcementList" >
			    <div class="announcement">
					<div class="announce-header">
						<span class="announce-title"><s:property value="title" /></span>
						<span class="announce-time"><s:property value="tname" /> | <s:property value="atime" /></span>
					</div>
					<div class="announce-body">
						<span><s:property value="content" /></span>
					</div>
				</div>
			    </s:iterator>
		</div>
	</div>
</body>
</html>