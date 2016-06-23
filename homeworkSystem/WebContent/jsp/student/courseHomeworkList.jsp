<%@page import="java.util.Random"%>
<%@page import="java.util.List"%>
<%@page import="nju.edu.homework.service.GradeService"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><s:property value="course.name"/>-课程作业</title>
</head>
<body>
	<s:include value="../student/header.jsp"></s:include>
	<div class="content">
		<s:include value="../student/courseSide.jsp"></s:include>
		<div class="right-content">
			<s:include value="../student/courseHeader.jsp"></s:include>
	       
	       <s:if test="%{course.semester.startTime.after(currentDate)}">
        	<div class="t-homework"><span>学期尚未开始，暂无作业</span></div>
        </s:if>
        <s:else>
        	<s:if test="%{homeworkList.size() == 0}">
        		<div class="t-homework">暂未布置作业</div>
        	</s:if>
	        <div class="t-homework">
	        <s:iterator value="homeworkList" >
	        	<a href="toSubmitHomework.action?homeworkId=<s:property value="homework.id"/>&courseId=<s:property value="course.id"/>" class="">
	        		<div class="homework-card">
	        			<!-- 提交中 -->
			            <s:if test="%{homework.state == 'commit' && homework.studentDDL > currentTime}">
			                <div class="homework-card-header h-submit">
			            </s:if>
			            <!-- 批改中 -->
			            <s:elseif test="%{homework.studentDDL < currentTime && homework.assistantDDL > currentTime && homework.state=='commit'}">
			               	<div class="homework-card-header h-commit">
			            </s:elseif>
			            <!-- 教师审批中/已经公布／其它 -->
			            <s:else>
			            	<div class="homework-card-header h-done">
			            </s:else>
	        				<span class="homework-id">No.${ homework.id }</span>
	        				<s:if test="%{homework.name.length()>9}"><span class="homework-name"><s:property value="homework.name.substring(0,9)"/>...</span></s:if>
	        				<s:else><span class="homework-name">${ homework.name }</span></s:else>
	        			</div>
	        			<div class="homework-card-body">
	        				<s:if test="%{homework.description == ''}">
	        					<span class="homework-des">无作业描述</span>
	        				</s:if>
	        				<s:elseif test="%{homework.description.length()>30}">
	        					<span class="homework-des"><s:property value="homework.description.substring(0,30)"/>...</span>
	        				</s:elseif>
	        				<s:else><span class="homework-des">${ homework.description }</span></s:else>
	        			</div>
	        			<div class="homework-card-footer">
	        				<hr/>
	        				<s:if test="%{homework.studentDDL > currentTime}">
			                	<span class="h-active-span">距提交截止 <% Random r = new Random(); out.print(r.nextInt(10)+1); %>天13小时</span>
			            	</s:if>
	        				<s:elseif test="%{homework.studentDDL < currentTime && homework.assistantDDL > currentTime && homework.state=='commit'}">
			               		<span class="h-commit-span">待批改</span>
			            	</s:elseif>
			            	<s:elseif test="%{homework.state=='approval'}">
			            		<span class="h-commit-span">待审批</span>
			                </s:elseif>
			                <s:elseif test="%{homework.state=='pass'}">
			                	<span class="h-done-span">已公布</span>
			                </s:elseif>
			                <s:else>
			                	<span class="h-done-span">已过期</span>
			                </s:else>
	        				<%-- <span>${ studentDDL }</span><span>${ assistantDDL }</span> --%>
	        			</div>
	        		</div>
	        	</a>
	        </s:iterator>
	        	
	        </div>
        </s:else>
		
	

</body>
</html>