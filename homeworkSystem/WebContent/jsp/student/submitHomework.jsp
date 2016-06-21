<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@page import="nju.edu.homework.vo.OnlineUserVO"%>
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
				<s:if test="%{homework.description == ''}">
					<span class="homework-des">无作业描述</span>
				</s:if>
				<s:elseif test="%{homework.description.length()>30}">
					<span class="homework-des"><s:property value="homework.description.substring(0,30)"/>...</span>
				</s:elseif>
				<s:else><span class="homework-des">${ homework.description }</span></s:else>
			</div>
			<div class="h-title-bottom">
				<div class="h-title-btm-left"></div>
				<div class="h-title-btm-right">
					<span>作业提交格式：<s:property value="homework.fileType"/></span>
                	<span id="h-title-attach">
	                	<s:if test="%{homework.fileId != 0}">
				            	<a href="downloadAttachment.action?fileId=${ homework.fileId }" id="download-file"><img alt="下载" src="../../image/down-white.png"> 附件</a>
				        </s:if>
				       	<s:else>无附件</s:else>
               		</span>
				</div>
			</div>
		</div>
			
			<div>
				<!-- 提交中 -->
				<s:if test="%{homework.studentDDL > homework.currentTime}"> 
					<div class="homework-commit-state">
						<form action="submitHomework.action" method="post" enctype="multipart/form-data" >   
			        		<s:hidden name="courseId" value="%{courseId}"/>
			        		<s:hidden name="homeworkId" value="%{homework.id}"/>
			         		请选择需要上传的文件：<input type="file" id="dofile" name="file"/>
			         		<button type="submit" class="submit-btn">上传文件</button>
			    		 </form> 
					</div>
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
			    	<div id="student-grade">
			    		<div id="s-grade-left">
			    			<span id="s-grade-span">83</span><span id="s-comment-span">没有说清楚细节</span>
			    		</div>
			    		<div id="s-grade-right">
			    			<span>
				    			<a href="downloadAttachment.action?fileId=${ studentHomework.publishFileId }" class="">
				    			<img alt="下载" src="../../image/down-white.png">样例&点评
				    			</a>
			    			</span>
			    			<span>
				    			<a href="downloadHomework.action?studentId=<%=((OnlineUserVO)session.getAttribute("onlineUser")).getId()%>&homeworkId=<s:property value="homework.id"/>">
				    			<img alt="下载" src="../../image/down-white.png">作业下载
				    			</a>
			    			</span>
			    		</div>
			    	</div>
			    	<div>图表</div>
			    </s:elseif>
			    <s:else>
			    	<span>未公布</span>
			    </s:else>
        	
			<%-- <div>
				<div class="s-homework-stat">
				</div>
				<div>
					<span>我的成绩<s:property value="studentHomework.grade"/></span>
					<br/>
					<span><a href="downloadAttachment.action?fileId=${ studentHomework.publishFileId }" class="download-td-a">样例&点评</a></span>
					<span></span>
				</div>
			</div> --%>
        </div>
		</div>
	</div>

</body>
</html>