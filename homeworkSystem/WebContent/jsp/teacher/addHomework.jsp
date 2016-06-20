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
	<s:include value="../teacher/header.jsp"></s:include>
	<div class="content">
		<s:include value="../teacher/courseSide.jsp"></s:include>
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
	         		<s:iterator value="%{course.assistant}" >
		                <span>${ name }</span>
		            </s:iterator>
	                <%-- <s:if test="%{course.semester.startTime.after(currentDate)}">
	                	<a href="assistantManagement.action?courseId=<s:property value="course.id"/>" class="add-td-a">管理助教</a>
	                </s:if> --%>
	        	</div>
	                <%-- <span><s:property value="course.semester.name"/></span> --%>
	        </div>
			<form id="add-h-form" action="addHomework.action" method="post" enctype="multipart/form-data">
            <%-- <div>
                <span>为课程<s:property value="courseName"/>添加作业</span>
                <s:hidden name="courseId" value="%{courseId}"/>
            </div> --%>
            <div class="add-h-first">
                <div id="add-h-name">
                	<label>作业标题</label>
                	<input type="text" name="homework.name">
                </div>
                <div id="add-h-type">
	                <label>作业格式</label>
	                <input type="text" name="homework.fileType">
	            </div>
            </div>
            <div id="add-h-des">
                <label>作业描述</label>
                <textarea name="homework.description"></textarea>
            </div>
            <div id="add-h-file">
                <label>作业附件</label>
                <input type="file" name="file">
            </div>
            <div id="add-h-hr">
            	<span>———————— 截止日期 ————————</span>
            </div>
            <div id="add-h-ddl">
	            <div id="add-h-stu-ddl">
	                <label>学生提交</label>
	                <input type="text">
	                <!-- <input placeholder="年份" name="sddlYear">
	                <input placeholder="月份" name="sddlMonth">
	                <input placeholder="日期" name="sddlDay"> -->
	            </div>
	            <div id="add-h-assi-ddl">
	                <label>助教批改</label>
	                <input type="text">
	                <!-- <input placeholder="年份" name="addlYear">
	               	<input placeholder="月份" name="addlMonth">
	                <input placeholder="日期" name="addlDay"> -->
	            </div>
	        </div>
            
            <div id="add-h-btns">
            	<button type="button"><a class="a-btn-cancel">取消</a></button>
            	<button type="submit"><a class="a-btn-confirm">添加</a></button>
            </div>
        </form>
		</div>
    </div>
</body>
</html>