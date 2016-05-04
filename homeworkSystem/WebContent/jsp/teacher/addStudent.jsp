<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@page import="nju.edu.homework.model.User"%>
<%@page import="java.util.List"%>
<% String localPath = request.getContextPath();

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><s:property value="courseName" />添加学生</title>
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
			<div>
<%--         	<div><a href="teacherCourse.action?courseId=<s:property value="courseId"/>&name=<s:property value="courseName"/>">返回课程</a></div>
 --%>            <form action="getStudentList.action" method="post" class="fuzzy-form">
            	<s:hidden name="courseId" value="%{courseId}"/>
            	<s:hidden name="page" value="addStudent" /> 
            	<label>学生学号</label>
	            <input type="text" id="student-userId" name="studentId">
	            <label>学生姓名</label>
	            <input type="text" id="student-name" name="name" >
	            <button type="submit" class="submit-btn">查找</button>
            </form>
        </div>

        <div>
            <table>
                <tr>
                    <th>学号</th>
                    <th>姓名</th>
                    <th>本课程学生</th>
                </tr>
                <s:iterator value="studentList" >
			            <tr class="student-line">
			            	<input type="hidden" value="${id}" class="hidden-id">
			                <td>${ userId }</td>
			                <td>${ name }</td>
			               <s:if test="%{assistantCourseId == course.id}">
			                	<td>本课程助教</td>
			               </s:if>
			               <s:elseif test="%{isIn}">
			               		<td class='remove-student-btn'><a class='delete-td-a'>移除</a></td>
			               </s:elseif>
			               <s:else>
			               		<td class='add-student-btn'><a class='add-td-a'>添加</a></td>
			               </s:else>
			            </tr>
					</s:iterator>
            </table>
        </div>
		</div>
    </div>
<script type="text/javascript" src="<%=localPath %>/js/jquery.js" charset="utf-8"></script>
<script type="text/javascript" src="<%=localPath %>/js/student.js" charset="utf-8"></script>
</body>
</html>