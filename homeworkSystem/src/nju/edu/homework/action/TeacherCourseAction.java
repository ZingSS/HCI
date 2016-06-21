package nju.edu.homework.action;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import nju.edu.homework.model.Announcement;
import nju.edu.homework.model.Course;
import nju.edu.homework.model.User;
import nju.edu.homework.service.CourseService;
import nju.edu.homework.util.Common;
import nju.edu.homework.vo.OnlineUserVO;

@Controller
public class TeacherCourseAction extends BaseAction{

	private static final long serialVersionUID = 1L;
	
	@Autowired
	private CourseService courseService;

	private List<User> inCourseAssistantList;
	private List<User> studentList;
	private List<User> studentListRight;
	private Course course;
	private String semester;
	private List<Announcement> announcementList;
	public List<Announcement> getAnnouncementList() {
		return announcementList;
	}

	public void setAnnouncementList(List<Announcement> announcementList) {
		this.announcementList = announcementList;
	}

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
		session.put("sideState","st");
		setCourse(courseService.getCourseById(id));
		List<User> list = new ArrayList<User>(courseService.getStudentsByCourseId(id));
		
		setInCourseAssistantList(courseService.getAssistantByCourse(id));
		List<User> leftList = new ArrayList<User>();
		List<User> rightList = new ArrayList<User>();
		int mid = (list.size()%2==0)?(list.size()/2):(list.size()/2+1);
		for (int i = 0; i < mid; i++) {
			leftList.add(list.get(i));
		}
		setStudentList(leftList);
		for (int i = mid; i < list.size(); i++) {
			rightList.add(list.get(i));
		}
		setStudentListRight(rightList);
		
		String term =courseService.getCourseById(id).getSemester().getName();
		session.put("semester", term);
		setSemester(term);
		OnlineUserVO vo=(OnlineUserVO)session.get("onlineUser");
		List<Course> cList = courseService.getCourseByTeacherId(vo.getId());
		courseList = new ArrayList<Course>();
		for(Course course : cList){
			if (term.equals(course.getSemester().getName())) {
					courseList.add(course);
			}
		}
		setCourseList(courseList);
		return SUCCESS;
	}
	
	@Action(
		value = "getAnnouncement",
				results = {
						@Result(name = Common.ROLE_TEACHER, location = "/jsp/teacher/announcement.jsp"),
						@Result(name = Common.ROLE_STUDENT, location = "/jsp/student/announcement.jsp")
	})
	public String getAnnouncement(){
		int id = Integer.parseInt(request.getParameter("courseId"));
		session.put("courseId", id);
		session.put("sideState","an");
		setCourse(courseService.getCourseById(id));
		setAnnouncementList(courseService.getAnnouncementByCid(id));
		List<User> list = new ArrayList<User>(courseService.getStudentsByCourseId(id));

		setInCourseAssistantList(courseService.getAssistantByCourse(id));
		setStudentList(list);
		
		String term =courseService.getCourseById(id).getSemester().getName();
		session.put("semester", term);
		setSemester(term);
		OnlineUserVO vo=(OnlineUserVO)session.get("onlineUser");
		List<Course> cList  = null;
		if(vo.getRole().equals("teacher")){
			cList = courseService.getCourseByTeacherId(vo.getId());
		}else if(vo.getRole().equals("student")){
			cList = courseService.getCourseByStudentId(vo.getId());
		}
		courseList = new ArrayList<Course>();
		for(Course course : cList){
			if (term.equals(course.getSemester().getName())) {
					courseList.add(course);
			}
		}
		setCourseList(courseList);
		return vo.getRole();
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

	public List<User> getStudentListRight() {
		return studentListRight;
	}

	public void setStudentListRight(List<User> studentListRight) {
		this.studentListRight = studentListRight;
	}

}
