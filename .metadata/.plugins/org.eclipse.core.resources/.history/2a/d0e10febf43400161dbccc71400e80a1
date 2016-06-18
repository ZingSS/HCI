<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<% String localPath = request.getContextPath();%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><s:property value="course.name"/>-课程作业</title>
</head>
<body>
	<s:include value="../teacher/header.jsp"></s:include>
	<div class="content">
		<s:include value="../teacher/courseSide.jsp"></s:include>
		<div class="right-content">
			<div class="course-info right-info-div">
			<s:hidden value=" %{course.id}" id="course-id"/>
        	<div>
                <span class="info-title">学期：</span>
                <span><s:property value="course.semester.name"/></span>
            </div>
            <div>
                <span class="info-title">课程号：</span>
                <span><s:property value="course.courseId"/></span>
                <span class="info-title second-span">课程名称：</span>
                <span id="course-name"><s:property value="course.name"/></span>
            </div>
            <div>
                <span class="info-title">上课时间：</span>
                <span><s:property value="course.time"/></span>
                <span class="info-title second-span">上课地点：</span>
                <span><s:property value="course.location"/></span>
            </div>
            <div>
                <span class="info-title">助教：</span>
               	<s:iterator value="%{course.assistant}" >
                <span>${ name }</span>
                </s:iterator>
                <s:if test="%{course.semester.startTime.after(currentDate)}">
                	<a href="assistantManagement.action?courseId=<s:property value="course.id"/>" class="add-td-a">管理助教</a>
                </s:if>
            </div>
        </div>
       
        <s:if test="%{course.semester.startTime.after(currentDate)}">
        	<div class="right-info-div"><span>学期尚未开始，无法布置作业</span></div>
        </s:if>
        <s:else>
        	<div class="right-info-div">
	        	<ul>
	        		<s:if test="%{course.semester.endTime.after(currentDate)}">
	        			<%-- <li><a href="toAddHomework.action?courseId=<s:property value="course.id"/>" class="add-td-a">添加作业</a></li> --%>
	        			<li><a class="add-td-a" id="to-add-homework">添加作业</a></li>
        			</s:if>       
<!-- 	                <li><a href="">所有作业</a></li>
	                <li><a href="">待审核作业</a></li>
	                <li><a href="">已完结作业</a></li> -->
	            </ul>
	        </div>
	
	        <div>
	            <table>
	                <tr>
	                    <th>作业编号</th>
	                    <th>作业标题</th>
	                    <th>作业描述</th>
	                    <th>提交格式</th>
	                    <th>学生提交截止时间</th>
	                    <th>助教批改截止时间</th>
	                    <th>附件</th>
	                    <th>作业状态</th>
	                </tr>
					<s:iterator value="homeworkList" >
			            <tr>
			                <td class="">${ id }</td>
			                <td>${ name }</td>
			                <td>${ description }</td>
			                <td>${ fileType }</td>
			                <td>${ studentDDL }</td>
			                <td>${ assistantDDL }</td>
			                <td>
			                	<s:if test="%{fileId != 0}">
			                		<a href="downloadAttachment.action?fileId=${ fileId }" class="download-td-a">下载附件</a>
			                	</s:if>
			                	<s:else>
			                		无
			                	</s:else>
			                </td>
			                <td class="homework-state">
			                <s:if test="%{studentDDL > currentTime}">
			                	提交阶段
			                </s:if>
			                <s:elseif test="%{studentDDL < currentTime && assistantDDL > currentTime && state=='commit'}">
			                	批改阶段
			                </s:elseif>
			                <s:elseif test="%{assistantDDL > currentTime && state=='approval'}">
			                	<a href="toApprovalHomework.action?homeworkId=<s:property value="id"/>&courseId=<s:property value="course.id"/>" class="update-td-a">审批批改</a>
			                </s:elseif>
			                <s:elseif test="%{state=='pass'}">
			                	<a href="toApprovalHomework.action?homeworkId=<s:property value="id"/>&courseId=<s:property value="course.id"/>" class="update-td-a">已公布</a>
			                </s:elseif>
			                <s:else>
			                	<a href="toApprovalHomework.action?homeworkId=<s:property value="id"/>&courseId=<s:property value="course.id"/>" class="update-td-a">查看</a>
			                </s:else>
			                </td>
			            </tr>
				</s:iterator>
	            </table>
	        </div>
        </s:else>
		</div>
            
    </div>
    
    <div id="add-homework-div">
    	<div id="add-homework-body">
    		<div id="add-homework-title"><span>为课程<span id="homework-course-name"></span>添加作业</span></div>
    		<form action="addHomework.action" method="post" enctype="multipart/form-data">
	            <div>
	                <s:hidden name="courseId" id="hidden-couse-id"/>
	            </div>
	            <div>
	                <label>作业名</label>
	                <input type="text" name="homework.name">
	            </div>
	            <div class="description-div">
	                <label>作业描述</label>
	                <textarea name="homework.description"></textarea>
	            </div>
	            <div class="short-input-div">
	                <label>学生提交截止日期</label>
	                <input type="text" placeholder="年份" name="sddlYear">
	                <input type="text" placeholder="月份" name="sddlMonth">
	                <input type="text" placeholder="日期" name="sddlDay">
	            </div>
	            <div class="short-input-div">
	                <label>助教批改截止日期</label>
	                <input type="text" placeholder="年份" name="addlYear">
	               	<input type="text" placeholder="月份" name="addlMonth">
	                <input type="text" placeholder="日期" name="addlDay">
	            </div>
	            <div>
	                <label>作业格式</label>
	                <input type="text" name="homework.fileType">
	            </div>
	            <div>
	                <label>附件</label>
	                <input type="file" name="file">
	            </div>
	            <button type="button" class="cancel-btn close-btn">取消</button>
	            <button type="submit" class="submit-btn close-btn">添加</button>
        	</form>
    	</div>
    </div>
    
<script type="text/javascript" src="<%=localPath %>/js/jquery.js" charset="utf-8"></script>
<script type="text/javascript" src="<%=localPath %>/js/homework.js" charset="utf-8"></script>

</body>
</html>