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
			<div class="left-sidebar">
				<div class="left-title"><span>助教课程</span></div>	
				<hr/>
				<div>
	            <ul class="left-list">
	            	<li><a href="showStudentCourseList.action">所有课程</a></li>
	            </ul>
	            <div class="left-sub-title">
	            	<a href="showStudentsHomework.action?courseId=<s:property value="course.id"/>&name=<s:property value="course.name"/>">
	            		<span><s:property value="course.name"/></span>
	            	</a>
	            </div>
	             <ul class="left-sub-list">
	                <li><a id="hw" href="showStudentsHomework.action?courseId=<s:property value="#request.course.id"/>&name=<s:property value="#request.course.name"/>">作业</a></li>
	            	 <li><a href="asGetAnnouncement.action?courseId=<s:property value="course.id"/>&name=<s:property value="course.name"/>">公告</a></li>
	            </ul>
	             <script type="text/javascript">
						var li = document.getElementById("hw");
						li.style.backgroundColor = "#e7e7e7";
					</script>
	        	</div>
			</div>

</body>
</html>