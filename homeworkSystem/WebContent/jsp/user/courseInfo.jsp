<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
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
</body>
</html>