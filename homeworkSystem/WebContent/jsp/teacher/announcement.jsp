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
			<s:include value="../teacher/courseHeader.jsp"></s:include>

			<div class="t-homework">
				<ul>
					<li>
					<s:if test="%{announcementList.size() == 0}">
						<span>暂无公告，可以 </span>
					</s:if>
					<a href="toAddAnnouncement.action?courseId=<s:property value="course.id"/>" class="a-button">添加公告</a></li>
				</ul>
			</div>
			    <s:iterator value="announcementList" >
			    <div class="announcement">
			    	<div class="announcement-body">
						<div class="announce-header">
							<span class="announce-title"><s:property value="title" /></span>
							<span class="announce-time"><s:property value="tname" /> | <s:property value="atime" /></span>
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