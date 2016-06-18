<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="s" uri="/struts-tags"%>
<% String localPath = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加教师</title>
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
			<a href="courseList.action" class="return-a"> 返回课程列表</a>
			<div class="right-info-div">
		        <div>
		            <span class="info-title">课程号：</span><span id="course-id" class="into-content"><s:property value="course.id"/></span>
		        </div>
		        <div>
		            <span class="info-title">课程编号：</span><span id="course-courseId" class="into-content"><s:property value="course.courseId"/></span>
		        </div>
		        <div>
		            <span class="info-title">课程名：</span><span id="course-name" class="into-content"><s:property value="course.name"/></span>
		        </div>
		        <div>
		            <span class="info-title">上课时间：</span><span id="course-time" class="into-content"><s:property value="course.time"/></span>
		        </div>
		        <div>
		            <span class="info-title">上课地点：</span><span id="course-location" class="into-content"><s:property value="course.location"/></span>
		        </div>
			</div>
	
	        <table>
	            <tr>
	                <th>编号</th>
	                <th>帐号</th>
	                <th>姓名</th>
	                <th>添加</th>
	            </tr>
	            	<%
	            		int i = 0;
	            		List<Boolean> isIn = (List<Boolean>)request.getAttribute("isInCourse");
	            	%>
	            	<s:iterator value="teacherList" >
			            <tr class="add-teacher-line">
			                <td class="teacher-id">${ id }</td>
			                <td class="teacher-userid">${ userId }</td>
			                <td class="teacher-name">${ name }</td>
			                <% if(isIn.get(i)){%>
			                	<td class="remove-teacher"><a class="delete-td-a">移除</a></td>
			                <%	} else{%>
			                	<td class="add-teacher"><a class="add-td-a">添加</a></td>
			                <%} i++;%>
			            </tr>
		            </s:iterator>
	        </table>
		</div>
	
		
    </div>
    
<script type="text/javascript" src="<%=localPath %>/js/jquery.js" charset="utf-8"></script>
<script type="text/javascript" src="<%=localPath %>/js/course.js" charset="utf-8"></script>

</body>
</html>