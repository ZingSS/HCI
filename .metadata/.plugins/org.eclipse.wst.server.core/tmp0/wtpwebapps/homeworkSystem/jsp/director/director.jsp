<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<% String localPath = request.getContextPath();%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>教学统计</title>
</head>
<body>
	<s:include value="../director/header.jsp"></s:include>
	 <div class="content">
		<div class="left-sidebar">
			<s:include value="../director/leftSidebar.jsp">
				<s:param name="leftTitle">课程统计</s:param>
			</s:include>
		</div>
		<div class="right-content">
            <div class="right-info-div">
            	<s:include value="../director/SMForm.jsp">
            		<s:param name="jumpType">statAllCourses</s:param>
            	</s:include>
            	<span class="info-title">课程数：</span>
            	<span><s:property value="%{courseList.size()}"/></span>
            </div>
            <table>
            <thead>
             	<tr>
                    <th>课程编号</th>
                    <th>课程号</th>
                    <th>课程名</th>
                    <th>教师</th>
                    <th>助教</th>
                    <th>作业数</th>
                    <th>查看详情</th>
                </tr>
            </thead>
            <tfoot>
            	<tr>
            		<td></td>
            		<td></td>
            		<td></td>
            		<td></td>
            		<td></td>
            		<td></td>
            		<td></td>
				</tr>
            </tfoot>
            <tbody>
				<s:iterator value="courseList" >
		            <tr>
		                <td class="course-list-id">${ course.id }</td>
		                <td>${ course.courseId }</td>
		                <td>${ course.name }</td>
		                <td><s:iterator value="%{ course.teachers }">${ name } </s:iterator></td>
		                <td><s:iterator value="%{ course.assistant }" >${ name } </s:iterator></td>
		                <td>${ homeworkNum }</td>
		                <td><a href="showCourseStat.action?courseId=${course.id}" class="jump-td-a">查看详情</a></td>
		            </tr>
	            </s:iterator>
	       	</tbody>
            </table>
		</div>

    </div>
  

</body>
</html>