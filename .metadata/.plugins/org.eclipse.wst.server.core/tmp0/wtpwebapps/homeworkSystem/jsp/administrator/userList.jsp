<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<% String localPath = request.getContextPath();

%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>管理用户</title>
</head>
<body>
	<s:include value="../administrator/header.jsp"></s:include>
    <div class="content">
    	<div class="left-sidebar">
    		<div class="left-title"><span>用户管理</span></div>
	    		<div id="to-add-user" class="left-btn">	
		    		<a id="add-user-btn">添加用户</a>
		    	</div>
		    	<hr/>
		        <ul>
		            <li><a href="userList.action">所有用户</a></li>
		            <li><a href="teacherList.action">所有教师</a></li>
		            <li><a href="studentList.action">所有学生</a></li>
		        </ul>
    	</div>
    	<div class="right-content">
	    	<div class="user-list">
		        <table>
		            <thead>
		            	<tr>
			                <th>编号</th>
			                <th>身份</th>
			                <th>姓名</th>
			                <th>帐号</th>
			                <th>密码</th>
			                <th>创建时间</th>
			                <th>修改信息</th>
			              	<th>删除用户</th>
			            	</tr>
		            </thead>
		            <tfoot>
		            	<tr>
		            		<td></td>
			                <td></td>
			                <td></td>
			                <td></td>
			                <td></td>
			                <td></td>
			                <td></td>
			                <td></td>
		            	</tr>
		            </tfoot>
		            <tbody>
		            	<s:iterator value="userList" >
				            <tr>
				                <td class="user-id">${ id }</td>
				                <td>${ role }</td>
				                <td class="user-name">${ name }</td>
				                <td class="user-userid">${ userId }</td>
				                <td class="user-password">${ password }</td>
				                <td>${ createdTime }</td>
				                <td class="update-user"><a class="update-td-a">修改</a></td>
				                <s:if test="%{role=='admin' || role=='director'}">
				                	<td><a class="forbid-td-a">无法删除</a></td>
				                </s:if>
				                <s:elseif test="%{role=='teacher'}">
				                	<s:if test="%{teacherCourse.size() == 0}">
				                		<td class="delete-user"><a class="delete-td-a">删除</a></td>
				                	</s:if>
				                	<s:else>
				                		<td><a class="forbid-td-a">无法删除</a></td>
				                	</s:else>
				                </s:elseif>
				                <s:else>
				                	<s:if test="%{studentCourse.size() == 0 && assistantCourse == null}">
				                		<td class="delete-user"><a class="delete-td-a">删除</a></td>
				                	</s:if>
				                	<s:else>
				                		<td><a class="forbid-td-a">无法删除</a></td>
				                	</s:else>
				                </s:else>
				            </tr>
			            </s:iterator>
		            </tbody>
		        </table>
	    	</div>
    	</div>
    </div>
    
    <div id="update-user-div">
        <div id="update-user-body">
        	<div id="update-title"><span>修改用户信息</span></div>
	        <form action="updateUser.action" method="post">
<!-- 	            <input id="update-user-id" name="user.id" readonly="readonly"><br/>
 -->	            <s:hidden name="user.id" id="update-user-id"/>
	            <input type="text" id="update-name" name="name" placeholder="修改姓名"><br/>
	            <input type="text" id="update-userId" name="userId" placeholder="修改帐号"><br/>
	            <input type="password" id="update-password" name="password" placeholder="修改密码"><br/><br />
	            <button type="button" class="cancel-btn close-btn">取消</button>
	            <button type="submit" class="submit-btn close-btn">修改</button>
	        </form>
        </div>
    </div>
    
	<div id="delete-user-div">
		<div id="delete-user-body">
			<div id="delete-title"><span>删除用户</span></div>
	    	<div id="delete-form">
	    		<span>确认删除编号为<span id="delete-id"></span>的用户</span><br/>
		    	<button id="delete-cancel" class="cancel-btn close-btn">取消</button>
		    	<button id="delete-confirm" class="submit-btn close-btn">确认</button>
	    	</div>
    	</div>
    </div>
    
    <div id="add-user-div">
    	<div id="add-user-body">
    		<div id="add-title"><span>注册新用户</span></div>
    		<form action="register.action" method="post">
		    	<div class="radio-input">
		    		<input type="radio" name="role" value="student" id="role_student"><label for="role_student">学生</label>
		        	<input type="radio" name="role" value="teacher" id="role_teacher"><label for="role_teacher">教师</label>
		    	</div>
		        <input type="text" placeholder="请输入帐号" name="user.userId"><br/>
		        <input type="password" placeholder="请输入密码" name="password"><br/>
		        <input type="text" placeholder="请输入姓名" name="name"><br/>
		        <button type="button" class="cancel-btn close-btn">取消</button>
		        <button type="submit" class="submit-btn close-btn">注册</button>
		
		    </form>
    	</div>
    </div>
    
<script type="text/javascript" src="<%=localPath %>/js/jquery.js" charset="utf-8"></script>
<script type="text/javascript" src="<%=localPath %>/js/user.js" charset="utf-8"></script>

</body>
</html>