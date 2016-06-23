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
		<div class="left-sidebar">
			<div class="left-title">
				<span>助教课程</span>
			</div>
			<hr />
			<div>
				<ul class="left-list">
					<li><a href="showStudentCourseList.action">所有课程</a></li>
				</ul>
				<div class="left-sub-title">
					<a
						href="showStudentsHomework.action?courseId=<s:property value="course.id"/>&name=<s:property value="course.name"/>">
						<span><s:property value="course.name" /></span>
					</a>
				</div>
				<ul class="left-sub-list">
					<li><a
						href="showStudentsHomework.action?courseId=<s:property value="#request.course.id"/>&name=<s:property value="#request.course.name"/>">作业</a></li>
					<li><a  id="an"
						href="asAddAnnouncement.action?courseId=<s:property value="course.id"/>&name=<s:property value="course.name"/>">公告</a></li>
				</ul>
				 <script type="text/javascript">
						var li = document.getElementById("an");
						li.style.backgroundColor = "#e7e7e7";
					</script>
			</div>
		</div>
		<div class="right-content">
			<%-- <div><a href="exportCourseExcel.action?courseId=<s:property value="course.id"/>">生成课程Excel文件</a></div> --%>
			<s:include value="../student/courseHeader.jsp"></s:include>
			<div class="t-homework">
				<ul>
					<li>
					<s:if test="%{announcementList.size() == 0}">
						<span>暂无公告，可以 </span>
					</s:if>
					<a href="toAddAnnouncement.action?courseId=<s:property value="course.id"/>" class="a-button">添加公告</a>
					</li>
				</ul>
			</div>
			<s:iterator value="announcementList">
				<div class="announcement">
					<div class="announcement-body">
						<div class="announce-header">
							<span class="announce-title"><s:property value="title" /></span>
							<span class="announce-time"><s:property value="tname" />
								| <s:property value="atime" /></span>
						</div>
						<div class="announce-body">
							<span><s:property value="content" /></span>
						</div>
					</div>
				</div>
			</s:iterator>
		</div>
	</div>
</body>
</html>