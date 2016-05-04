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
			<div class="left-title"><span>${ param.leftTitle }</span></div>	
			<hr/>
	        <ul class="left-list">
            	 <li><a href="showInitLastMonth.action">课程情况</a></li>
                <li><a href="showAllStudentStat.action">学生情况</a></li>
                <li><a href="showAllTeacherStat.action">教师情况</a></li>
            </ul>

</body>
</html>