package nju.edu.homework.action;

import java.util.ArrayList;
import java.util.List;

import nju.edu.homework.model.Course;
import nju.edu.homework.model.User;
import nju.edu.homework.service.CourseService;
import nju.edu.homework.service.UserService;
import nju.edu.homework.util.Common;
import nju.edu.homework.vo.CourseStudentVO;
import nju.edu.homework.vo.OnlineUserVO;
import nju.edu.homework.vo.StudentFuzzyVO;
import nju.edu.homework.vo.StudentInOrAssisVO;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

/**
 * 这个类包括了老师添加学生、助教的时候展示的学生列表
 * 模糊查询学生的时候的方法
 * @author soujing
 *
 */
@Controller
public class ShowAndFuzzyStudentAction extends BaseAction{

	private static final long serialVersionUID = 1L;
	
	@Autowired
	private CourseService courseService;
	@Autowired
	private UserService userService;
	
	private List<CourseStudentVO> studentList;
	private List<User> inCourseStudentList;
	private List<User> inCourseAssistantList;
//	private List<User> studentList;
	
	private Course course;
	private int courseId;
	private String courseName;
	private List<Course> courseList;
	private String semester;
	
	@Action(
			value = "showStudentList",
			results = {
					@Result(name = SUCCESS, location = "/jsp/teacher/addStudent.jsp"),
			})
	public String showStudentList() throws Exception {
		OnlineUserVO vo=(OnlineUserVO)session.get("onlineUser");
		List<Course> cList = courseService.getCourseByTeacherId(vo.getId());
		int id = (int) session.get("courseId");
		courseList= new ArrayList<Course>();
		semester = (String) session.get("semester");
		setSemester(semester);
		for(Course course : cList){
			if (semester.equals(course.getSemester().getName())) {
					courseList.add(course);
			}
		}
		setCourseList(courseList);
		setCourseInfo();
		showAllStudent();
		showInCourseStudent(id);
		return SUCCESS;
	}


	@Action(
			value = "assistantManagement",
			results = {
					@Result(name = SUCCESS, location = "/jsp/teacher/manageAssistant.jsp"),
			})
	public String assistantManagement() throws Exception {
		OnlineUserVO vo=(OnlineUserVO)session.get("onlineUser");
		List<Course> cList = courseService.getCourseByTeacherId(vo.getId());
		int id = (int) session.get("courseId");
		courseList= new ArrayList<Course>();
		semester = (String) session.get("semester");
		setSemester(semester);
		for(Course course : cList){
			if (semester.equals(course.getSemester().getName())) {
					courseList.add(course);
			}
		}
		setCourseList(courseList);
		setCourseInfo();
		showAllStudent();
		showInCourseAssistant(id);
		return SUCCESS;
	}
	

	@Action(
			value = "getStudentList",
			results = {
					@Result(name = "addStudent", location = "/jsp/teacher/addStudent.jsp"),
					@Result(name = "manageAssistant", location = "/jsp/teacher/manageAssistant.jsp")
			})	
	public String getStudentListByFuzzy() throws Exception {
		String studentId = request.getParameter("studentId");
		String name = request.getParameter("name");
		StudentFuzzyVO vo = new StudentFuzzyVO(studentId, name);
		int id = Integer.parseInt(request.getParameter("courseId"));
		setCourseId(id);
		setCourse(courseService.getCourseById(id));
		List<User> list = userService.getStudentByFuzzy(vo);
		setStudentList(formatToStudentList(list));
		showInCourseStudent(id);
		return request.getParameter("page");
	}
	
	private void setCourseInfo(){
		int id = Integer.parseInt(request.getParameter("courseId"));
		setCourseId(id);
		setCourse(courseService.getCourseById(id));
		setCourseName(course.getName());
	}

	private void showAllStudent(){
		List<User> list = new ArrayList<User>(userService.getUserByRole(Common.ROLE_STUDENT));
		setStudentList(formatToStudentList(list));
	}
	
	
	private void showInCourseStudent(int courseId) {
		setInCourseStudentList(new ArrayList<User>(courseService.getStudentsByCourseId(courseId)));
	}
	
	private void showInCourseAssistant(int courseId) {
		setInCourseAssistantList(new ArrayList<User>(courseService.getAssistantByCourse(courseId)));
	}

	
	private List<CourseStudentVO> formatToStudentList(List<User> list) {
		List<CourseStudentVO> studentList = new ArrayList<CourseStudentVO>();
		for(User user: list){
			StudentInOrAssisVO inOrAssisVO = userService.isInOrAssis(user.getId(), getCourseId());
			CourseStudentVO vo = new CourseStudentVO(user.getId(), user.getUserId(), user.getName(), 
					inOrAssisVO.isIn(), inOrAssisVO.getAssistantCourseId());
			studentList.add(vo);
		}	
		return studentList;
	}

	
	public String getSemester() {
		return semester;
	}



	public void setSemester(String semester) {
		this.semester = semester;
	}

	public int getCourseId() {
		return courseId;
	}

	public void setCourseId(int courseId) {
		this.courseId = courseId;
	}

	public String getCourseName() {
		return courseName;
	}

	public void setCourseName(String courseName) {
		this.courseName = courseName;
	}
	
	public Course getCourse() {
		return course;
	}

	public void setCourse(Course course) {
		this.course = course;
	}

	public List<CourseStudentVO> getStudentList() {
		return studentList;
	}

	public void setStudentList(List<CourseStudentVO> studentList) {
		this.studentList = studentList;
	}
	
	public List<Course> getCourseList() {
		return courseList;
	}

	public void setCourseList(List<Course> courseList) {
		this.courseList = courseList;
	}
	
	public List<User> getInCourseStudentList() {
		return inCourseStudentList;
	}

	public void setInCourseStudentList(List<User> inCourseStudentList) {
		this.inCourseStudentList = inCourseStudentList;
	}


	public List<User> getInCourseAssistantList() {
		return inCourseAssistantList;
	}


	public void setInCourseAssistantList(List<User> inCourseAssistantList) {
		this.inCourseAssistantList = inCourseAssistantList;
	}

}
