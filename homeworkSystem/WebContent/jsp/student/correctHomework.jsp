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
<title>课程作业列表</title>
</head>
<body>
	<s:include value="../student/header.jsp"></s:include>
	<div class="content">
		<s:include value="../assistant/courseSide.jsp"></s:include>
		<div class="right-content">
			<s:hidden name="courseId" value="%{courseId}"/>
			<s:hidden name="homeworkId" value="%{homework.id}" id="homework-id"/>
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
				            	<a href="downloadAttachment.action?fileId=${ homework.fileId }" id="download-file"><img alt="下载" src="../../image/down-white.png"> 附件</a>
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
			<s:if test="%{homework.state == 'commit' && homework.studentDDL > currentTime}"> 
				<div>学生提交中</div>
			</s:if>
			<s:else>
						<div id="a-h-excel">
				<div id="a-h-output">
	            	<a href="exportStudentListExcel.action?courseId=<s:property value="course.id"/>&homeworkId=<s:property value="homework.id"/>" class="a-button">导出名单</a>
	            </div>
				<div id="a-h-input">
					<s:if test="%{homework.studentDDL < currentTime && homework.assistantDDL > currentTime && homework.state == 'commit'}">
						<form action="uploadGrade.action" method="post" enctype="multipart/form-data" id="export-form">   
			        		<s:hidden name="courseId" value="%{course.id}"/>
			        		<s:hidden name="homeworkId" value="%{homework.id}"/>
			         		<span class="info-title">选择文件：</span><input type="file" id="dofile" name="file"/>
			         		<button type="submit" class="a-button">导入成绩</button>
			    		 </form> 
		            </s:if>
				</div>
			</div>
           
            <table id="a-student-table" class="main-table">
                <tr>
                    <!-- <th>编号</th> -->
                    <th class="a-s-id">学号</th>
                    <th class="a-s-name">姓名</th>
                    <th class="a-s-hw">作业</th>
                    <th class="a-s-grade">成绩</th>
                    <th class="a-s-comment">点评</th>
                </tr>
                <tr class="scroll-tr">
				<td colspan="5" class="inner-td">
					<div class="scorll-table">
					<table class="inner-table"><tbody>
						<s:iterator value="studentList" >
				            <tr class="homework-line">
				                <input type="hidden" value="${id}" class="hidden-id">
				                <td class="a-s-id">${ studentId }</td>
				                <td class="a-s-name">${ name }</td>
				                <td class="download-td a-s-hw">
					               	<s:if test="%{submit}">
					                	<a href="downloadHomework.action?studentId=<s:property value="id"/>&homeworkId=<s:property value="homework.id"/>">
					                	<img alt="下载" src="../../image/down-black.png">
					                	</a>
					                </s:if>
					                <s:else>
					                	未提交
					                </s:else>
				                </td>
				                <td class="a-s-grade change-grade changable-td">
					                <span>
						                <s:if test="%{grade == ''}">0</s:if>
						                <s:else>${ grade }</s:else>
						                <s:if test="%{homework.state == 'commit'}"><img alt="编辑" src="../../image/edit.png"></s:if>
					                </span>
				                </td>
				                <td class="a-s-comment change-comment changable-td">
					                <span>
						                <s:if test="%{comment == ''}">暂无</s:if>
						                <s:else>${ comment }</s:else>
						                <s:if test="%{homework.state == 'commit'}"><img alt="编辑" src="../../image/edit.png"></s:if>
					                </span>
				                </td>
				            </tr>
						</s:iterator>
						</tbody>
						</table>
					</div>
				</td>
				</tr>
                
            </table>
            <div class="a-result-btns">
            	<s:if test="%{course.semester.startTime.after(currentDate) || course.semester.endTime.before(currentDate)}">
            	</s:if>
            	<s:elseif test="%{homework.studentDDL < currentTime && homework.assistantDDL > currentTime && homework.state == 'commit'}">
            		<span id="auto-saving"></span>
            		<a id="correct-save" class="a-btn-cancel">
						保存
					</a>
					<span>
					<a onclick="showImg()" href="informTeacher.action?courseId=<s:property value="course.id"/>&homeworkId=<s:property value="homework.id"/>" class="a-btn-confirm">
						保存并提交
					</a>
					</span>
            	</s:elseif>
            	<s:elseif test="%{homework.state == 'approval'}">
            		<span><a class="a-btn-forbid">等待审批</a></span>
            	</s:elseif>
            	
            </div>
			</s:else>

        </div>
		</div>
		<
		<div class="loading-img"><img alt="加载" src="../../image/loading.gif"></div>
		
	</div>
<script type="text/javascript" src="<%=localPath %>/js/jquery.js" charset="utf-8"></script>
<script type="text/javascript" src="<%=localPath %>/js/homework.js" charset="utf-8"></script>
<script>
function showImg(){
	$(".loading-img").css({"display":"block"});
}
</script>
</body>
</html>