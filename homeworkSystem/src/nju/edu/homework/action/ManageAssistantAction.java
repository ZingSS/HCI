package nju.edu.homework.action;

import nju.edu.homework.service.CourseService;
import nju.edu.homework.service.UserService;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

@Controller
public class ManageAssistantAction extends BaseAction{

	private static final long serialVersionUID = 1L;
	
	@Autowired
	private CourseService courseService;
	@Autowired
	private UserService userService;
	
	private String result;

	@Action(
			value = "teacherAddAssistant",
			results = {
					@Result(name = SUCCESS, location = "/jsp/teacher/manageAssistant.jsp"),
			})
	
	public String execute() throws Exception {
		int studentId = Integer.parseInt(request.getParameter("studentId"));
		int courseId = Integer.parseInt(request.getParameter("courseId"));
		courseService.addAssistant(courseId, studentId);
		return SUCCESS;
	}
	
	@Action(
			value = "teacherRemoveAssistant",
			results = {
					@Result(name = SUCCESS, location = "/jsp/teacher/manageAssistant.jsp"),
			})
	
	public String teacherRemoveAssistant() throws Exception {
		int studentId = Integer.parseInt(request.getParameter("studentId"));
		int courseId = Integer.parseInt(request.getParameter("courseId"));
		courseService.removeAssistant(courseId, studentId);
		return SUCCESS;
	}

	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}
}
