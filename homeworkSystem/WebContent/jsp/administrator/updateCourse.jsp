<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><s:property value="course.name" />-修改信息</title>
</head>
<body>
	<s:include value="../administrator/header.jsp"></s:include>
	<div class="content">
	<div class="left-sidebar">
			<div class="left-title"><span>课程管理</span></div>
			<div class="left-btn" id="to-add-course">
				<a href="addCourse.action">添加课程</a>
			</div>		
			<hr/>
			<div class="semester-search">
	            <form action="getCourseBySemester.action" method="post">
	            	<s:select name="semester" list="semesterList" id="semester-list">
	            	</s:select>
	                <button type="submit" class="search-btn">查询</button>	
	                <s:label id="semester-selected" name="semesterSelected"></s:label>	
	                <div class="">
					<a href="jumpToAddSemester.action" id="to-add-semester">添加学期</a>
				</div>
	            </form>
	            <hr/>
	        </div>
		</div>
		<div class="right-content">
			<form action="updateCourse.action" method="post" id="update-course-form">
				<s:hidden name="vo.id" value="%{course.id}"/>
				<label>课程学期</label><span> <s:property value="course.semester.name"/></span><br/>
				<div class="course-id">
	                <label>课程编号</label>
	                <input type="text" name="vo.courseId" value="${course.courseId}">
	            </div>
	            <div class="course-name">
	                <label>课程名称</label>
	                <input type="text" name="vo.name" value="${course.name}">
	            </div>
				<div class="course-type">
					<label>课程性质</label>
	                <select name="vo.type" value="${course.type}">
	                    <option value="通修">通修</option>
	                    <option value="选修">选修</option>
	                    <option value="平台">平台</option>
	                </select>
	                <label>学分</label>
	                <select name="vo.credit">
	                    <option value="1">1.0</option>
	                    <option value="2">2.0</option>
	                    <option value="3">3.0</option>
	                    <option value="4">4.0</option>
	                    <option value="5">5.0</option>
	                </select>
				</div>
				<hr/>
	            <div class="course-time">
	                <label>上课时间</label>
	                <select name="day">
	                        <option value="周一">周一</option>
	                        <option value="周二">周二</option>
	                        <option value="周三">周三</option>
	                        <option value="周四">周四</option>
	                        <option value="周五">周五</option>
	                </select>
	                第<input type="text" name="begin" value="${ begin }"> - <input type="text" name="end" value="${ end }">节
	            </div>
	            <div class="course-loc">
	                <label>上课地点</label>
	                <input type="text" name="vo.position" value="${course.location}">
	            </div>
	            <button type="button" class="cancel-btn"><a href="courseList.action">取消</a></button>
	            <button type="submit" class="submit-btn">修改</button>
			</form>
		</div>
		
	</div>

</body>
</html>