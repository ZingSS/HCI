<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>发送邮件</title>
</head>
<body>
	<s:include value="header.jsp"></s:include>
	<div class="content">
		<s:include value="courseSide.jsp"></s:include>
		<div class="right-content">
			<div class="course-header-info">
	        	<div class="course-header-main">
	        		<span id="course-header-name"><s:property value="course.name"/></span>
	        		<br/>
	        		<span id="course-header-id"><s:property value="course.courseId"/></span>
	        	</div>
	        	<div class="course-header-left">
	        		<span><s:property value="course.time"/></span>
	        		<br/>
	        		<span><s:property value="course.location"/></span>
	         		<br/>
	        	</div>
	        </div>
			<form id="" action="sendMail.action" method="post" enctype="multipart/form-data">
                <s:hidden name="courseId" value="%{courseId}"/>
                <div id="">
                	<label>收件人</label>
                	<input type="text" name="address" value="<s:property value="user.userId"/>@nju.edu.cn">
                </div>
                <div id="">
                	<label>主题</label>
                	<input type="text" name="subject">
                </div>
	            <div id="">
	                <label>内容</label>
	                <textarea name="content"></textarea>
	            </div>
          
	            <div id="">
	          		您正在发送邮件给 <s:property value="user.name"/>，回复的邮件可以在邮箱中查看
	            	<input type="submit" value="发送">
	            </div>
        	</form>
		</div>
    </div>
</body>
</html>