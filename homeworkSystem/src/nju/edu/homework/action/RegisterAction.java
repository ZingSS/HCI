package nju.edu.homework.action;

import java.io.IOException;
import java.sql.Timestamp;

import javax.servlet.ServletException;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import nju.edu.homework.model.User;
import nju.edu.homework.service.UserService;

@Controller
public class RegisterAction extends BaseAction{

	private static final long serialVersionUID = 1L;

	@Autowired
	private UserService userService;
	private User user;

	@Action(
			value = "register",
			results = {
					@Result(name = SUCCESS, location = "/jsp/administrator/userList.action", type="redirect"),
					@Result(name = ERROR, location = "/jsp/administrator/register.jsp")
			}
			)
	public String execute() throws ServletException,IOException{
		if (userService == null) {
			System.out.println("userService is null");
		}

		String role = request.getParameter("role");
		String name = request.getParameter("name");
		String password = request.getParameter("password");
		Timestamp createdTime = new Timestamp(System.currentTimeMillis());

		if (role == null) {
			return ERROR;
		}

		user.setName(name);
		user.setPassword(password);
		user.setRole(role);
		user.setCreatedTime(createdTime);

		userService.register(user);
		return SUCCESS;
	}

	public User getUser() {
		if (user==null) System.out.println("user null");
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}



}
