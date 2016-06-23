<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

			<div class="course-header-info">
	        	<div class="course-header-main" id="s-course-header-main">
	        		<span id="course-header-name"><s:property value="course.name"/></span>
	        		<br/>
	        		<span id="course-header-id"><s:property value="course.courseId"/></span>
	        	</div>
	        	<div class="course-header-left" id="s-course-header-left">
	        		<span><img alt="上课时间" src="../../image/cal-white.png" class="cal-img"><s:property value="course.time"/></span>
	        		<br/>
	        		<span><img alt="上课地点" src="../../image/map-white.png" class="map-img"><s:property value="course.location"/></span>
	         		<br/>
	         		<span><img alt="上课教师" src="../../image/tea-white.png" class="assi-img"><s:iterator value="course.teachers" ><a href="showMailView.action?courseId=<s:property value="course.id"/>&name=<s:property value="course.name"/>&userId=${ userId }&identity='student'">${ name }</a>  
	         			</s:iterator>
	         		</span>
	         		
	                <br/>
	                <span><img alt="上课助教" src="../../image/assi-white.png" class="assi-img"><s:iterator value="%{course.assistant}" ><a href="showMailView.action?courseId=<s:property value="course.id"/>&name=<s:property value="course.name"/>&userId=${ userId }&identity='assistant'">${ name }</a>  
	               		</s:iterator>
	               	</span>
	        		
	                <%-- <s:if test="%{course.semester.startTime.after(currentDate)}">
	                	<a href="assistantManagement.action?courseId=<s:property value="course.id"/>" class="add-td-a">管理助教</a>
	                </s:if> --%>
	        	</div>
	                <%-- <span><s:property value="course.semester.name"/></span> --%>
	       </div>
</body>
</html>