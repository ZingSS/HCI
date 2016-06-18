<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<% String localPath = request.getContextPath();

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>课程作业列表</title>
</head>
<body>
	<s:include value="../student/header.jsp"></s:include>
	<div class="content">
		<div class="left-sidebar">
			<div class="left-title"><span>助教课程</span></div>	
			<hr/>
			<div>
	            <ul class="left-list">
	            	<li><a href="showStudentCourseList.action">所有课程</a></li>
	            </ul>
	            <div class="left-sub-title"><span><s:property value="course.name"/></span></div>
	        	</div>
			</div>
		<div class="right-content">
			<div class="right-info-div">
			<div>
                <span class="info-title">作业编号：</span>
                <span id="homework-id"><s:property value="homework.id"/></span>
            </div>
            <div>
                <span class="info-title">作业名称：</span>
                <span><s:property value="homework.name"/></span>
            </div>
            <div>
                <span class="info-title">作业描述：</span>
                <span><s:property value="homework.description"/></span>
            </div>
            <div>
                <span class="info-title">作业提交格式：</span>
                <span><s:property value="homework.fileType"/></span>
            </div>
            <div>
                <span class="info-title">作业提交截止日期：</span>
                <span><s:property value="homework.studentDDL"/></span>
            </div>
            <div>
                <span class="info-title">作业批改截止日期：</span>
                <span><s:property value="homework.assistantDDL"/></span>
            </div>
            <div>
                <span class="info-title">附件：</span>
                <span>
                	<s:if test="%{homework.fileId != 0}">
		            	<a href="downloadAttachment.action?fileId=${ homework.fileId }" class="download-td-a">下载附件</a>
		            </s:if>
		            <s:else>
		            	无
		            </s:else>
                </span>
            </div>
			</div>
		<div>
			<div class="right-info-div">
				<s:if test="%{homework.studentDDL < currentTime && homework.assistantDDL > currentTime && homework.state == 'commit'}">
				<form action="uploadGrade.action" method="post" enctype="multipart/form-data" id="export-form">   
	        		<s:hidden name="courseId" value="%{course.id}"/>
	        		<s:hidden name="homeworkId" value="%{homework.id}"/>
	         		<span class="info-title">导入成绩：</span><input type="file" id="dofile" name="file"/>
	         		<button type="submit" class="submit-btn">导入</button>
	    		 </form> 
            </s:if>
            <span>
            <a href="exportStudentListExcel.action?courseId=<s:property value="course.id"/>&homeworkId=<s:property value="homework.id"/>" class="update-td-a">
            	导出学生名单
            </a>
            </span>
			</div>
           
            <table>
                <tr>
                    <th>编号</th>
                    <th>学生学号</th>
                    <th>学生姓名</th>
                    <th>作业</th>
                    <th>成绩</th>
                    <th>点评</th>
                    <th>修改</th>
                </tr>
                <s:iterator value="studentList" >
		            <tr class="homework-line">
		                <td class="hidden-id">${ id }</td>
		                <td class="user-userId">${ studentId }</td>
		                <td class="user-name">${ name }</td>
		                <td>
			               	<s:if test="%{submit}">
			                	<a href="downloadHomework.action?studentId=<s:property value="id"/>&homeworkId=<s:property value="homework.id"/>" class="download-td-a">
			                	下载作业
			                	</a>
			                </s:if>
			                <s:else>
			                	未提交
			                </s:else>
		                </td>
		                <td class="grade">${ grade }</td>
		                <td class="comment">${ comment }</td>
		                <s:if test="%{homework.studentDDL < currentTime && homework.state =='commit'}">
		                	<td class="update-one-grade"><a class="update-td-a">修改</a></td>
		                </s:if>
		                <s:else><td></td></s:else>
		            </tr>
			</s:iterator>
            </table>
            <div class="right-info-div">
            	<s:if test="%{course.semester.startTime.after(currentDate) || course.semester.endTime.before(currentDate)}">
            	</s:if>
            	<s:elseif test="%{homework.studentDDL < currentTime && homework.assistantDDL > currentTime && homework.state == 'commit'}">
					<span>
					<a href="informTeacher.action?courseId=<s:property value="course.id"/>&homeworkId=<s:property value="homework.id"/>" class="add-td-a">
						提交批改结果
					</a>
					</span>
            	</s:elseif>
            	<s:elseif test="%{homework.state == 'approval'}">
            		<span><a class="forbid-td-a">等待审批</a></span>
            	</s:elseif>
            	
            </div>
        </div>
		</div>
		
	</div>
	<div id="update-grade-div">
        <div id="update-grade-body">
        	<div id="update-grade-title"><span>修改学生成绩</span></div>
	        <form action="updateGrade.action" method="post">
	            <s:hidden name="studentId" id="grade-user-id"/>
	            <s:hidden name="homeworkId" value="%{homework.id}"/>
	            <s:hidden name="courseId" value="%{course.id}"/>
	            <span id="student-userId"></span>
	            <span id="student-name"></span><br/>
	            <input type="text" id="update-grade" name="grade" placeholder="修改成绩"><br/>
	            <input type="text" id="update-comment" name="comment" placeholder="修改点评"><br/>
	            <button type="button" class="cancel-btn close-btn">取消</button>
	            <button type="submit" class="submit-btn close-btn">修改</button>
	        </form>
        </div>
    </div>
<script type="text/javascript" src="<%=localPath %>/js/jquery.js" charset="utf-8"></script>
<script type="text/javascript" src="<%=localPath %>/js/homework.js" charset="utf-8"></script>
</body>
</html>