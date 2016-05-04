<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加新学期</title>
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
			<form action="addSemester.action" method="post" id="add-semester-form">
			<div id="add-semester-title"><span>添加  <s:property value="newSemester"/></span></div>
			<s:hidden name="newSemester" value="%{newSemester}"/>
			<br/>
			<label>学期开始时间</label>
				<input type="text" placeholder="年份" name="beginYear">
                <input type="text" placeholder="月份" name="beginMonth">
                <input type="text" placeholder="日期" name="beginDay">
            <br/>
			<label>学期结束时间</label>
				<input type="text" placeholder="年份" name="endYear">
                <input type="text" placeholder="月份" name="endMonth">
                <input type="text" placeholder="日期" name="endDay">
			<br/>	
			<button class="cancel-btn"><a href="courseList.action">取消</a></button>
			<button type="submit" class="submit-btn">新建</button>
		</form>
		</div>
	</div>

</body>
</html>