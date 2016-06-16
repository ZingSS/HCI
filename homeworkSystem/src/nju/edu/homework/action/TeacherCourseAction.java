package nju.edu.homework.action;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import nju.edu.homework.model.Course;
import nju.edu.homework.model.User;
import nju.edu.homework.service.CourseService;
import nju.edu.homework.vo.OnlineUserVO;

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
	private String semester;
	public String getSemester() {
		return semester;
	}

	public void setSemester(String semester) {
		this.semester = semester;
	}

	private List<Course> courseList;
	
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
		session.put("courseId", id);
		setCourse(courseService.getCourseById(id));
		List<User> list = new ArrayList<User>(courseService.getStudentsByCourseId(id));

		setInCourseAssistantList(courseService.getAssistantByCourse(id));
		setStudentList(list);
		
		String semester=request.getParameter("semester");
		setSemester(semester);
		OnlineUserVO vo=(OnlineUserVO)session.get("onlineUser");
		List<Course> cList = courseService.getCourseByTeacherId(vo.getId());
		List<Course> semesterList = new ArrayList<Course>();
		for(Course course : cList){
			if (semester.equals(course.getSemester().getName())) {
				if(!course.getName().equals(courseService.getCourseById(id).getName())){
					semesterList.add(course);
				}
			}
		}
		semesterList.remove(courseService.getCourseById(id));
		setCourseList(semesterList);
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

	public List<Course> getCourseList() {
		return courseList;
	}

	public void setCourseList(List<Course> courseList) {
		this.courseList = courseList;
	}

}
