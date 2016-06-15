<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="s" uri="/struts-tags"%>
<% String localPath = request.getContextPath();%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>课程列表</title>
</head>
<body>
	<s:include value="../teacher/header.jsp"></s:include>
	<div class="content">
		<div class="left-sidebar">
			<div class="left-title"><span>我的课程</span></div>
			<hr/>
			<div>
            <ul class="left-list">
            	<li><a href="showTeacherCourseList.action">全部课程</a></li>
            </ul>
            <div class="left-sub-title">
            	<select>
            	<option>全部学期</option>
            	<s:iterator value="semesterCourseList" id="semesterSelect">
            		<option><s:property value="#semesterSelect.key"/></option>
            	</s:iterator>
            	</select>
            </div>
            	
        	</div>
		</div>
		<div class="right-content">
			<table>
	            <!--把学期以一行的形式分隔开-->
	            <tr>
	            	<th>编号</th>
	                <th>课程号</th>
	                <th>课程名</th>
	                <th>上课时间</th>
	                <th>上课地点</th>
	                <th>助教</th>
	                <th>学生数</th>
	                <th>课程管理</th>
	                <th>作业管理</th>
	            </tr>
	            <s:iterator value="semesterCourseList" id="semester">
	            	<tr class="semester-tr">
	            		<td colspan="9"><s:property value="#semester.key"/></td>
	            	</tr>
	            	<s:iterator value="#semester.value">
	            		<tr>
	            			<td class="">${ id }</td>
			                <td>${ courseId }</td>
			                <td>${ name }</td>
			                <td class="">${ time }</td>
			                <td class="">${ location }</td>
			                <td class="">
			                	<s:iterator value="%{assistant}" >
			                	<span>${ name }</span>
			                	</s:iterator>
			                </td>
			                <td><s:property value ="%{student.size()}"/></td>
			                <td><a class="jump-td-a" href="teacherCourse.action?courseId=<s:property value="id"/>&name=<s:property value="name"/>">进入课程</a></td>
			                <td class="update-user"><a class="jump-td-a" href="showTeacherHomeworkList.action?courseId=<s:property value="id"/>&name=<s:property value="name"/>">课程作业</a></td>
			            </tr>
	            	</s:iterator>
	            </s:iterator>
	        </table>
		</div>
    </div>

</body>
</html>