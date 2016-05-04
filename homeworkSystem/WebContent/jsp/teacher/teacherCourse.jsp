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
		<div class="left-sidebar">
			<div class="left-title"><span>我的课程</span></div>	
			<hr/>
			<div>
            <ul class="left-list">
            	<li><a href="showTeacherCourseList.action">所有课程</a></li>
            </ul>
            <div class="left-sub-title"><span><s:property value="course.name"/></span></div>
	            <ul class="left-sub-list">
	                <li><a href="teacherCourse.action?courseId=<s:property value="course.id"/>&name=<s:property value="course.name"/>">课程学生</a></li>
	                <li><a href="showTeacherHomeworkList.action?courseId=<s:property value="course.id"/>&name=<s:property value="course.name"/>">课程作业</a></li>
	            </ul>
        	</div>
		</div>
		<div class="right-content">
			<%-- <div><a href="exportCourseExcel.action?courseId=<s:property value="course.id"/>">生成课程Excel文件</a></div> --%>
        <div class="course-info right-info-div">
        	<div>
                <span class="info-title">学期：</span>
                <span><s:property value="course.semester.name"/></span>
            </div>
            <div>
                <span class="info-title">课程号：</span>
                <span><s:property value="course.courseId"/></span>
                <span class="info-title second-span">课程名称：</span>
                <span><s:property value="course.name"/></span>
            </div>
            <div>
                <span class="info-title">上课时间：</span>
                <span><s:property value="course.time"/></span>
                <span class="info-title second-span">上课地点：</span>
                <span><s:property value="course.location"/></span>
            </div>
            <div>
                <span class="info-title">助教：</span>
               	<s:iterator value="%{course.assistant}" >
                <span>${ name }</span>
                </s:iterator>
                <s:if test="%{course.semester.startTime.after(currentDate)}">
                	<a href="assistantManagement.action?courseId=<s:property value="course.id"/>" class="add-td-a">管理助教</a>
                </s:if>
            </div>
        </div>
        <s:if test="%{currentDate.after(course.semester.endTime)}">
        	<div class="right-info-div">
        	<a class="add-td-a" href="downloadSummary.action?courseId=<s:property value="course.id"/>">下载课程总结</a>
        </div>
        </s:if>
        <div class="course-student">
            <div class="right-info-div">
            	<span>本课程学生</span>
            	<s:if test="%{course.semester.startTime.after(currentDate)}">
            		<a href="showStudentList.action?courseId=<s:property value="course.id"/>" class="update-td-a">管理课程学生</a>
            	</s:if>
            </div>
                <table>
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
        </div>
		</div>
    </div>

</body>
</html>