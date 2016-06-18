<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>提交课程作业</title>
</head>
<body>
	<s:include value="../student/header.jsp"></s:include>
	<div class="content">
		<s:include value="../student/courseSide.jsp"></s:include>
		<div class="right-content">
			<div class="right-info-div">
				<div><a href="showStudentHomeworkList.action?courseId=<s:property value="courseId"/>&name=<s:property value="courseName"/>">返回作业列表</a></div>
			</div>
			<div class="right-info-div">
			<div>
                <span class="info-title">作业编号：</span>
                <span id="homework-id"><s:property value="homework.id"/></span>
            </div>
            <div>
                <span class="info-title">作业名称：</span>
                <span><s:property value="homework.name"/></span>
            </div>
            <div>
                <span class="info-title">作业描述：</span>
                <span><s:property value="homework.description"/></span>
            </div>
            <div>
                <span class="info-title">作业提交格式：</span>
                <span><s:property value="homework.fileType"/></span>
            </div>
            <div>
                <span class="info-title">作业提交截止日期：</span>
                <span><s:property value="homework.studentDDL"/></span>
            </div>
            <div>
                <span class="info-title">作业批改截止日期：</span>
                <span><s:property value="homework.assistantDDL"/></span>
            </div>
            <div>
                <span class="info-title">附件：</span>
                <span>
                	<s:if test="%{homework.fileId != 0}">
		            	<a href="downloadAttachment.action?fileId=${ fileId }" class="download-td-a">下载附件</a>
		            </s:if>
		            <s:else>
		            	无
		            </s:else>
                </span>
            </div>
			</div>
			<div>
        	<form action="submitHomework.action" method="post" enctype="multipart/form-data" >   
        		<s:hidden name="courseId" value="%{courseId}"/>
        		<s:hidden name="homeworkId" value="%{homework.id}"/>
         		请选择需要上传的文件：<input type="file" id="dofile" name="file"/>
         		<button type="submit" class="submit-btn">上传文件</button>
    		 </form> 
        </div>
		</div>
	</div>

</body>
</html>