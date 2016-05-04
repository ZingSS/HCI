package nju.edu.homework.action;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import nju.edu.homework.model.Course;
import nju.edu.homework.model.User;
import nju.edu.homework.service.CourseService;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

@Controller
public class TeacherCourseAction extends BaseAction{

	private static final long serialVersionUID = 1L;
	
	@Autowired
	private CourseService courseService;

	private List<User> inCourseAssistantList;
	private List<User> studentList;
	private Course course;
	
	private Date currentDate;
	
	/**
	 * 这个方法用于展示老师的某个课程页面
	 * @return
	 * @throws Exception
	 */
	@Action(
			value = "teacherCourse",
			results = {
					@Result(name = SUCCESS, location = "/jsp/teacher/teacherCourse.jsp"),
			})
	public String teacherCourse() throws Exception {
		int id = Integer.parseInt(request.getParameter("courseId"));
		setCourse(courseService.getCourseById(id));
		List<User> list = new ArrayList<User>(courseService.getStudentsByCourseId(id));

		setInCourseAssistantList(courseService.getAssistantByCourse(id));
		setStudentList(list);
		return SUCCESS;
	}

	public List<User> getInCourseAssistantList() {
		return inCourseAssistantList;
	}

	public void setInCourseAssistantList(List<User> inCourseAssistantList) {
		this.inCourseAssistantList = inCourseAssistantList;
	}

	public List<User> getStudentList() {
		return studentList;
	}

	public void setStudentList(List<User> studentList) {
		this.studentList = studentList;
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
