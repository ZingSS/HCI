<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="s" uri="/struts-tags"%>
<% String localPath = request.getContextPath();

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><s:property value="course.name"/></title>
</head>
<body>
	<s:include value="../teacher/header.jsp"></s:include>
	<div class="content">
		<s:include value="../teacher/courseSide.jsp"></s:include>
		<div class="right-content">
			<%-- <div><a href="exportCourseExcel.action?courseId=<s:property value="course.id"/>">生成课程Excel文件</a></div> --%>
        <s:include value="../teacher/courseHeader.jsp"></s:include>
<%--         <s:if test="%{currentDate.after(course.semester.endTime)}">
        	<div class="right-info-div">
        	<a class="add-td-a" href="downloadSummary.action?courseId=<s:property value="course.id"/>">下载课程总结</a>
        </div>
        </s:if> --%>
        <div class="course-assistant">
        	<s:if test="%{course.semester.startTime.after(currentDate)}">
        		<a href="assistantManagement.action?courseId=<s:property value="course.id"/>" class="a-button">管理助教</a>
        	</s:if>
        	<s:else>
        		<span>课程助教</span>
        	</s:else>
        	<br/>
        	<s:iterator value="%{course.assistant}" >
                <div class="assistant-label">${ name }</div>
            </s:iterator>
        </div>
        <div class="course-student">
            <s:if test="%{course.semester.startTime.after(currentDate)}">
            	<a href="showStudentList.action?courseId=<s:property value="course.id"/>" class="a-button">管理学生</a>
            </s:if>
            <s:else>
        		<span>课程学生</span>
        	</s:else>
            <br/>
                <table class="table-left">
                	<thead>
                		<tr>
	                        <th>学号</th>
	                        <th>姓名</th>
	                    </tr>
                	</thead>
                	<tfoot>
		            	<tr>
			                <td></td>
			                <td></td>
		            	</tr>
		            </tfoot>
		            <tbody>
		            	<s:iterator value="studentList" >
			            <tr>
			                <td>${ userId }</td>
			                <td>${ name }</td>
			            </tr>
					</s:iterator>
		            </tbody>
                </table>
                
                <table class="table-right">
                	<thead>
                		<tr>
	                        <th>学号</th>
	                        <th>姓名</th>
	                    </tr>
                	</thead>
                	<tfoot>
		            	<tr>
			                <td></td>
			                <td></td>
		            	</tr>
		            </tfoot>
		            <tbody>
		            	<s:iterator value="studentListRight" >
			            <tr>
			                <td>${ userId }</td>
			                <td>${ name }</td>
			            </tr>
					</s:iterator>
		            </tbody>
                </table>
        </div>
		</div>
    </div>

</body>
</html>