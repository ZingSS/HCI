package nju.edu.homework.action;

import nju.edu.homework.model.User;
import nju.edu.homework.service.MessageUserService;
import nju.edu.homework.service.UserService;
import nju.edu.homework.util.Common;
import nju.edu.homework.vo.OnlineUserVO;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

@Controller
public class LoginAction extends BaseAction{

	private static final long serialVersionUID = 1L;

	@Autowired
	private UserService userService;
	@Autowired
	private MessageUserService messageUserService;

	private String userId;
	private String password;

	@SuppressWarnings("unchecked")
	@Action(
			value = "login",
			results = {
					@Result(name = ERROR, location = "/jsp/user/login.jsp"),
					@Result(name = Common.ROLE_ADMIN, location = "/jsp/administrator/userList.action", type = "redirect"),
					@Result(name = Common.ROLE_TEACHER, location = "/jsp/teacher/showTeacherCourseList.action", type = "redirect"),
					@Result(name = Common.ROLE_STUDENT, location = "/jsp/student/showStudentCourseList.action", type = "redirect"),
					@Result(name = Common.ROLE_DIRECTOR, location = "/jsp/director/showInitLastMonth.action", type = "redirect")
			})

	public String execute() throws Exception {
		userId = request.getParameter("userId");
		password = request.getParameter("password");
		User user = userService.login(userId, password);
		if (user == null) {
			super.addFieldError("loginMessage", "登录失败");
			return ERROR;
		}
		else {
			OnlineUserVO vo = new OnlineUserVO(user.getId(), userId, user.getName(), user.getRole());
			session.put("onlineUser", vo);
			setUnreadMessages(user.getId());
			return user.getRole();
		}
	}

	@SuppressWarnings("unchecked")
	private void setUnreadMessages(int userId){
		int number = messageUserService.getUnreadNum(userId);
		session.put("unreadMessage", number);
	}


}
