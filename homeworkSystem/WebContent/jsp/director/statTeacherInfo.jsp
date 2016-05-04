<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${ user.name }-统计</title>
</head>
<body>
	<s:include value="../director/header.jsp"></s:include>
	<div class="content">
        <div class="left-sidebar">
			<s:include value="../director/leftSidebar.jsp">
				<s:param name="leftTitle">教师统计</s:param>
			</s:include>
		</div>
		<div class="right-content">
            <div class="right-info-div">
            	<s:include value="../director/SMForm.jsp">
            		<s:param name="jumpType">statTeacherInfo</s:param>
            	</s:include>
            </div>
            <div class="right-info-div">
            	<div>
            		<span class="info-title">教师编号：</span>
            		<span><s:property value="%{user.id}"/></span>
            		<span class="info-title second-span">教师帐号：</span>
            		<span><s:property value="%{user.userId}"/></span>
            		<span class="info-title second-span">姓名：</span>
            		<span><s:property value="%{user.name}"/></span>
            	</div>
            </div>
            <div class="right-info-div"><span>教师课程信息</span></div>
            <table>
            <thead>
            	<tr>
                    <th>课程编号</th>
                    <th>课程号</th>
                    <th>课程名</th>
                    <th>教师</th>
                    <th>助教</th>
                    <th>作业数</th>
                    <th>查看详细</th>
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
            	<s:iterator value="teacherCourseList">
            		<tr>
            			<td>${ course.id }</td>
            			<td>${ course.courseId }</td>
            			<td>${ course.name }</td>
            			<td><s:iterator value="%{ course.teachers }">${ name } </s:iterator></td>
		                <td><s:iterator value="%{ course.assistant }" >${ name } </s:iterator></td>
            			<td>${ homeworkNum }</td>
            			<td><a href="showCourseStat.action?courseId=${course.id}" class="jump-td-a">查看</a></td>
            		</tr>
            	</s:iterator>
            </tbody>
            </table>
        </div>
    </div>
</body>
</html>