<%@page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<% String localPath = request.getContextPath();%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><s:property value="course.name"/>-课程作业</title>
</head>
<body>
	<s:include value="../teacher/header.jsp"></s:include>
	<div class="content">
		<s:include value="../teacher/courseSide.jsp"></s:include>
		<div class="right-content">
		<s:include value="../teacher/courseHeader.jsp"></s:include>
       
        <s:if test="%{course.semester.startTime.after(currentDate)}">
        	<div class="t-homework">
        	<span>学期尚未开始，无法布置作业，前去管理学生</span>
        	<a href="teacherCourse.action?courseId=<s:property value="course.id"/>&name=<s:property value="course.name"/>" class="a-margin-button">管理学生</a>
        	</div>
        </s:if>
        <s:else>
        	<div class="t-homework">
	        	<ul>
	        		<s:if test="%{course.semester.endTime.after(currentDate)}">
	        			<li>
	        				<s:if test="%{homeworkList.size() == 0}">
	        					<span>暂无作业，可以</span>
	        					<a href="toAddHomework.action?courseId=<s:property value="course.id"/>" class="a-button">添加作业</a>
	        				</s:if>
	        				<s:else>
	        					<a href="toAddHomework.action?courseId=<s:property value="course.id"/>" class="a-margin-button">添加作业</a>
	        				</s:else>
	        				
	        			</li>
	        			<!-- <li><a class="add-td-a" id="to-add-homework">添加作业</a></li> -->
        			</s:if>       
	            </ul>
	        </div>
	
	        <div class="t-homework">
	        <s:iterator value="homeworkList" >
	        	<a href="toApprovalHomework.action?homeworkId=<s:property value="id"/>&courseId=<s:property value="course.id"/>">
	        		<div class="homework-card">
	        			<s:if test="%{studentDDL > currentTime}">
			                <div class="homework-card-header h-commit">
			            </s:if>
			            <s:elseif test="%{studentDDL < currentTime && assistantDDL > currentTime && state=='commit'}">
			               	<div class="homework-card-header h-commit">
			            </s:elseif>
			            <s:elseif test="%{state=='approval'}">
			               	<div class="homework-card-header h-submit">
			            </s:elseif>
			            <s:else>
			            	<div class="homework-card-header h-done">
			            </s:else>
	        				<span class="homework-id">No.${ id }</span>
	        				<span class="homework-name">${ name }</span>
	        			</div>
	        			<div class="homework-card-body">
	        				<%-- <span class="homework-des">${ description }</span> --%>
	        				<s:if test="%{homework.description == ''}">
	        					<span class="homework-des">无作业描述</span>
	        				</s:if>
	        				<s:elseif test="%{description.length()>30}">
	        					<span class="homework-des"><s:property value="description.substring(0,30)"/>...</span>
	        				</s:elseif>
	        				<s:else><span class="homework-des">${ description }</span></s:else>
	        			</div>
	        			<div class="homework-card-footer">
	        				<hr/>
	        				<s:if test="%{studentDDL > currentTime}">
			                	<span class="h-commit-span">距离提交截止 <% Random r = new Random(); out.print(r.nextInt(10)+1); %>天13小时</span>
			            	</s:if>
	        				<s:elseif test="%{studentDDL < currentTime && assistantDDL > currentTime && state=='commit'}">
			               		<span class="h-commit-span">距离批改截止 <% Random r = new Random(); out.print(r.nextInt(10)+1); %>天13小时</span>
			            	</s:elseif>
			            	<s:elseif test="%{state=='approval'}">
			            		<span class="h-active-span">待审批</span>
			                </s:elseif>
			                <s:elseif test="%{state=='pass'}">
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
		</div>
            
    </div>
    
    <div id="add-homework-div">
    	<div id="add-homework-body">
    		<div id="add-homework-title"><span>为课程<span id="homework-course-name"></span>添加作业</span></div>
    		<form action="addHomework.action" method="post" enctype="multipart/form-data">
	            <div>
	                <s:hidden name="courseId" id="hidden-couse-id"/>
	            </div>
	            <div>
	                <label>作业名</label>
	                <input type="text" name="homework.name">
	            </div>
	            <div class="description-div">
	                <label>作业描述</label>
	                <textarea name="homework.description"></textarea>
	            </div>
	            <div class="short-input-div">
	                <label>学生提交截止日期</label>
	                <input type="text" placeholder="年份" name="sddlYear">
	                <input type="text" placeholder="月份" name="sddlMonth">
	                <input type="text" placeholder="日期" name="sddlDay">
	            </div>
	            <div class="short-input-div">
	                <label>助教批改截止日期</label>
	                <input type="text" placeholder="年份" name="addlYear">
	               	<input type="text" placeholder="月份" name="addlMonth">
	                <input type="text" placeholder="日期" name="addlDay">
	            </div>
	            <div>
	                <label>作业格式</label>
	                <input type="text" name="homework.fileType">
	            </div>
	            <div>
	                <label>附件</label>
	                <input type="file" name="file">
	            </div>
	            <button type="button" class="cancel-btn close-btn">取消</button>
	            <button type="submit" class="submit-btn close-btn">添加</button>
        	</form>
    	</div>
    </div>
    
<script type="text/javascript" src="<%=localPath %>/js/jquery.js" charset="utf-8"></script>
<script type="text/javascript" src="<%=localPath %>/js/homework.js" charset="utf-8"></script>

</body>
</html>