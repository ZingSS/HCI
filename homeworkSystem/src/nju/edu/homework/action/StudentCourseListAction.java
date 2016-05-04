package nju.edu.homework.action;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import nju.edu.homework.model.Course;
import nju.edu.homework.service.CourseService;
import nju.edu.homework.service.SemesterService;
import nju.edu.homework.service.UserService;
import nju.edu.homework.vo.OnlineUserVO;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

@Controller
public class StudentCourseListAction extends BaseAction{

	private static final long serialVersionUID = 1L;
	
	@Autowired
	private CourseService courseService;
	@Autowired
	private UserService userService;
	@Autowired
	private SemesterService semesterService;
	
	private List<Course> courseList;
	
	private Course assistantCourse;
	private int courseId;
	private Course course;
	
	private Timestamp currentTime;
	private Date currentDate;
	
	private Map<String, List<Course>> semesterCourseList;
	
	@Action(
			value = "showStudentCourseList",
			results = {
					@Result(name = SUCCESS, location = "/jsp/student/studentCourseList.jsp"),
			})
	
	public String execute() throws Exception {
		int id = ((OnlineUserVO)session.get("onlineUser")).getId();
		setCourseList(courseService.getCourseByStudentId(id));
		setAssistantCourse(userService.getAssistantCourseByid(id));
		// 按学期划分课程
		List<String> semesters = semesterService.getAllStringSemesters();
		semesterCourseList = new LinkedHashMap<String, List<Course>>();
		for(String semester : semesters){
			List<Course> oneSemesterCourse = new ArrayList<Course>();
			for(Course course : courseList){
				if (semester.equals(course.getSemester().getName())) {
					oneSemesterCourse.add(course);
				}
			}
			
			semesterCourseList.put(semester, oneSemesterCourse);
		}
		return SUCCESS;
	}
	
	public List<Course> getCourseList() {
		return courseList;
	}

	public void setCourseList(List<Course> courseList) {
		this.courseList = courseList;
	}


	public int getCourseId() {
		return courseId;
	}


	public void setCourseId(int courseId) {
		this.courseId = courseId;
	}


	public Course getCourse() {
		return course;
	}


	public void setCourse(Course course) {
		this.course = course;
	}

	public Course getAssistantCourse() {
		return assistantCourse;
	}

	public void setAssistantCourse(Course assistantCourse) {
		this.assistantCourse = assistantCourse;
	}


	public Timestamp getCurrentTime() {
		currentTime = new Timestamp(System.currentTimeMillis());
		return currentTime;
	}

	public Map<String, List<Course>> getSemesterCourseList() {
		return semesterCourseList;
	}


	public void setSemesterCourseList(Map<String, List<Course>> semesterCourseList) {
		this.semesterCourseList = semesterCourseList;
	}

	public Date getCurrentDate() {
		currentDate = new Date(System.currentTimeMillis());
		return currentDate;
	}


}
