<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="s" uri="/struts-tags"%>
<% String localPath = request.getContextPath();%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>课程列表</title>
</head>
<body>
	<s:include value="../teacher/header.jsp"></s:include>
	<div class="content">
		<div class="left-sidebar">
			<div class="left-title"><span>我的课程</span></div>
			<hr/>
			<div>
            <ul class="left-list">
            	<li><a href="showTeacherCourseList.action">全部课程</a></li>
            </ul>
            <div class="left-sub-title">
            	<select>
            	<option>全部学期</option>
            	<s:iterator value="semesterCourseList" id="semesterSelect">
            		<option><s:property value="#semesterSelect.key"/></option>
            	</s:iterator>
            	</select>
            </div>
            	
        	</div>
		</div>
		<div class="right-content">
			<s:iterator value="semesterCourseList" id="semester">
				<div class="t-course-semester"><s:property value="#semester.key"/></div>
				<s:if test="%{#semester.value.size()==0}">
                	<div class="semester-no-course">该学期没有课程</div>
                </s:if>
	            <s:iterator value="#semester.value">
	            <a class="t-course-a" href="teacherCourse.action?courseId=<s:property value="id"/>&name=<s:property value="name"/>">
	            	<div class="t-course">
						<div class="t-course-header">
						<%-- <span>${ id }</span> --%>
						<span>${ courseId }</span>
						<br/>
						<span class="t-course-name">${ name }</span>
						</div>
						<div class="t-course-body">
							<img alt="上课时间" src="../../image/cal-black.png" class="cal-img"><span>${ time }</span>
							<br/>
							<span><img alt="上课地点" src="../../image/map-black.png" class="map-img">${ location }</span>
							<br/>
			                <img alt="教师" src="../../image/tea-black.png" class="tea-img"><span>学生人数：<s:property value ="%{student.size()}"/></span>
						</div>
					</div>
					</a>
<%-- 			        <td class="update-user"><a class="jump-td-a" href="showTeacherHomeworkList.action?courseId=<s:property value="id"/>&name=<s:property value="name"/>">课程作业</a></td>
 --%>	            	</s:iterator>
	            </s:iterator>
		</div>
    </div>

</body>
</html>