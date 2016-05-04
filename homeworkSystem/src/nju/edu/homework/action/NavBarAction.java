package nju.edu.homework.action;


import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.stereotype.Controller;

@Controller 
public class NavBarAction extends BaseAction{

	private static final long serialVersionUID = 1L;
	
	@Action(
			value = "logout",
			results = {
					@Result(name = SUCCESS, location = "/jsp/user/login.jsp"),
			})
	
	public String logout() throws Exception {
		session.clear();
		return SUCCESS;
	}

	
	

}
