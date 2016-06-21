<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加作业</title>
</head>
<body>
	<s:include value="../student/header.jsp"></s:include>
	<div class="content">
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
	                <li><a href="showStudentsHomework.action?courseId=<s:property value="#request.course.id"/>&name=<s:property value="#request.course.name"/>">作业</a></li>
	            	 <li><a id="an" href="asAddAnnouncement.action?courseId=<s:property value="course.id"/>&name=<s:property value="course.name"/>">公告</a></li>
	            </ul>
	            <script type="text/javascript">
						var li = document.getElementById("an");
						li.style.backgroundColor = "#e7e7e7";
					</script>
	        	</div>
			</div>
		<div class="right-content">
			<div class="course-header-info">
	        	<div class="course-header-main">
	        		<span id="course-header-name"><s:property value="course.name"/></span>
	        		<br/>
	        		<span id="course-header-id"><s:property value="course.courseId"/></span>
	        	</div>
	        	<div class="course-header-left">
	        		<span><s:property value="course.time"/></span>
	        		<br/>
	        		<span><s:property value="course.location"/></span>
	         		<br/>
	        	</div>
	                <%-- <span><s:property value="course.semester.name"/></span> --%>
	        </div>
			<form id="add-h-form" action="asAddAnnouncement.action" method="post" enctype="multipart/form-data">
                <s:hidden name="courseId" value="%{courseId}"/>
            <%-- <div>
                <span>为课程<s:property value="courseName"/>添加作业</span>
            </div> --%>
            <div class="add-h-first">
                <div id="add-h-name">
                	<label>公告标题</label>
                	<input type="text" name="title">
                </div>
            </div>
            <div id="add-h-des">
                <label>公告内容</label>
                <textarea name="content" style="height:200px"></textarea>
            </div>
          
            
            <div id="add-h-btns">
            	<button type="button"><a  class="a-btn-cancel" href="asGetAnnouncement.action?courseId=<s:property value="course.id"/>&name=<s:property value="course.name"/>">取消</a></button>
            	<button type="submit"><a class="a-btn-confirm">添加</a></button>
            </div>
        </form>
		</div>
    </div>
</body>
</html>