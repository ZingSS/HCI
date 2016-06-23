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
	<div class="homework-title">
			<div class="h-title-top">
				<div class="h-title-name">
					<span id="h-title-name"><s:property value="homework.name"/></span>
					<span id="h-title-id">No.<s:property value="homework.id"/></span>
				</div>
				<div class="h-title-time">
					<span>提交截止：<s:property value="homework.studentDDL"/></span>
					<span>批改截止：<s:property value="homework.assistantDDL"/></span>
				</div>
			</div>
			<div class="h-title-mid">
				<span><s:property value="homework.description"/></span>
			</div>
			<div class="h-title-bottom">
				<div class="h-title-btm-left"></div>
				<div class="h-title-btm-right">
					<span>作业提交格式：<s:property value="homework.fileType"/></span>
                	<span id="h-title-attach">
	                	<s:if test="%{homework.fileId != 0}">
			            	<a href="downloadAttachment.action?fileId=${ homework.fileId }" class="a-attach">
			            		<img alt="下载" src="../../image/down-white.png">下载附件
			            	</a>
			            </s:if>
			            <s:else>
			            	无附件
			            </s:else>
               		</span>
				</div>
			</div>
		</div>

</body>
</html>