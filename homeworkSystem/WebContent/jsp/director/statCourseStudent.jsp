<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><s:property value="%{course.name}"/>-学生助教统计</title>
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
		                <li><a href="showCourseStat.action?courseId=<s:property value="%{course.id}"/>">助教学生</a></li>
		            </ul>
			</div>
			<div class="right-content">
				<div class="right-info-div">
					<s:include value="../director/SMForm.jsp">
						<s:param name="jumpType">statCourseStudent</s:param>
					</s:include>
				</div>
				<s:include value="../user/courseInfo.jsp"></s:include>
				<div class="right-info-div"><span>助教信息</span></div>     
	        <table>
	                <tr>
	                    <th>编号</th>
	                    <th>学号</th>
	                    <th>姓名</th>
	                    <th class="td-center">按时批改次数</th>
	                    <th class="td-center">重新批改次数</th>
	                </tr>
	                <s:iterator value="assistants" >
			            <tr>
			                <td>${ user.id }</td>
			                <td>${ user.userId }</td>
			                <td>${ user.name }</td>
			                <td class="td-center"><s:property value="%{passNumber}"/></td>
			                <td class="td-center">${ reCorrect }</td>
			            </tr>
		            </s:iterator>
	            </table>
	       <div class="right-info-div"><span>学生信息</span></div>     
			<table>
	                <tr>
	                    <th>编号</th>
	                    <th>学号</th>
	                    <th>姓名</th>
	                    <th class="td-center">按时提交次数</th>
	                    <th class="td-center">未提交</th>
	                    <th>平均分</th>
	                </tr>
	                <s:iterator value="students" >
			            <tr>
			                <td>${ user.id }</td>
			                <td>${ user.userId }</td>
			                <td>${ user.name }</td>
			                <td class="td-center">${ submit }</td>
			                <td class="td-center"><s:property value="%{passNumber-submit}"/></td>
			                <td>${ average }</td>
			            </tr>
		            </s:iterator>
	            </table>
	        </div>
	        
		</div>
</body>
</html>