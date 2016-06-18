<%@page import="nju.edu.homework.action.CourseListAction"%>
<%@page import="nju.edu.homework.model.Course"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<% String localPath = request.getContextPath();

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>教学计划</title>
</head>
<body>
	<s:include value="../administrator/header.jsp"></s:include>
	<div class="content">
		<div class="left-sidebar">
			<div class="left-title"><span>课程管理</span></div>
			<div class="left-btn" id="to-add-course">
				<a href="addCourse.action">添加课程</a>
			</div>		
			<hr/>
			<div class="semester-search">
	            <form action="getCourseBySemester.action" method="post">
	            	<s:select name="semester" list="semesterList" id="semester-list">
	            	</s:select>
	                <button type="submit" class="search-btn">查询</button>	
	                <s:label id="semester-selected" name="semesterSelected"></s:label>	
	                <div class="">
					<a id="to-add-semester">添加学期</a>
				</div>
	            </form>
	            <hr/>
	        </div>
		</div>
		<div class="right-content">
			<div class="right-info-div">
				<div id="semester-info">
		            <span class="info-title">学期：</span><span class="into-content" id="this-s-name"><s:property value="currentSemester.name"/></span>
		            <span class="info-title">开始日期：</span><span class="into-content" id="this-s-begin"><s:property value="currentSemester.startTime" /></span>
		            <span class="info-title">结束日期：</span><span class="into-content" id="this-s-end"><s:property value="currentSemester.endTime" /></span>
		            <a class="update-td-a" id="to-update-semester">修改学期</a>
		        </div>
			</div>
			<div>  
	            <table>
	            	<thead>
	            		<tr>
		                    <th>课程编号</th>
		                    <th>课程号</th>
		                    <th>课程名称</th>
		                    <th>课程性质</th>
		                    <th>学分</th>
		                    <th>教师</th>
		                    <th>上课时间</th>
		                    <th>上课地点</th>
		                    <th>修改课程</th>
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
	            	<s:iterator value="courseList" >
			            <tr>
			                <td class="course-list-id">${ id }</td>
			                <td>${ courseId }</td>
			                <td>${ name }</td>
			                <td>${ type }</td>
			                <td>${ credit }</td>
			                <td class="">
			                <s:if test="currentDate.before(semester.startTime)">
				                <s:if test="%{teachers.size() == 0}">
				                	<a class="add-td-a" href="addCourseTeacherList.action?id=${id}">添加</a>
				                </s:if>
				                <s:else>
				                	<s:iterator value="%{teachers}">
				                	${ name } 
				                	</s:iterator>
				                	<a class="update-td-a teacher-update-td-a" href="addCourseTeacherList.action?id=${id}">修改</a>
				                </s:else>
			                </s:if>
			                <s:else>
			                	<s:if test="%{teachers.size() == 0}">
				                	无
				                </s:if>
				                <s:else>
				                	<s:iterator value="%{teachers}">
				                	${ name } 
				                	</s:iterator>
				                </s:else>
			                </s:else>
			                </td>
			                <td>${ time }</td>
			                <td>${ location }</td>
			                <td>
			                	<s:if test="currentDate.before(semester.startTime)">
			                		<a href="jumpToUpdateCourse.action?courseId=${id}" class="update-td-a">修改</a>
			                	</s:if>
			                	<s:elseif test="currentDate.before(semester.endTime)">
			                		<a class="pink-font">正在进行中</a>
			                	</s:elseif>
			                	<s:else><a class="forbid-td-a">已关闭</a></s:else>
			                </td>
			            </tr>
		            </s:iterator>
	            	</tbody>
	            </table>
	        </div>
		</div>
    </div>
    
    <div id="add-semester-div">
    	<div id="add-semester-body">
    		<div id="add-semester-title"><span>添加 <span id="new-semester-name"></span></span></div>
    		<form action="addSemester.action" method="post" id="add-semester-form">
				<input type="hidden" name="newSemester" id="hidden-new-semester">
				<br/>
				<label>学期开始时间</label>
					<input type="text" placeholder="年份" name="beginYear">
	                <input type="text" placeholder="月份" name="beginMonth">
	                <input type="text" placeholder="日期" name="beginDay">
	            <br/>
				<label>学期结束时间</label>
					<input type="text" placeholder="年份" name="endYear">
	                <input type="text" placeholder="月份" name="endMonth">
	                <input type="text" placeholder="日期" name="endDay">
				<br/>	
				<button type="button" class="cancel-btn close-btn">取消</button>
				<button type="submit" class="submit-btn close-btn">添加</button>
			</form>
    	</div>
    </div>
    
    <div id="update-semester-div">
    	<div id="update-semester-body">
    		<div id="update-semester-title"><span>修改 <span id="update-semester-name"></span></span></div>
    		<form action="updateSemester.action" method="post" id="update-semester-form">
				<input type="hidden" name="updateSemester" id="hidden-semester-name">
				<br/>
				<label>学期开始时间</label>
					<input type="text" placeholder="年份" name="beginYear" id="begin-year">
	                <input type="text" placeholder="月份" name="beginMonth" id="begin-month">
	                <input type="text" placeholder="日期" name="beginDay" id="begin-day">
	            <br/>
				<label>学期结束时间</label>
					<input type="text" placeholder="年份" name="endYear" id="end-year">
	                <input type="text" placeholder="月份" name="endMonth" id="end-month">
	                <input type="text" placeholder="日期" name="endDay" id="end-day">
				<br/>	
				<button type="button" class="cancel-btn close-btn">取消</button>
				<button type="submit" class="submit-btn close-btn">修改</button>
			</form>
    	</div>
    </div>
    
<script type="text/javascript" src="<%=localPath %>/js/jquery.js" charset="utf-8"></script>
<script type="text/javascript" src="<%=localPath %>/js/course.js" charset="utf-8"></script>

</body>
</html>