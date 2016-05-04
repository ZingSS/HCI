package nju.edu.homework.action;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import nju.edu.homework.model.Course;
import nju.edu.homework.model.Grade;
import nju.edu.homework.model.Homework;
import nju.edu.homework.service.CourseService;
import nju.edu.homework.service.FileService;
import nju.edu.homework.service.GradeService;
import nju.edu.homework.vo.OnlineUserVO;
import nju.edu.homework.vo.StudentHomeworkVO;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

@Controller
public class StudentHomeworkListAction extends BaseAction{

	private static final long serialVersionUID = 1L;
	
	@Autowired
	private CourseService courseService;
	@Autowired
	private FileService fileService;
	@Autowired
	private GradeService gradeService;
	
	private Course course;
	private List<StudentHomeworkVO> homeworkList;
	
	private Timestamp currentTime;
	
	@Action(
			value = "showStudentHomeworkList",
			results = {
					@Result(name = SUCCESS, location = "/jsp/student/courseHomeworkList.jsp"),
			})
	
	public String showStudentHomeworkList() throws Exception {
		int courseId = Integer.parseInt(request.getParameter("courseId"));
		setCourse(courseService.getCourseById(courseId));
		OnlineUserVO user = (OnlineUserVO)session.get("onlineUser");
		List<Homework> homeworks = courseService.getHomeworkByCourseId(courseId);
		homeworkList = new ArrayList<StudentHomeworkVO>();
		for(Homework homework: homeworks){
			boolean submit = fileService.hasStudentSubmited(homework.getId(), user.getId());
			Grade grade = gradeService.getGradeByUserAndHomework(user.getId(), homework.getId());
			StudentHomeworkVO vo = null;
			if (grade == null) {
				vo = new StudentHomeworkVO(homework, submit, "", "");
			}
			else{
				vo = new StudentHomeworkVO(homework, submit, grade.getGrade(), grade.getComment());
			}
			System.out.println(vo.getHomework().getName() + "   " + vo.isSubmit() + "==================="); 
			homeworkList.add(vo);
		}
		return SUCCESS;
	}

	public Course getCourse() {
		return course;
	}

	public void setCourse(Course course) {
		this.course = course;
	}

	public List<StudentHomeworkVO> getHomeworkList() {
		return homeworkList;
	}

	public void setHomeworkList(List<StudentHomeworkVO> homeworkList) {
		this.homeworkList = homeworkList;
	}	
	
	public Timestamp getCurrentTime() {
		currentTime = new Timestamp(System.currentTimeMillis());
		return currentTime;
	}

}
