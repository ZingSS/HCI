<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${ user.name }-个人统计</title>
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
            		<s:param name="jumpType">statStudentInfo</s:param>
            	</s:include>
            </div>
            <div class="right-info-div">
            	<div>
            		<span class="info-title">学生编号：</span>
            		<span><s:property value="%{user.id}"/></span>
            		<span class="info-title second-span">学生学号：</span>
            		<span><s:property value="%{user.userId}"/></span>
            		<span class="info-title second-span">姓名：</span>
            		<span><s:property value="%{user.name}"/></span>
            	</div>
            </div>
            <s:if test="%{assistantCourseList.size()!=0}">
            <div class="right-info-div"><span>助教课程信息</span></div>
            <table>
            <thead>
            	<tr>
                    <th rowspan="2">课程编号</th>
                    <th rowspan="2">课程号</th>
                    <th rowspan="2">课程名</th>
                    <th rowspan="2">教师</th>
                    <th rowspan="2">助教</th>
                    <th colspan="3" class="td-center">作业数</th>
                    <th rowspan="2" class="td-center">重新批改数</th>
                </tr>
                <tr>
               		<th class="td-center">未截止</th>
                    <th class="td-center">已截止</th>
                    <th class="td-center">已公布</th>
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
            		<td></td>
            	</tr>
            </tfoot>
            <tbody>
            	<s:iterator value="assistantCourseList">
            		<tr>
            			<td>${ course.id }</td>
            			<td>${ course.courseId }</td>
            			<td>${ course.name }</td>
            			<td><s:iterator value="%{ course.teachers }">${ name } </s:iterator></td>
		                <td><s:iterator value="%{ course.assistant }" >${ name } </s:iterator></td>
            			<td class="td-center">${ homeworkNum.commitNum }</td>
            			<td class="td-center">${ homeworkNum.overNum }</td>
            			<td class="td-center">${ homeworkNum.passNum }</td>
            			<td class="td-center"><a>${ reCorrect }</a></td>
            		</tr>
            	</s:iterator>
            </tbody>
            </table>
            </s:if>
            
            
            <s:if test="%{studentCourseList.size()!=0}">
            	<div class="right-info-div"><span>学生课程信息</span></div>
            	<table>
            <thead>
            	<tr>
                    <th rowspan="2">课程编号</th>
                    <th rowspan="2">课程号</th>
                    <th rowspan="2">课程名</th>
                    <th rowspan="2">教师</th>
                    <th rowspan="2">助教</th>
                    <th colspan="3" class="td-center">作业数</th>
                    <th rowspan="2" class="td-center">按时提交数</th>
                    <th rowspan="2">已公布平均分</th>
                </tr>
                <tr>
               		<th class="td-center">未截止</th>
                    <th class="td-center">已截止</th>
                    <th class="td-center">已公布</th>
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
            		<td></td>
            		<td></td>
            	</tr>
            </tfoot>
            <tbody>
            	<s:iterator value="studentCourseList">
            		<tr>
            			<td>${ course.id }</td>
            			<td>${ course.courseId }</td>
            			<td>${ course.name }</td>
            			<td><s:iterator value="%{ course.teachers }">${ name } </s:iterator></td>
		                <td><s:iterator value="%{ course.assistant }" >${ name } </s:iterator></td>
            			<td class="td-center">${ homeworkNum.commitNum }</td>
            			<td class="td-center">${ homeworkNum.overNum }</td>
            			<td class="td-center">${ homeworkNum.passNum }</td>
            			<td class="td-center"><a>${ submit }</a></td>
            			<td>${ average }</td>
            		</tr>
            	</s:iterator>
            </tbody>
            </table>
            </s:if>
            <s:else>
            <div class="right-info-div"><span>该学期尚未有课程</span></div>
            </s:else>
        </div>
    </div>

</body>
</html>