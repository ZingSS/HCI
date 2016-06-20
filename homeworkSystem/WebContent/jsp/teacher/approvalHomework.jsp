<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<% String localPath = request.getContextPath();

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><s:property value="homework.name"/></title>
</head>
<body>
	<s:include value="../teacher/header.jsp"></s:include>
	<div class="content">
		<s:include value="../teacher/courseSide.jsp"></s:include>
		
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
		<s:if test="%{homework.studentDDL > currentTime}">
			<div class="homework-commit-state">
				<span>正在提交中</span>
				<a>修改作业</a>
			</div>
		</s:if>
		<s:elseif test="%{homework.studentDDL < currentTime && homework.assistantDDL > currentTime && homework.state=='commit'}">
			<div class="homework-commit-state">
				<span>正在批改中</span>
			</div>
			</s:elseif>
		<s:else>
			<div class="homework-example">
	            <s:if test="%{homework.state == 'pass'}">
					<s:if test="%{homework.publishFileId == 0}">
						<span class="info-title">作业样例&点评：</span>
						<span><a id="to-add-example"class="add-td-a">上传样例</a></span>
					</s:if>
					<s:else>
						<span class="info-title">作业样例&点评：</span>
						<span><a href="downloadExample.action?fileId=${homework.publishFileId}" class="download-td-a">下载样例&点评</a></span>
					</s:else>
				</s:if>
		</div>
		
		<div class="homework-stat">
			<div class="h-stat-card">
				<div class="h-stat-header">作业情况分析</div>
				<div class="h-stat-chart"></div>
				<div class="h-stat-data">
					<hr/>
					<span>最高分：</span>
					<span>最低分：</span>
					<span>平均分：</span>
				</div>
			</div>
			<div class="homework-btns">
				<s:if test="%{homework.state == 'approval'}">
            	<div class="approval-result">
	            	<span><a id="failed-approval" class="delete-td-a">不合格并重新批改</a></span>
	            	<span><a id="pass-approval" class="update-td-a">通过批改并发布成绩</a></span>
	            </div>
	            </s:if>
	            <s:elseif test="%{homework.state == 'pass'}"><a class="forbid-td-a">已经通过审批</a></s:elseif>
	            <s:elseif test="%{homework.state == 'commit'}"><a class="forbid-td-a">等待助教审批</a></s:elseif>
			</div>
		</div>   
		<div class="homework-scores">
            <table>
                <tr>
                    <!-- <th>编号</th> -->
                    <th>学生学号</th>
                    <th>学生姓名</th>
                    <th>作业</th>
                    <th>成绩</th>
                    <th>点评</th>
                </tr>
                <s:iterator value="studentList" >
		            <tr class="homework-line">
		                <%-- <td class="hidden-id">${ id }</td> --%>
		                <td>${ studentId }</td>
		                <td>${ name }</td>
		                <td>
			               	<s:if test="%{submit}">
			                	<a href="downloadHomework.action?studentId=<s:property value="id"/>&homeworkId=<s:property value="homework.id"/>" class="download-td-a">
			                	下载作业
			                	</a>
			                </s:if>
			                <s:else>
			                	未提交
			                </s:else>
		                </td>
		                <td>${ grade }</td>
		                <td>${ comment }</td>
		            </tr>
			</s:iterator>
            </table>
            
        </div>
		</s:else>
		
		</div>
		
	</div>
	
	<div id="upload-div">
		<h3>上传作业样例及点评</h3>
		<form action="uploadExample.action?homeworkId=<s:property value="homework.id"/>&courseId=<s:property value="courseId"/>" method="post" enctype="multipart/form-data">
			<label>上传文件</label><input type="file" name="file"><br/>
			<button>取消</button>
			<button type="submit" id="upload-example-btn">上传</button>
		</form>
	</div>
	
	<div id="add-example-div">
    	<div id="add-example-body">
    		<div id="add-example-title"><span>上传样例&点评</span></div>
    		<form action="uploadExample.action?homeworkId=<s:property value="homework.id"/>&courseId=<s:property value="courseId"/>" method="post" enctype="multipart/form-data">
				<label>上传文件</label><input type="file" name="file"><br/>
				<button type="button" class="cancel-btn close-btn">取消</button>
				<button type="submit" class="submit-btn close-btn">上传</button>
			</form>
    	</div>
    </div>
<script type="text/javascript" src="<%=localPath %>/js/jquery.js" charset="utf-8"></script>
<script type="text/javascript" src="<%=localPath %>/js/approval.js" charset="utf-8"></script>

</body>
</html>