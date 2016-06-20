<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@page import="nju.edu.homework.model.User"%>
<%@page import="java.util.List"%>
<% String localPath = request.getContextPath();

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><s:property value="courseName" />添加学生</title>
</head>
<body>
	<s:include value="../teacher/header.jsp"></s:include>
	<div class="content">
			<s:include value="../teacher/courseSide.jsp"></s:include>
		<div class="right-content">
			<s:include value="../teacher/courseHeader.jsp"></s:include>

        <div class="search-student">
        	<form action="getStudentList.action" method="post" id="fuzzy-form">
	            	<s:hidden name="courseId" value="%{courseId}"/>
	            	<s:hidden name="page" value="addStudent" /> 
	            	<label>学生学号</label>
		            <input type="text" id="student-userId" name="studentId">
		            <label>学生姓名</label>
		            <input type="text" id="student-name" name="name" >
		            <button type="submit" class="submit-btn">查找</button>
            </form>
            <div class="add-student">
            	<table class="main-table">
        		<tr>
                    <th class="s-t-id">学号</th>
                    <th class="s-t-name">姓名</th>
                    <th class="s-t-op">添加</th>
                </tr>
				<tr class="scroll-tr">
				<td colspan="3" class="inner-td">
					<div class="scorll-table">
					<table class="inner-table"><tbody>
						<s:iterator value="studentList" >
				                      	
				               <s:if test="%{!isIn}">
				               <tr class="student-line">		  
				               		<input type="hidden" value="${id}" class="hidden-id">
				                <td class="s-t-id">${ userId }</td>
				                <td class="s-t-name">${ name }</td>
				               <s:if test="%{assistantCourseId == course.id}">
				                <td class="s-t-op">助教</td>
				               </s:if>
				               <s:else>
				               	<td class="s-t-op">
				               		<img class="td-img" alt="add" src="../../image/add.png" />
				               	</td>
				               </s:else>
				               </tr>
				               </s:if>
				            
						</s:iterator>
						</tbody>
						</table>
					</div>
				</td>
				</tr>
                
        	</table>
            <div class="add-stu-btns sel-btns">
            	<a id="add-all-stu" class="a-button">添加当前所有</a>
            </div>
            </div>
            

        </div>
        <div class="added-student">
        	<table class="main-table">
        		<tr>
                    <th class="s-t-id">学号</th>
                    <th class="s-t-name">姓名</th>
                    <th class="s-t-op">移除</th>
                </tr>
				<tr class="scroll-tr">
				<td colspan="3" class="inner-td">
					<div class="scorll-table">
					<table class="inner-table"><tbody>
						<s:iterator value="inCourseStudentList" >
				            <tr class="student-line">
				            	<input type="hidden" value="${id}" class="hidden-id">
				                <td class="s-t-id">${ userId }</td>
				                <td class="s-t-name">${ name }</td>
				               	<td class="s-t-op"><img class="td-img" alt="remove" src="../../image/remove.png" /></td>
				            </tr>
						</s:iterator>
						</tbody>
						</table>
					</div>
				</td>
				</tr>
                
        	</table>
        	<div class="remove-stu-btns sel-btns">
            	<a id="remove-all-stu" class="a-button">移除当前所有</a>
        	</div>
        </div>
		</div>
    </div>
    
    <div id="move-right"><span> >> </span></div>
    <div id="move-left"><span> << </span></div>
    
    <div id="add-success" class="tip-div">
    	<span>添加成功</span>
    </div>
    <div id="remove-success" class="tip-div">
    	<span>移除成功</span>
    </div>
<script type="text/javascript" src="<%=localPath %>/js/jquery.js" charset="utf-8"></script>
<script type="text/javascript" src="<%=localPath %>/js/student.js" charset="utf-8"></script>
</body>
</html>