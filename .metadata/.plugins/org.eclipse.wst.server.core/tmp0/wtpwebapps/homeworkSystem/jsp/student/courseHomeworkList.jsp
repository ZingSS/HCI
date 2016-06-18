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
			<div class="course-header-info">
	        	<div class="course-header-main" id="s-course-header-main">
	        		<span id="course-header-name"><s:property value="course.name"/></span>
	        		<br/>
	        		<span id="course-header-id"><s:property value="course.courseId"/></span>
	        	</div>
	        	<div class="course-header-left" id="s-course-header-left">
	        		<span><s:property value="course.time"/></span>
	        		<br/>
	        		<span><s:property value="course.location"/></span>
	         		<br/>
	         		<s:iterator value="course.teachers" >
	                    <span>${ name }</span>
	                </s:iterator>
	                <br/>
	        		<s:iterator value="%{course.assistant}" >
	                <span>${ name }</span>
	                </s:iterator>
	                <%-- <s:if test="%{course.semester.startTime.after(currentDate)}">
	                	<a href="assistantManagement.action?courseId=<s:property value="course.id"/>" class="add-td-a">管理助教</a>
	                </s:if> --%>
	        	</div>
	                <%-- <span><s:property value="course.semester.name"/></span> --%>
	       </div>
	       
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
	        			<s:if test="%{homework.state == 'commit' && homework.studentDDL > homework.currentTime}"> 
			                <div class="homework-card-header h-submit">
			            </s:if>
			            <!-- 批改中 -->
			            <s:elseif test="%{homework.studentDDL < homework.currentTime && homework.assistantDDL > homework.currentTime && homework.state=='commit'}">
			               	<div class="homework-card-header h-commit">
			            </s:elseif>
			            <!-- 教师审批中/已经公布／其它 -->
			            <s:else>
			            	<div class="homework-card-header h-done">
			            </s:else>
	        				<span class="homework-id">No.${ homework.id }</span>
	        				<span class="homework-name">${ homework.name }</span>
	        			</div>
	        			<div class="homework-card-body">
	        				<s:if test="%{homework.description == ''}">
	        					<span>无作业描述</span>
	        				</s:if>
	        				<s:else>
	        					<span class="homework-des">${ homework.description }</span>
	        				</s:else>
	        			</div>
	        			<div class="homework-card-footer">
	        				<hr/>
	        				<s:if test="%{homework.studentDDL > homework.currentTime}">
			                	<span class="homework-undo">距提交截止 xx天xx小时</span>
			            	</s:if>
	        				<s:elseif test="%{homework.studentDDL < homework.currentTime && homework.assistantDDL > homework.currentTime && homework.state=='commit'}">
			               		<span class="homework-active">距批改截止 xx天xx小时</span>
			            	</s:elseif>
			            	<s:elseif test="%{homework.assistantDDL > homework.currentTime && homework.state=='approval'}">
			            		<span class="homework-done">待审批</span>
			                </s:elseif>
			                <s:elseif test="%{homework.state=='pass'}">
			                	<span class="homework-done">已公布</span>
			                </s:elseif>
			                <s:else>
			                	<span class="homework-done">已过期</span>
			                </s:else>
	        				<%-- <span>${ studentDDL }</span><span>${ assistantDDL }</span> --%>
	        			</div>
	        		</div>
	        	</a>
	        </s:iterator>
	        	
	        </div>
        </s:else>
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