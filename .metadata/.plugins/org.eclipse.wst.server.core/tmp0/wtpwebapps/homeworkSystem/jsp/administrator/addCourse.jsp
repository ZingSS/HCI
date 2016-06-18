<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<% String localPath = request.getContextPath();%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>新建课程</title>
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
				</div>
	            </form>
	            <hr/>
	        </div>
		</div>
		<div class="right-content">
			<form action="addOneCourse.action" method="post" id="add-course-form">
        	<div class="course-semester">
        		<label>学期</label>
				<s:if test="%{semeserList.isEmpty()}">
	        		<span>无可添加学期，<a href="jumpToAddSemester.action">添加学期</a></span>
        		</s:if>
        		<s:else>		
        			<s:select name="semester" list="activeSemesterList">
	            	</s:select>
        		</s:else>
<!--             	<button type="button" class="add-semester">添加学期</button>
 -->        	</div>
            <div class="course-id">
                <label>课程编号</label>
                <input type="text" name="course.courseId">
            </div>
            <div class="course-name">
                <label>课程名称</label>
                <input type="text" name="course.name">
            </div>
            <div class="course-type">
                <label>课程性质</label>
                <select name="course.type">
                    <option value="通修">通修</option>
                    <option value="选修">选修</option>
                    <option value="平台">平台</option>
                </select>
                <label>学分</label>
                <select name="course.credit">
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
                    第<input type="text" name="begin"> - <input type="text" name="end">节
            </div>
            <div class="course-loc">
                <label>上课地点</label>
                <input type="text" name="course.location">
            </div>

           	<button type="button" class="cancel-btn"><a href="courseList.action">取消</a></button>
            <button type="submit" class="submit-btn">保存并返回</button>

        </form>
		</div>
    </div>
    
<script type="text/javascript" src="<%=localPath %>/js/jquery.js" charset="utf-8"></script>
<script type="text/javascript" src="<%=localPath %>/js/course.js" charset="utf-8"></script>

</body>
</html>