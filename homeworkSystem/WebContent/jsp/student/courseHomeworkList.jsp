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
		<div class="left-sidebar">
			<div class="left-title"><span>我的课程</span></div>	
			<hr/>
			<div>
            <ul class="left-list">
            	<li><a href="showStudentCourseList.action">所有课程</a></li>
            </ul>
            <div class="left-sub-title"><span><s:property value="course.name"/></span></div>
	            <ul class="left-sub-list">
	                <li><a href="showStudentHomeworkList.action?courseId=<s:property value="course.id"/>&name=<s:property value="course.name"/>">课程作业</a></li>
	            </ul>
        	</div>
		</div>
		<div class="right-content">
			<div class="right-info-div">
				<div>
	                <span class="info-title">课程学期：</span>
	                <span><s:property value="course.semester.name"/></span>
	            </div>
	            <div>
	                <span class="info-title">课程号：</span>
	                <span><s:property value="course.courseId"/></span>
	                <span class="second-span info-title">课程名称：</span>
	                <span><s:property value="course.name"/></span>
	            </div>
	            <div>
	                <span class="info-title">上课时间：</span>
	                <span><s:property value="course.time"/></span>
	                <span class="second-span info-title">上课地点：</span>
	                <span><s:property value="course.location"/></span>
	            </div>
	           <div>
	                <span class="info-title">教师：</span>
	                <s:iterator value="course.teachers" >
	                    <span>${ name }</span>
	                </s:iterator>
	            </div>
	            <div>
	                <span class="info-title">助教：</span>
	                <s:iterator value="course.assistant" >
	                    <span>${ name }</span>
	                </s:iterator>
	            </div>
	       </div>
		<div>
            <table>	
            <thead>
            	<tr>
                    <th>作业编号</th>
                    <th>作业标题</th>
                    <th>作业描述</th>
                    <th>提交格式</th>
                    <th>提交截止时间</th>
                    <th>附件</th>
                    <th>作业状态</th>
                    <th>分数</th>
                    <th>样例及点评</th>
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
                <s:iterator value="homeworkList" >
		            <tr>
		                <td class="">${ homework.id }</td>
		                <td>${ homework.name }</td>
		                <td>${ homework.description }</td>
		                <td>${ homework.fileType }</td>
		                <td>${ homework.studentDDL }</td>
		                <td>
		                	<s:if test="%{homework.fileId != 0}">
		                		<a href="downloadAttachment.action?fileId=${ homework.fileId }" class="download-td-a">下载附件</a>
		                	</s:if>
		                	<s:else>
		                		无
		                	</s:else>
		                </td>
		                <td class="homework-state">
			                <s:if test="%{homework.studentDDL > currentTime}">
			              		<a href="toSubmitHomework.action?homeworkId=<s:property value="homework.id"/>&courseId=<s:property value="course.id"/>" class="add-td-a">
			              		<s:if test="%{submit}">
			              		已提交
			              		</s:if>
			              		<s:else>
			              		提交
			              		</s:else>
			              		</a>
			                </s:if>
			                <s:elseif test="%{homework.state == 'pass'}">
			                	已发布
			                </s:elseif>
			                <s:else>
			                	<a class="forbid-td-a">提交截止</a>
			                </s:else>
		                </td>
		                <s:if test="%{homework.state == 'pass'}">
		                	<td>
		                		${ grade }
		                	</td>
		                	<s:if test="%{homework.publishFileId != 0}">
		                		<td><a href="downloadAttachment.action?fileId=${ homework.publishFileId }" class="download-td-a">下载</a></td>
		                	</s:if> 
		                	<s:else>
		                		<td></td>
		                	</s:else>
		                </s:if>
		                <s:else>
		                	<td></td>
		                	<td></td>
		                </s:else>
		            </tr>
			</s:iterator>
            </tbody>
            </table>
        </div>
		</div>
	</div>
	
	<div id="submit-homework-div">
    	<div id="submit-homework-body">
    		<div id="submit-homework-title"><span>提交作业</span></div>
    		<form action="register.action" method="post">
		    	<div class="radio-input">
		    		<input type="radio" name="role" value="student" id="role_student"><label for="role_student">学生</label>
		        	<input type="radio" name="role" value="teacher" id="role_teacher"><label for="role_teacher">教师</label>
		    	</div>
		        <input type="text" placeholder="请输入帐号" name="user.userId"><br/>
		        <input type="password" placeholder="请输入密码" name="password"><br/>
		        <input type="text" placeholder="请输入姓名" name="name"><br/>
		        <button type="button" class="cancel-btn close-btn">取消</button>
		        <button type="submit" class="submit-btn close-btn">注册</button>
		
		    </form>
    	</div>
    </div>
	

</body>
</html>