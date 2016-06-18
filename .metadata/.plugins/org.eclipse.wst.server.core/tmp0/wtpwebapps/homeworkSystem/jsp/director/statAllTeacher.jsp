<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>教师统计</title>
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
            		<s:param name="jumpType">statAllTeachers</s:param>
            	</s:include>
            </div>
            <table>
            <thead>
            	<tr>
            		<th>编号</th>
            		<th>职工号</th>
            		<th>姓名</th>
            		<th>课程数</th>
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
            	</tr>
            </tfoot>
            <tbody>
            	<s:iterator value="teacherList">
            		<tr>
            			<td>${ user.id }</td>
            			<td>${ user.userId }</td>
            			<td>${ user.name }</td>
            			<td>${ courseNum }</td>
            			<td><a href="showTeacherInfoStat.action?userId=<s:property value="%{user.id}"/>" class="jump-td-a">查看</a></td>
            		</tr>
            	</s:iterator>
            </tbody>
            </table>
        </div>
    </div>
</body>
</html>