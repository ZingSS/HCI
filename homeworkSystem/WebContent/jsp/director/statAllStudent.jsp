<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>学生统计</title>
</head>
<body>
	<s:include value="../director/header.jsp"></s:include>
	<div class="content">
        <div class="left-sidebar">
			<s:include value="../director/leftSidebar.jsp">
				<s:param name="leftTitle">学生统计</s:param>
			</s:include>
		</div>
		<div class="right-content">
            <div class="right-info-div">
            	<s:include value="../director/SMForm.jsp">
            		<s:param name="jumpType">statAllStudents</s:param>
            	</s:include>
            </div>
            <table>
            <thead>
            	<tr>
            		<th>编号</th>
            		<th>学号</th>
            		<th>姓名</th>
            		<th class="td-center">助教课程数</th>
            		<th class="td-center">课程数</th>
            		<th>详细</th>
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
            	</tr>
            </tfoot>
            <tbody>
            	<s:iterator value="studentList">
            		<tr>
            			<td>${ user.id }</td>
            			<td>${ user.userId }</td>
            			<td>${ user.name }</td>
            			<td class="td-center">${ assistantCourseNum }</td>
            			<td class="td-center">${ courseNum }</td>
            			<td><a href="showStudentInfoStat.action?userId=<s:property value="%{user.id}"/>" class="jump-td-a">查看详细</a></td>
            		</tr>
            	</s:iterator>
            </tbody>
            </table>
        </div>
    </div>
</body>
</html>