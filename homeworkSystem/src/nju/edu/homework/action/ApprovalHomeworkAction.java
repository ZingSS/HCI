package nju.edu.homework.action;

import java.util.ArrayList;
import java.util.List;

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
public class ApprovalHomeworkAction extends BaseAction{

	private static final long serialVersionUID = 1L;
	
	@Autowired
	private CourseService courseService;
	@Autowired
	private HomeworkService homeworkService;
	@Autowired
	private MessageService messageService;
	@Autowired
	private UserService userService;
	
	private int courseId;
	private String courseName;
	private Homework homework;
	
	private List<AssistantStudentHomworkVO> studentList;
	

	@Action(
			value = "toApprovalHomework",
			results = {
					@Result(name = SUCCESS, location = "/jsp/teacher/approvalHomework.jsp"),
			})
	
	public String toApprovalHomework() throws Exception {
		int homeworkId = Integer.parseInt(request.getParameter("homeworkId"));
		int courseId = Integer.parseInt(request.getParameter("courseId"));
		setCourseId(courseId);
		setCourseName(courseService.getCourseNameById(courseId));
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
			value = "passApproval",
			results = {
					@Result(name = SUCCESS, location = "/jsp/teacher/approvalHomework.jsp"),
			})
	
	public String passApproval() throws Exception {
		int homeworkId = Integer.parseInt(request.getParameter("homeworkId"));
		int courseId = Integer.parseInt(request.getParameter("courseId"));
		homeworkService.changeToPass(homeworkId);
		// 发送消息提醒学生
		Message message = new Message("公布作业成绩", "快去查看作业成绩吧", Common.PUBLISH_GRADE);
		messageService.saveMessage(message, courseId);
		return SUCCESS;
	}
	
	@Action(
			value = "failedApproval",
			results = {
					@Result(name = SUCCESS, location = "/jsp/teacher/approvalHomework.jsp"),
			})
	
	public String failedApproval() throws Exception {
		int homeworkId = Integer.parseInt(request.getParameter("homeworkId"));
		int courseId = Integer.parseInt(request.getParameter("courseId"));
		homeworkService.changeToFailed(homeworkId);
		// 发送消息提醒助教重新批改
		Message message = new Message("作业重新批改", "不合格，请重新批改", Common.RE_CORRECT);
		messageService.saveMessage(message, courseId);
		return SUCCESS;
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

	public Homework getHomework() {
		return homework;
	}

	public void setHomework(Homework homework) {
		this.homework = homework;
	}

	public List<AssistantStudentHomworkVO> getStudentList() {
		return studentList;
	}

}