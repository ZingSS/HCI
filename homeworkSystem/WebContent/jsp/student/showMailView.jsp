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
	<s:if test="%{identity == 'student'}">
		<s:include value="../student/courseSide.jsp"></s:include>
	</s:if>
	<s:else>
			<div class="left-sidebar">
			<div class="left-title">
				<span>助教课程</span>
			</div>
			<hr />
			<div>
				<ul class="left-list">
					<li><a href="showStudentCourseList.action">所有课程</a></li>
				</ul>
				<div class="left-sub-title">
					<a
						href="showStudentsHomework.action?courseId=<s:property value="course.id"/>&name=<s:property value="course.name"/>">
						<span><s:property value="course.name" /></span>
					</a>
				</div>
				<ul class="left-sub-list">
					<li><a
						href="showStudentsHomework.action?courseId=<s:property value="#request.course.id"/>&name=<s:property value="#request.course.name"/>">作业</a></li>
					<li><a  id="an"
						href="asAddAnnouncement.action?courseId=<s:property value="course.id"/>&name=<s:property value="course.name"/>">公告</a></li>
				</ul>
			</div>
		</div>
	</s:else>
		<div class="right-content">
			<s:include value="../student/courseHeader.jsp"></s:include>
			<s:form id="add-mail-form" action="sendMail.action" method="post" enctype="multipart/form-data">
                <s:hidden name="courseId" value="%{courseId}"/>
                <s:hidden name="identity" value="%{identity}"/>
					<div id="mail-receiver">
						<label>收件人</label>
						<input type="text" name="address" value="<s:property value="user.userId"/>@smail.nju.edu.cn">
					</div>
					<div id="mail-theme">
						<label>主题</label> 
						<input type="text" name="subject">
					</div>
					<div id="add-h-des" class="mail-content">
						<label>内容</label>
						<textarea name="content"></textarea>
					</div>
					
					<!-- style 最好写在 css 里 -->
					<div id="mail-btn">
						<span>您正在发送邮件给<i><s:property value="user.name" /></i>，请在邮箱中查询是否收到回信 </span>
						<button type="submit" class="a-btn-confirm">发送</button>
					</div>
			</s:form>
		</div>
    </div>
</body>
</html>