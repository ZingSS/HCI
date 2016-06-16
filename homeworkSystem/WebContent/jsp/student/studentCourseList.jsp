<%@page import="java.util.ArrayList"%>
<%@page import="nju.edu.homework.model.Course"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>我的课程列表</title>
</head>
<body>
	<s:include value="../student/header.jsp"></s:include>
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
				<div class="right-info-div">
					<span>助教课程</span>
				</div>
		        <s:if test="%{assistantCourse!=null}">
		        <div>
		            <table class="assistant-course">
		            <thead>
		            	<tr>
		                    <th>课程id</th>
		                    <th>课程编号</th>
		                    <th>课程名</th>
		                    <th>上课时间</th>
		                    <th>上课地点</th>
		                    <th>教师</th>
		                    <th>助教</th>
		                    <th>课程作业</th>
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
		            		<td></td>
		            	</tr>
		            </tfoot>
		            <tbody>
		            	<tr>
		                	<td><s:property value="assistantCourse.id"/></td>
		                    <td><s:property value="assistantCourse.courseId"/></td>
		                    <td><s:property value="assistantCourse.name"/></td>
		                    <td><s:property value="assistantCourse.time"/></td>
		                    <td><s:property value="assistantCourse.location"/></td>
		                    <td>
		                    	<s:iterator value="assistantCourse.teachers">
		                    	${ name }  
		                    	</s:iterator>
		                    </td>
		                    <td>
		                    	<s:iterator value="assistantCourse.assistant">${ name }  </s:iterator>
		                    </td>
		                    <td><a class="jump-td-a" href="showStudentsHomework.action?courseId=<s:property value="assistantCourse.id"/>&name=<s:property value="assistantCourse.name"/>">批改作业</a></td>
		             	</tr>
		            </tbody>
		            </table>
		        </div>
		        </s:if>
		        <div class="right-info-div">
					<span>学生课程</span>
				</div>
		        <div>
		            <table>
		            <thead>
		            	<tr>
		                    <th>课程id</th>
		                    <th>课程编号</th>
		                    <th>课程名</th>
		                    <th>上课时间</th>
		                    <th>上课地点</th>
		                    <th>教师</th>
		                    <th>助教</th>
		                    <th>课程作业</th>
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
		            		<td></td>
		            	</tr>
		            </tfoot>
		            <tbody>
		            	<s:iterator value="semesterCourseList" id="semester">
			            	<tr class="semester-tr">
			            		<td colspan="9"><s:property value="#semester.key"/></td>
			            	</tr>
			                <s:iterator value="#semester.value" >
					            <tr>
					                <td class="">${ id }</td>
					                <td>${ courseId }</td>
					                <td>${ name }</td>
					                <td class="">${ time }</td>
					                <td class="">${ location }</td>
					                <td class=""><s:iterator value="%{ teachers }">${ name } </s:iterator></td>
					                <td><s:iterator value="%{ assistant }" >${ name } </s:iterator></td>
					                <s:if test="%{currentDate.before(semester.startTime)}">
					                	<td>尚未开课</td>
					                </s:if>
					                <s:else>
					                	<td><a class="jump-td-a" href="showStudentHomeworkList.action?courseId=<s:property value="id"/>&name=<s:property value="name"/>&semester=<s:property value="#semester.key"/>">课程作业</a></td>	
					                </s:else>
					            </tr>
							</s:iterator>
						</s:iterator>
		            </tbody>
		            </table>
		        </div>
		</div>
       
    </div>

</body>
</html>