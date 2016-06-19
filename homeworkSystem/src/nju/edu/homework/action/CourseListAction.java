package nju.edu.homework.action;

import java.sql.Date;
import java.util.List;

import nju.edu.homework.model.Course;
import nju.edu.homework.model.Semester;
import nju.edu.homework.model.User;
import nju.edu.homework.service.CourseService;
import nju.edu.homework.service.SemesterService;
import nju.edu.homework.service.UserService;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

@Controller
public class CourseListAction extends BaseAction{

	private static final long serialVersionUID = 1L;
	
	@Autowired
	private CourseService courseService;
	@Autowired
	private UserService userService;
	@Autowired
	private SemesterService semesterService;
	
	private List<Course> courseList;	
	private List<User> teacherList;
	
	private Course course;
	private String[] semesterList;
	private String semester;
	
	private Semester currentSemester;
	
	private Date currentDate;
	
	@Action(value = "courseList",
			results = {
			@Result( name = SUCCESS, location = "/jsp/administrator/courseList.jsp")
	})
	public String execute() throws Exception{
		setCourseList(semesterService.getCourseOfLastSemester());
		setSelectList();
		setCurrentSemester(semesterService.getLastSemester());
		return SUCCESS;
	}

	@Action(value = "getCourseBySemester",
			results = {
			@Result( name = SUCCESS, location = "/jsp/administrator/courseList.jsp")
	})
	public String getCourseBySemester() throws Exception{
		setCourseList(semesterService.getCourseBySemester(semester));
		setSelectList();
		setCurrentSemester(semesterService.getSemester(semester));
		return SUCCESS;
	}
	
	@Action(value = "showTeacherList",
			results = {
			@Result( name = SUCCESS, location = "/jsp/administrator/addCourseTeacher.jsp")
	})
	public String showTeacherList() throws Exception{
		int id = Integer.parseInt(request.getParameter("id"));
		course = courseService.getCourseById(id);
		setCourse(course);
		setTeacherList(userService.getUserByRole("teacher"));
		return SUCCESS;
	}
	
	
	public void setSelectList(){
		List<String> semesters = semesterService.getAllStringSemesters();
		String ss[] = semesters.toArray(new String[]{});
		setSemesterList(ss);
	}

	public List<Course> getCourseList() {
		return courseList;
	}

	public void setCourseList(List<Course> courseList) {
		this.courseList = courseList;
	}

	public String getSemester() {
		return semester;
	}

	public void setSemester(String semester) {
		this.semester = semester;
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

	public List<User> getTeacherList() {
		return teacherList;
	}

	public void setTeacherList(List<User> teacherList) {
		this.teacherList = teacherList;
	}

	public Date getCurrentDate() {
		currentDate = new Date(System.currentTimeMillis());
		return currentDate;
	}

	public Semester getCurrentSemester() {
		return currentSemester;
	}

	public void setCurrentSemester(Semester currentSemester) {
		this.currentSemester = currentSemester;
	}
	

}
