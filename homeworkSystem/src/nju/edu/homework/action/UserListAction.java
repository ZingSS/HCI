package nju.edu.homework.action;

import java.util.List;

import nju.edu.homework.model.User;
import nju.edu.homework.service.UserService;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

@Controller
public class UserListAction extends BaseAction{

	private static final long serialVersionUID = 1L;

	@Autowired
	private UserService userService;
	private List<User> userList;

	private User user;

	@Action(value = "userList",
			results = {
			@Result( name = SUCCESS, location = "/jsp/administrator/userList.jsp")
	})
	public String execute() throws Exception{
		System.out.println("开始查询");
		setUserList(userService.getAllUsers());
		System.out.println("管理员查看所有用户名单");
		return SUCCESS;
	}

	@Action(value = "teacherList",
			results = {
			@Result( name = SUCCESS, location = "/jsp/administrator/userList.jsp")
	})
	public String getTeacherList(){
		setUserList(userService.getUserByRole("teacher"));

		return SUCCESS;
	}

	@Action(value = "studentList",
			results = { @Result( name = SUCCESS, location = "/jsp/administrator/userList.jsp")
	})
	public String getStudentList(){
		setUserList(userService.getUserByRole("student"));
		return SUCCESS;
	}

	@Action(value = "updateUser",
			results = { @Result( name = SUCCESS, location = "/jsp/administrator/userList.action", type = "redirect")
	})
	public String updateUser(){
		user = userService.getUserById(user.getId());
		user.setName(request.getParameter("name"));
		user.setUserId(request.getParameter("userId"));
		user.setPassword(request.getParameter("password"));
		userService.update(user);
		return SUCCESS;
	}

	@Action(value = "deleteUser",
			results = { @Result( name = SUCCESS, location = "/jsp/administrator/userList.jsp")
	})
	public String deleteUser(){
		userService.deleteById(Integer.parseInt(request.getParameter("id")));
		return SUCCESS;
	}

	public List<User> getUserList() {
		return userList;
	}

	public void setUserList(List<User> userList) {
		this.userList = userList;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}



}
