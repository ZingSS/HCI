<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<% String localPath = request.getContextPath();%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>注册新用户</title>
</head>
<body>
	<s:include value="../administrator/header.jsp"></s:include>
    <div class="content">
    	<div class="left-sidebar">
    		<div class="left-title"><span>用户管理</span></div>
	    		<div id="to-add-user" class="left-btn">	
		    		<a href="register.jsp">添加用户</a>
		    	</div>
		    	<hr/>
		        <ul>
		            <li><a href="userList.action">所有用户</a></li>
		            <li><a href="teacherList.action">所有教师</a></li>
		            <li><a href="studentList.action">所有学生</a></li>
		        </ul>
    	</div>
    	<div class="right-content">
		    <form action="<%=localPath %>/administrator/register.action" method="post">
		    	<div class="radio-input">
		    		<input type="radio" name="role" value="student">学生<br/>
		        	<input type="radio" name="role" value="teacher">教师
		    	</div>
				
		        <input type="text" placeholder="请输入帐号" name="user.userId"><br/>
		        <input type="password" placeholder="请输入密码" name="password"><br/>
		        <input type="text" placeholder="请输入姓名" name="name"><br/>
		        <button type="button">取消</button>
		        <button type="submit">注册</button>
		
		    </form>
	    </div>
    </div>

</body>
</html>