package nju.edu.homework.action;

import nju.edu.homework.service.CourseService;
import nju.edu.homework.service.UserService;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

@Controller
public class AddStudentAction extends BaseAction{

	private static final long serialVersionUID = 1L;
	
	@Autowired
	private CourseService courseService;
	@Autowired
	private UserService userService;
	
	@Action(
			value = "teacherAddStudent",
			results = {
					@Result(name = SUCCESS, location = "/jsp/teacher/addStudent.jsp"),
			})
	
	public String execute() throws Exception {
		int studentId = Integer.parseInt(request.getParameter("studentId"));
		int courseId = Integer.parseInt(request.getParameter("courseId"));
		courseService.addStudent(courseId, studentId);
		return SUCCESS;
	}
	
	@Action(
			value = "teacherRemoveStudent",
			results = {
					@Result(name = SUCCESS, location = "/jsp/teacher/addStudent.jsp"),
			})
	
	public String teacherRemoveStudent() throws Exception {
		int studentId = Integer.parseInt(request.getParameter("studentId"));
		int courseId = Integer.parseInt(request.getParameter("courseId"));
		courseService.removeStudent(courseId, studentId);
		return SUCCESS;
	}
	
}
