package nju.edu.homework.action;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.List;

import nju.edu.homework.model.Course;
import nju.edu.homework.model.Homework;
import nju.edu.homework.service.CourseService;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

@Controller
public class HomeworkAction extends BaseAction{

	private static final long serialVersionUID = 1L;
	
	@Autowired
	private CourseService courseService;
	
	private List<Homework> homeworkList;
	
	private Course course;
	private String courseName;
	private int courseId;
	private String errorMessage;
	
	private Timestamp currentTime;
	
	private Date currentDate;

	@Action(
			value = "showTeacherHomeworkList",
			results = {
					@Result(name = SUCCESS, location = "/jsp/teacher/courseHomeworkList.jsp"),
			})
	public String execute() throws Exception {
		int id = Integer.parseInt(request.getParameter("courseId"));
		System.out.println(id);
		setCourse(courseService.getCourseById(id));
		setHomeworkList(courseService.getHomeworkByCourseId(id));
		return SUCCESS;
	}
	
	@Action(
			value = "toAddHomework",
			results = {
					@Result(name = SUCCESS, location = "/jsp/teacher/addHomework.jsp"),
			})
	public String toAddHomework() throws Exception {
		int id = Integer.parseInt(request.getParameter("courseId"));
		setCourse(courseService.getCourseById(id));
		setCourseName(course.getName());
		setCourseId(id);
		
		return SUCCESS;
	}
	

	public List<Homework> getHomeworkList() {
		return homeworkList;
	}

	public void setHomeworkList(List<Homework> homeworkList) {
		this.homeworkList = homeworkList;
	}

	public String getCourseName() {
		return courseName;
	}

	public void setCourseName(String courseName) {
		this.courseName = courseName;
	}

	public int getCourseId() {
		return courseId;
	}

	public void setCourseId(int courseId) {
		this.courseId = courseId;
	}

	public String getErrorMessage() {
		return errorMessage;
	}

	public void setErrorMessage(String errorMessage) {
		this.errorMessage = errorMessage;
	}

	public Timestamp getCurrentTime() {
		currentTime = new Timestamp(System.currentTimeMillis());
		return currentTime;
	}

	public Course getCourse() {
		return course;
	}

	public void setCourse(Course course) {
		this.course = course;
	}

	public Date getCurrentDate() {
		currentDate = new Date(System.currentTimeMillis());
		return currentDate;
	}

}
