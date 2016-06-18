<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<% String localPath = request.getContextPath();%>
<%@page import="nju.edu.homework.util.Common"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><s:property value="course.name"/> - 课程统计</title>
</head>
<body>	
	<s:include value="../director/header.jsp"></s:include>
	<div class="content">
		<div class="left-sidebar">
			<ul class="left-list">
            	<li><a href="showInitLastMonth.action">返回学期</a></li>
            </ul>
			<div class="left-sub-title"><span><s:property value="course.name"/></span></div>
	            <ul class="left-sub-list">
	                <li><a href="showCourseStat.action?courseId=<s:property value="%{course.id}"/>">作业统计</a></li>
	                <li><a href="showCourseStudentStat.action?courseId=<s:property value="%{course.id}"/>">助教学生</a></li>
	            </ul>
		</div>
		<div class="right-content">
			<div class="right-info-div">
				<s:include value="../director/SMForm.jsp">
					<s:param name="jumpType">statCourseHomework</s:param>
				</s:include>
			</div>
			<s:include value="../user/courseInfo.jsp"></s:include>

        <div>
            <table>
                <tr>
                    <th>作业编号</th>
                    <th>作业标题</th>
                    <th>布置日期</th>
                    <th>截止日期</th>
                    <th>发布时间</th>
                    <th>最高分</th>
                    <th>最低分</th>
                    <th>平均分</th>
                </tr>
                <s:iterator value="homeworkList" >
		            <tr>
		                <td>${ homework.id }</td>
		                <td>${ homework.name }</td>
		                <td>${ homework.createdTime }</td>
		                <td>${ homework.studentDDL }</td>
		                <s:if test="%{homework.state != 'pass'}">
			                <td>未发布</td>
			                <td></td>
			                <td></td>
			                <td></td>
		                </s:if>
		                <s:else>
		                	<td>${ homework.publishedTime }</td>
		                	<td>${ heighest }</td>
		              		<td>${ lowest }</td>
		                	<td>${ average }</td>
		                </s:else>
		            </tr>
	            </s:iterator>
            </table>
        </div>

		</div>

    </div>
</body>
</html>