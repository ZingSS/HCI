package nju.edu.homework.action;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.List;

import nju.edu.homework.model.Course;
import nju.edu.homework.model.Homework;
import nju.edu.homework.model.User;
import nju.edu.homework.service.CourseService;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;


@Controller
public class AssistantHomeworkListAction extends BaseAction{

	private static final long serialVersionUID = 1L;
	
	@Autowired
	private CourseService courseService;
	
	private Course course;
	private List<Homework> homeworkList;
	private List<User> assistantList;
	
	private Timestamp currentTime; 
	private Date currentDate;
	
	@Action(
			value = "showStudentsHomework",
			results = {
					@Result(name = SUCCESS, location = "/jsp/student/assistantHomework.jsp"),
			})
	
	public String showStudentsHomework() throws Exception {
		int courseId = Integer.parseInt(request.getParameter("courseId"));
		setCourse(courseService.getCourseById(courseId));
		setHomeworkList(courseService.getHomeworkByCourseId(courseId));
		setAssistantList(courseService.getAssistantByCourse(courseId));
		return SUCCESS;
	}


	public Course getCourse() {
		return course;
	}

	public void setCourse(Course course) {
		this.course = course;
	}

	public List<Homework> getHomeworkList() {
		return homeworkList;
	}

	public void setHomeworkList(List<Homework> homeworkList) {
		this.homeworkList = homeworkList;
	}

	public List<User> getAssistantList() {
		return assistantList;
	}

	public void setAssistantList(List<User> assistantList) {
		this.assistantList = assistantList;
	}

	public Timestamp getCurrentTime() {
		currentTime = new Timestamp(System.currentTimeMillis());
		return currentTime;
	}

	public Date getCurrentDate() {
		currentDate = new Date(System.currentTimeMillis());
		return currentDate;
	}


}
