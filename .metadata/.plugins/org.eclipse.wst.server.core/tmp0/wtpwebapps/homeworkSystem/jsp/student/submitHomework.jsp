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
			<s:hidden name="courseId" value="%{courseId}"/>
		<div class="homework-title">
			<div class="h-title-top">
				<div class="h-title-name">
					<span id="h-title-name"><s:property value="homework.name"/></span>
					<span id="h-title-id">No.<s:property value="homework.id"/></span>
				</div>
				<div class="h-title-time">
					<span><s:property value="homework.studentDDL"/></span>
					<span><s:property value="homework.assistantDDL"/></span>
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
			            	<a href="downloadAttachment.action?fileId=${ homework.fileId }" class="download-td-a">下载附件</a>
			            </s:if>
			            <s:else>
			            	无附件
			            </s:else>
               		</span>
				</div>
			</div>
		</div>
			
			<div>
				<!-- 提交中 -->
				<s:if test="%{homework.studentDDL > homework.currentTime}"> 
					<span>提交中</span>
				</s:if>
				<!-- 批改中 -->
				<s:elseif test="%{homework.studentDDL < homework.currentTime && homework.assistantDDL > homework.currentTime}">
					<<span>批改中</span>
				</s:elseif>
				<s:elseif test="%{homework.assistantDDL > homework.currentTime && homework.state=='approval'}">
					<span class="homework-done">待审批</span>
				</s:elseif>
				<!-- 教师审批中/已经公布／其它 -->
			    <s:elseif test="%{homework.state=='pass'}">
			    	<span>公布</span>
			    </s:elseif>
			    <s:else>
			    	<span>未公布</span>
			    </s:else>
        	<div class="homework-commit-state">
						<form action="submitHomework.action" method="post" enctype="multipart/form-data" >   
			        		<s:hidden name="courseId" value="%{courseId}"/>
			        		<s:hidden name="homeworkId" value="%{homework.id}"/>
			         		请选择需要上传的文件：<input type="file" id="dofile" name="file"/>
			         		<button type="submit" class="submit-btn">上传文件</button>
			    		 </form> 
			</div>
			<div>
				<div class="s-homework-stat">
				</div>
				<div>
					<span>我的成绩<s:property value="studentHomework.grade"/></span>
					<br/>
					<span><a href="downloadAttachment.action?fileId=${ studentHomework.publishFileId }" class="download-td-a">样例&点评</a></span>
					<span></span>
				</div>
			</div>
        </div>
		</div>
	</div>

</body>
</html>