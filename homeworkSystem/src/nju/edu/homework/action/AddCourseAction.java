package nju.edu.homework.action;

import java.util.List;

import nju.edu.homework.model.Course;
import nju.edu.homework.service.CourseService;
import nju.edu.homework.service.SemesterService;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

@Controller
public class AddCourseAction extends BaseAction{

	private static final long serialVersionUID = 1L;

	@Autowired
	private CourseService courseService;
	@Autowired
	private SemesterService semesterService;

	private Course course;
	private String[] semesterList;
	private String[] activeSemesterList;


	@Action(value = "addCourse",
			results = {
			@Result( name = SUCCESS, location = "/jsp/administrator/addCourse.jsp")
	})
	public String addCourseBySemester() throws Exception{
		setSelectList();
		return SUCCESS;
	}


	@Action(value = "addOneCourse",
			results = {
			@Result( name = SUCCESS, location = "/jsp/administrator/courseList.action", type="redirect"),
			@Result( name = ERROR, location = "/jsp/administrator/addCourse.action", type="redirect")
	})
	public String addOneCourse() throws Exception{
//		setTeacherList(userService.getUserByRole("teacher"));
		String day = request.getParameter("day");
		String begin = request.getParameter("begin");
		String end = request.getParameter("end");
		course.setTime(day + " 第"+begin + "-" + end + "节");
		int semesterId = semesterService.getSemesterByName(request.getParameter("semester"));
		if (semesterId == 0) {
			return ERROR;
		}
		courseService.addCourse(course, semesterId);
		return SUCCESS;
	}

	private void setSelectList(){
		List<String> activeSemesters = semesterService.getActiveStringSemester();
		String activeSS[];
		if (activeSemesters == null) {
			activeSS = null;
		}
		else{
			activeSS = activeSemesters.toArray(new String[]{});
		}
		setActiveSemesterList(activeSS);
		List<String> semesters = semesterService.getAllStringSemesters();
		String ss[] = semesters.toArray(new String[]{});
		setSemesterList(ss);
	}


	public String[] getSemesterList() {
		return semesterList;
	}

	public void setSemesterList(String[] semesterList) {
		this.semesterList = semesterList;
	}


	public Course getCourse() {
		return course;
	}


	public void setCourse(Course course) {
		this.course = course;
	}


	public String[] getActiveSemesterList() {
		return activeSemesterList;
	}


	public void setActiveSemesterList(String[] activeSemesterList) {
		this.activeSemesterList = activeSemesterList;
	}



}
