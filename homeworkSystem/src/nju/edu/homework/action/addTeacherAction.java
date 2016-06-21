package nju.edu.homework.action;

import java.util.List;

import nju.edu.homework.model.Course;
import nju.edu.homework.model.User;
import nju.edu.homework.service.CourseService;
import nju.edu.homework.service.SemesterService;
import nju.edu.homework.service.UserService;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

@Controller
public class addTeacherAction extends BaseAction{

	private static final long serialVersionUID = 1L;

	@Autowired
	private CourseService courseService;
	@Autowired
	private UserService userService;
	@Autowired
	private SemesterService semesterService;

	private Course course;

	private List<User> teacherList;
	private List<Boolean> isInCourse;

	private String[] semesterList;

	@Action(value = "addCourseTeacherList",
			results = {
			@Result( name = SUCCESS, location = "/jsp/administrator/addCourseTeacher.jsp")
	})
	public String execute() throws Exception{
		int id = Integer.parseInt(request.getParameter("id"));
		course = courseService.getCourseById(id);
		setCourse(course);
		setTeacherList(userService.getUserByRole("teacher"));
		setIsInCourse(courseService.isUserInCourse(getTeacherList(), id));
		setSelectList();
		return SUCCESS;
	}

	@Action(value = "addTeacher",
			results = {
			@Result( name = SUCCESS, location = "/jsp/administrator/addCourseTeacher.jsp")
	})
	public String addOneTeacher() throws Exception{
		int teacherId = Integer.parseInt(request.getParameter("teacherId"));
		int courseId = Integer.parseInt(request.getParameter("courseId"));
		courseService.addTeacher(teacherId, courseId);
		setSelectList();
		return SUCCESS;
	}

	@Action(value = "removeTeacher",
			results = {
			@Result( name = SUCCESS, location = "/jsp/administrator/addCourseTeacher.jsp")
	})
	public String removeTeacher() throws Exception{
		int teacherId = Integer.parseInt(request.getParameter("teacherId"));
		int courseId = Integer.parseInt(request.getParameter("courseId"));
		courseService.removeTeacher(teacherId, courseId);
		setSelectList();
		return SUCCESS;
	}

	public Course getCourse() {
		return course;
	}

	private void setSelectList(){
		List<String> semesters = semesterService.getAllStringSemesters();
		String ss[] = semesters.toArray(new String[]{});
		setSemesterList(ss);
	}

	public void setCourse(Course course) {
		this.course = course;
	}

	public List<User> getTeacherList() {
		return teacherList;
	}

	public void setTeacherList(List<User> teacherList) {
		this.teacherList = teacherList;
	}

	public List<Boolean> getIsInCourse() {
		return isInCourse;
	}

	public void setIsInCourse(List<Boolean> isInCourse) {
		this.isInCourse = isInCourse;
	}

	public String[] getSemesterList() {
		return semesterList;
	}

	public void setSemesterList(String[] semesterList) {
		this.semesterList = semesterList;
	}

}
