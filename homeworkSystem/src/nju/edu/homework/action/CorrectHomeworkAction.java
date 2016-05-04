package nju.edu.homework.action;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import nju.edu.homework.model.Course;
import nju.edu.homework.model.Grade;
import nju.edu.homework.model.Homework;
import nju.edu.homework.model.Message;
import nju.edu.homework.model.User;
import nju.edu.homework.service.CourseService;
import nju.edu.homework.service.HomeworkService;
import nju.edu.homework.service.MessageService;
import nju.edu.homework.service.UserService;
import nju.edu.homework.util.Common;
import nju.edu.homework.vo.AssistantStudentHomworkVO;
import nju.edu.homework.vo.StudentSubmitGradeVO;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;


@Controller
public class CorrectHomeworkAction extends BaseAction{

	private static final long serialVersionUID = 1L;
	
	@Autowired
	private CourseService courseService;
	@Autowired
	private HomeworkService homeworkService;
	@Autowired
	private UserService userService;
	@Autowired
	private MessageService messageService;
	
	private List<AssistantStudentHomworkVO> studentList;
	
	private Homework homework;
	private int homeworkId;
	private int courseId;
	private Course course;
	
	private Timestamp currentTime;
	private Date currentDate;

	
	@Action(
			value = "correctHomework",
			results = {
					@Result(name = SUCCESS, location = "/jsp/student/toSubmitHomework.action", type="redirect", params = {"homeworkId", "${homeworkId}", "courseId", "${courseId}"}),
			})
	
	public String execute() throws Exception {
		return SUCCESS;
	}

	@Action(
			value = "toCorrectHomework",
			results = {
					@Result(name = SUCCESS, location = "/jsp/student/correctHomework.jsp"),
			})
	
	public String toCorrectHomework() throws Exception {
		int homeworkId = Integer.parseInt(request.getParameter("homeworkId"));
		int courseId = Integer.parseInt(request.getParameter("courseId"));
		setCourse(courseService.getCourseById(courseId));
		setHomework(homeworkService.getHomeworkById(homeworkId));
		List<User> students = new ArrayList<User>(courseService.getStudentsByCourseId(courseId));
		studentList = new ArrayList<AssistantStudentHomworkVO>();
		for(User student : students){
			StudentSubmitGradeVO ssgVo = userService.getStudentSubmitAndGrade(student.getId(), homeworkId);
			boolean submit = ssgVo.isSubmit();
			Grade grade = ssgVo.getGrade();
			AssistantStudentHomworkVO vo = null;
			if (grade == null) {
				vo = new AssistantStudentHomworkVO(student.getId(), student.getUserId(),
						student.getName(), submit, "", "");
			}
			else{
				vo = new AssistantStudentHomworkVO(student.getId(), student.getUserId(),
						student.getName(), submit, grade.getGrade(), grade.getComment());
			}
			studentList.add(vo);
			
		}
		return SUCCESS;
	}
	
	@Action(
			value = "informTeacher",
			results = {
					@Result(name = SUCCESS, location = "/jsp/student/toCorrectHomework.action", type="redirect", params = {"homeworkId", "${homeworkId}", "courseId", "${courseId}"}),
			})
	// TODO 到时候用Ajax写
	public String informTeacher() throws Exception {
		int homeworkId = Integer.parseInt(request.getParameter("homeworkId"));
		int courseId = Integer.parseInt(request.getParameter("courseId"));
		setCourseId(courseId);
//		setCourseName(courseService.getCourseNameById(courseId));
//		setHomework(homeworkService.getHomeworkById(homeworkId));
		Message message = new Message("的作业已经批改完",
				"本课程的" + homeworkService.getHomeworkById(homeworkId).getName() + "已经批改完", Common.CORRECTION_OVER);
		messageService.saveMessage(message, courseId);
		homeworkService.changeToApproval(homeworkId);
		return SUCCESS;
	}
	

	public Homework getHomework() {
		return homework;
	}

	public void setHomework(Homework homework) {
		this.homework = homework;
	}

	public int getHomeworkId() {
		return homeworkId;
	}

	public void setHomeworkId(int homeworkId) {
		this.homeworkId = homeworkId;
	}

	public Timestamp getCurrentTime() {
		currentTime = new Timestamp(System.currentTimeMillis());
		return currentTime;
	}

	public Date getCurrentDate() {
		currentDate = new Date(System.currentTimeMillis());
		return currentDate;
	}

	public List<AssistantStudentHomworkVO> getStudentList() {
		return studentList;
	}

	public Course getCourse() {
		return course;
	}

	public void setCourse(Course course) {
		this.course = course;
	}

	public int getCourseId() {
		return courseId;
	}

	public void setCourseId(int courseId) {
		this.courseId = courseId;
	}

}
