<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加作业</title>
</head>
<body>
	<s:include value="../teacher/header.jsp"></s:include>
	<div class="content">
		<s:include value="../teacher/courseSide.jsp"></s:include>
		<div class="right-content">
			<s:include value="../user/homeworkTitle.jsp"></s:include>
			<form id="add-h-form" action="modifyHomework.action" method="post" enctype="multipart/form-data">
            <%-- <div>
                <span>为课程<s:property value="courseName"/>添加作业</span>
                <s:hidden name="courseId" value="%{courseId}"/>
            </div> --%>
            <div class="add-h-first">
           		<s:hidden name="courseId" value="%{courseId}"/>
           		<s:hidden name="homeworkId" value="%{homeworkId}"/>
                <div id="add-h-name">
                	<label>作业标题</label>
                	<input type="text" name="homework.name" value="${homework.name}">
                </div>
                <div id="add-h-type">
	                <label>作业格式</label>
	                <input type="text" name="homework.fileType" value="${homework.fileType}">
	            </div>
            </div>
            <div id="add-h-des">
                <label>作业描述</label>
                <textarea name="homework.description"><s:property value="homework.description"/></textarea>
            </div>
            <div id="add-h-file">
                <label>作业附件</label>
                <input type="file" name="file">
            </div>
            <div id="add-h-hr">
            	<span>———————— 截止日期 ————————</span>
            </div>
            <div id="add-h-ddl">
	            <div id="add-h-stu-ddl">
	                <label>学生提交</label>
	                <input type="text" name="homework.studentDDL" value="${homework.studentDDL}">
	                <!-- <input placeholder="年份" name="sddlYear">
	                <input placeholder="月份" name="sddlMonth">
	                <input placeholder="日期" name="sddlDay"> -->
	            </div>
	            <div id="add-h-assi-ddl">
	                <label>助教批改</label>
	                <input type="text" name="homework.assistantDDL" value="${homework.assistantDDL}">
	                <!-- <input placeholder="年份" name="addlYear">
	               	<input placeholder="月份" name="addlMonth">
	                <input placeholder="日期" name="addlDay"> -->
	            </div>
	        </div>
            
            <div id="add-h-btns">
            	<button type="button"><a class="a-btn-cancel" href="toApprovalHomework.action?homeworkId=<s:property value="homework.id"/>&courseId=<s:property value="courseId"/>">取消</a></button>
            	<button type="submit"><a class="a-btn-confirm">修改</a></button>
            </div>
        </form>
		</div>
    </div>
</body>
</html>