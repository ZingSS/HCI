<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.util.ArrayList"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@page import="nju.edu.homework.model.User"%>
<%@page import="nju.edu.homework.model.Course"%>
<%@page import="java.util.List"%>
<% String localPath = request.getContextPath();

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><s:property value="courseName"/>-助教管理</title>
</head>
<body>
	<s:include value="../teacher/header.jsp"></s:include>
	<div class="content">
		<s:include value="../teacher/courseSide.jsp"></s:include>
		<div class="right-content">
        <div>
            <form action="getStudentList.action" method="post" class="left-form fuzzy-form">
            	<s:hidden name="courseId" value="%{courseId}"/>
            	<s:hidden name="page" value="manageAssistant" /> 
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
                    <th>本课程助教</th>
                </tr>
                <s:iterator value="studentList" >
			            <tr class="student-line">
			            	<input type="hidden" value="${id}" class="hidden-id">
			                <td>${ userId }</td>
			                <td>${ name }</td>
			                 <s:if test="%{assistantCourseId == course.id}">
			                	<td class='remove-assistant-btn'><a class='delete-td-a'>移除</a></td>
			               </s:if>
			               <s:elseif test="%{assistantCourseId != 0 && assistantCourseId != course.id}">
			               		<td>别课程助教</td>
			               </s:elseif>
			               <s:elseif test="%{isIn}">
			               		<td>本课程学生</td>
			               </s:elseif>
			               <s:else>
			               		<td class='add-assistant-btn'><a class='add-td-a'>添加</a></td>
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