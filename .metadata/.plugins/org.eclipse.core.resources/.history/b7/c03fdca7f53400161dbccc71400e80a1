<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><s:property value="course.name"/>-作业情况</title>
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
                    <th>批改截止时间</th>
                    <th>附件</th>
                    <th>作业情况</th>
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
            	</tr>          	
            </tfoot>
            <tbody>
            	<s:iterator value="homeworkList" >
		            <tr>
		                <td class="">${ id }</td>
		                <td>${ name }</td>
		                <td>${ description }</td>
		                <td>${ fileType }</td>
		                <td>${ studentDDL }</td>
		                <td>${ assistantDDL }</td>
		                <td>
		                	<s:if test="%{fileId != 0}">
		                		<a href="downloadAttachment.action?fileId=${ fileId }" class="download-td-a">下载附件</a>
		                	</s:if>
		                	<s:else>
		                		无
		                	</s:else>
		                </td>
		                <td class="homework-state">
		                <s:if test="%{course.semester.startTime.after(currentDate) || course.semester.endTime.before(currentDate)}">
		                	<a href="toCorrectHomework.action?homeworkId=<s:property value="id"/>&courseId=<s:property value="course.id"/>" class="delete-td-a">
		                		查看
		                	</a>
		                </s:if>
		                <s:elseif test="%{ state == 'commit'}">
		                	
		                	<s:if test="%{ studentDDL > currentTime}">
		                		<a href="toCorrectHomework.action?homeworkId=<s:property value="id"/>&courseId=<s:property value="course.id"/>" class="delete-td-a">
		                			提交中
		                		</a>
		                	</s:if>
		                	<s:else>
		                		<a href="toCorrectHomework.action?homeworkId=<s:property value="id"/>&courseId=<s:property value="course.id"/>" class="add-td-a">
		                			批改
		                		</a>
		                	</s:else>
		                </s:elseif>
		               	<s:elseif test="%{ state == 'pass'}">
		               		<a href="toCorrectHomework.action?homeworkId=<s:property value="id"/>&courseId=<s:property value="course.id"/>" class="update-td-a">
		               		已公布</a>
		               	</s:elseif>
		               	<s:elseif test="%{ state == 'approval'}">
		               		<a href="toCorrectHomework.action?homeworkId=<s:property value="id"/>&courseId=<s:property value="course.id"/>" class="delete-td-a">
		               			审批中
		               		</a>
		               	</s:elseif>
		               	<s:else>
		               		<a href="toCorrectHomework.action?homeworkId=<s:property value="id"/>&courseId=<s:property value="course.id"/>" class="update-td-a">
		               		查看</a>
		               	</s:else>
		                </td>
		            </tr>
			</s:iterator>
            </tbody>
            </table>
        </div>
		</div>
    </div>

</body>
</html>