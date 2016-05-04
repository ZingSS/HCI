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
		<div class="left-sidebar">
			<div class="left-title"><span>我的课程</span></div>	
			<hr/>
			<div>
            <ul class="left-list">
            	<li><a href="showTeacherCourseList.action">所有课程</a></li>
            </ul>
            <div class="left-sub-title"><span><s:property value="course.name"/></span></div>
	            <ul class="left-sub-list">
	                <li><a href="teacherCourse.action?courseId=<s:property value="course.id"/>&name=<s:property value="course.name"/>">课程学生</a></li>
	                <li><a href="showTeacherHomeworkList.action?courseId=<s:property value="course.id"/>&name=<s:property value="course.name"/>">课程作业</a></li>
	            </ul>
        	</div>
		</div>
		<div class="right-content">
			<form action="addHomework.action" method="post" enctype="multipart/form-data">
            <div>
                <span>为课程<s:property value="courseName"/>添加作业</span>
                <s:hidden name="courseId" value="%{courseId}"/>
            </div>
            <div>
                <label>作业名</label>
                <input type="text" name="homework.name">
            </div>
            <div>
                <label>作业描述</label>
                <textarea name="homework.description"></textarea>
            </div>
            <div>
            	<span>${FieldErrors.errorMessage}</span></br>
            	<span><s:property value="errorMessage"/></span></br>
                <label>学生提交截止日期</label>
                <input placeholder="年份" name="sddlYear">
                <input placeholder="月份" name="sddlMonth">
                <input placeholder="日期" name="sddlDay">
            </div>
            <div>
                <label>助教批改截止日期</label>
                <input placeholder="年份" name="addlYear">
               	<input placeholder="月份" name="addlMonth">
                <input placeholder="日期" name="addlDay">
            </div>
            <div>
                <label>作业格式</label>
                <input type="text" name="homework.fileType">
            </div>
            <div>
                <label>附件</label>
                <input type="file" name="file">
            </div>
            <button type="button">取消</button>
            <button type="submit">添加</button>
        </form>
		</div>
    </div>
</body>
</html>