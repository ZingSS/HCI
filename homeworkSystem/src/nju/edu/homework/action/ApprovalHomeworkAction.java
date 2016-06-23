package nju.edu.homework.action;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import nju.edu.homework.model.Course;
import nju.edu.homework.model.Grade;
import nju.edu.homework.model.Homework;
import nju.edu.homework.model.Message;
import nju.edu.homework.model.User;
import nju.edu.homework.service.CourseService;
import nju.edu.homework.service.GradeService;
import nju.edu.homework.service.HomeworkService;
import nju.edu.homework.service.MessageService;
import nju.edu.homework.service.UserService;
import nju.edu.homework.util.Common;
import nju.edu.homework.vo.AssistantStudentHomworkVO;
import nju.edu.homework.vo.OnlineUserVO;
import nju.edu.homework.vo.StudentSubmitGradeVO;

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
	@Autowired
	private GradeService gradeService;
	
	public String getSemester() {
		return semester;
	}



	public void setSemester(String semester) {
		this.semester = semester;
	}

	private int courseId;
	private String courseName;
	private Homework homework;
	private List<Course> courseList;
	private Course course;
	private String semester;
	
	private Timestamp currentTime;
	public Timestamp getCurrentTime() {
		currentTime = new Timestamp(System.currentTimeMillis());
		return currentTime;
	}
	private Date currentDate;
	public Date getCurrentDate() {
		currentDate = new Date(System.currentTimeMillis());
		return currentDate;
	}
	private List<AssistantStudentHomworkVO> studentList;
	
	private int full = 0;	//满分是多少？如果所有成绩里的最高分在10以下（含），full等于最高分。10以上，就是100.
	
	//如果full == 100,60以下一组，60以上隔10一组。否则，从0开始到最高分，隔1分一组
	private List<List<AssistantStudentHomworkVO>> grades;
	
	private List<Integer> heights;
	

	@Action(
			value = "toApprovalHomework",
			results = {
					@Result(name = SUCCESS, location = "/jsp/teacher/approvalHomework.jsp"),
			})
	
	public String toApprovalHomework() throws Exception {
		int homeworkId = Integer.parseInt(request.getParameter("homeworkId"));
		int courseId = Integer.parseInt(request.getParameter("courseId"));
		setCourseId(courseId);
		setCourse(courseService.getCourseById(courseId));
		setCourseName(courseService.getCourseNameById(courseId));
		setHomework(homeworkService.getHomeworkById(homeworkId));
		OnlineUserVO uservo=(OnlineUserVO)session.get("onlineUser");
		List<Course> cList = courseService.getCourseByTeacherId(uservo.getId());
		courseList = new ArrayList<Course>();
		semester = (String) session.get("semester");
		setSemester(semester);
		for(Course course : cList){
			if (semester.equals(course.getSemester().getName())) {
					courseList.add(course);
			}
		}
		setCourseList(courseList);
		if (homework.getState().equals(Common.COMMIT)) {
			return SUCCESS;
		}
		List<User> students = new ArrayList<User>(courseService.getStudentsByCourseId(courseId));
		studentList = new ArrayList<AssistantStudentHomworkVO>();
		for(User student : students){
//			if (!gradeService.haveGrade(homeworkId, student.getId())) {
//				AssistantStudentHomworkVO vo = new AssistantStudentHomworkVO(student.getId(), 
//						student.getUserId(), student.getName(), false, "", "无");
//				
//				studentList.add(vo);		
//				continue;
//			}
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
		System.out.println("======================================");
		System.out.println("======================================");
		System.out.println("======================================");
		System.out.println("======================================");
		System.out.println("======================================");
		System.out.println("======================================");
		
		//TODO 下面的算法效率很低但是我喜欢 by dxh
		int max = 0;
		for (AssistantStudentHomworkVO vo : studentList) {
			if (getGrade(vo) > max) max = getGrade(vo);
		}
		System.out.println(max);
		if (max > 10) full = 100;
		else full = max;
		
		grades = new ArrayList<List<AssistantStudentHomworkVO>>();
		if (full == 100) {
			for (int i=0; i<5;i++) {
				grades.add(new ArrayList<AssistantStudentHomworkVO>());
			}
			for (AssistantStudentHomworkVO student : studentList) {
				if (getGrade(student) < 60) grades.get(0).add(student);
				else if (getGrade(student) < 70) grades.get(1).add(student);
				else if (getGrade(student) < 80) grades.get(2).add(student);
				else if (getGrade(student) < 90) grades.get(3).add(student);
				else grades.get(4).add(student);
			}
		}
		else {
			for (int i=0; i<full + 1; i++) {	//如果满分3分，就会有0 1 2 3四段
				grades.add(new ArrayList<AssistantStudentHomworkVO>());
			}
			for (AssistantStudentHomworkVO student : studentList) {
				grades.get(getGrade(student)).add(student);
			}
		}
		
		heights = new ArrayList<Integer>();
		for (int i=0;i<grades.size();i++) {
			heights.add(grades.get(i).size());
		}
		
		return SUCCESS;
	}
	
	private int getGrade(AssistantStudentHomworkVO student) {
		if (student.getGrade() == null) return 0;
		if (student.getGrade().length() == 0) return 0;
		if (student.getGrade().contains(".")) {
			return Integer.parseInt(student.getGrade().substring(0, student.getGrade().indexOf('.')));
		}
		else{
			return Integer.parseInt(student.getGrade());
		}
//		return Integer.parseInt(student.getGrade().substring(0, student.getGrade().indexOf('.')));
	}
	
//	private boolean isZero(String s) {
//		return (s.length() == 0 || Math.abs(Double.parseDouble(s)) < 0.001);
//	}
//	
//	private boolean equalTo(String s, int i) {
//		if (s.length() == 0 && i != 0) return false;
//		else if (s.length() == 0 && i == 0) return true;
//		return Math.abs(Double.parseDouble(s) - i) < 0.001;
//	}
	
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

	public List<Course> getCourseList() {
		return courseList;
	}

	public void setCourseList(List<Course> courseList) {
		this.courseList = courseList;
	}

	public Course getCourse() {
		return course;
	}

	public void setCourse(Course course) {
		this.course = course;
	}



	public int getFull() {
		return full;
	}



	public void setFull(int full) {
		this.full = full;
	}



	public List<List<AssistantStudentHomworkVO>> getGrades() {
		return grades;
	}



	public void setGrades(List<List<AssistantStudentHomworkVO>> grades) {
		this.grades = grades;
	}



	public List<Integer> getHeights() {
		return heights;
	}



	public void setHeights(List<Integer> heights) {
		this.heights = heights;
	}
}
