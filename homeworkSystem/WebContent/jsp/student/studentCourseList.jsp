<%@page import="java.util.ArrayList"%>
<%@page import="nju.edu.homework.model.Course"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>我的课程列表</title>
</head>
<body>
	<s:include value="../student/header.jsp"></s:include>
	<div class="content">
		<s:form action="showStudentTermCourseList.action" method="post">
			<div class="left-sidebar">
				<div class="left-title">
					<span>我的课程</span>
				</div>
				<hr />
				<div>
					<ul class="left-list">
						<li><a href="showStudentCourseList.action">全部课程</a></li>
					</ul>
					<div class="left-sub-title">
						<select id="selectTerm" name="selectTerm" onchange="submit();">
							<option value="all">全部学期</option>
							<s:iterator value="semesterList" id="semesterSelect">
								<option value=<s:property/>><s:property /></option>
							</s:iterator>
						</select>
						<script type="text/javascript">
							var termS = "${requestScope.selectTerm}";
							if (termS != '') {
								document.getElementById('selectTerm').value = termS;
							}
						</script>
					</div>

				</div>
			</div>
		</s:form>
		<div class="right-content">
			<s:if test="%{assistantCourse!=null}">
				<div id="assistant-course">
					<div id="a-course-title">助教课程</div>
					<a class="jump-td-a"
						href="showStudentsHomework.action?courseId=<s:property value="assistantCourse.id"/>&name=<s:property value="assistantCourse.name"/>">
						<div id="a-course-info">
							<div id="a-course-header">
								<%-- <s:property value="assistantCourse.id"/> --%>
								<span id="a-course-id"><s:property
										value="assistantCourse.courseId" /></span> 
								<span id="a-course-name"><s:property value="assistantCourse.name" /></span>
								
							</div>
							<div id="a-course-body">
								<span><img alt="上课时间" src="../../image/cal-black.png"class="cal-img">
								<s:property value="assistantCourse.time" /></span> 
								<span><imgalt="上课地点" src="../../image/map-black.png" class="map-img">
								<s:property value="assistantCourse.location" /></span> 
								<span><imgalt="教师" src="../../image/tea-black.png" class="tea-img">
								<s:iterator value="assistantCourse.teachers">${ name }  </s:iterator></span>
								

							</div>
						</div>
					</a>
				</div>
			</s:if>
			<s:iterator value="semesterCourseList" id="semester">
				<div class="t-course-semester">
					<s:property value="#semester.key" />
				</div>
				<s:if test="%{#semester.value.size() ==0}">
					<div class="semester-no-course">该学期没有课程</div>
				</s:if>
				<s:iterator value="#semester.value">
					<a class="jump-td-a"
						href="showStudentHomeworkList.action?courseId=<s:property value="id"/>&name=<s:property value="name"/>">
						<div class="t-course">
							<div class="t-course-header">
								<%-- <span>${ id }</span> --%>
								<span>${ courseId }</span> <br /> 
	        					<s:if test="%{name.length()>9}"><span class="t-course-name"><s:property value="name.substring(0,9)"/>...</span></s:if>
	        					<s:else><span class="t-course-name">${ name }</span></s:else>
							</div>
							<div class="t-course-body">
								<img alt="上课时间" src="../../image/cal-black.png" class="cal-img"><span>${ time }</span>
								<br /> 
								<img alt="上课地点" src="../../image/map-black.png"class="map-img">
								<span>${ location }</span> 
								<br /> 
								<img alt="教师" src="../../image/tea-black.png" class="tea-img"><span><s:iterator value="%{ teachers }">${ name } </s:iterator></span>
								
							</div>
						</div>
					</a>
					<%-- 			        <td class="update-user"><a class="jump-td-a" href="showTeacherHomeworkList.action?courseId=<s:property value="id"/>&name=<s:property value="name"/>">课程作业</a></td>
 --%>
				</s:iterator>
			</s:iterator>
		</div>

	</div>

</body>
</html>