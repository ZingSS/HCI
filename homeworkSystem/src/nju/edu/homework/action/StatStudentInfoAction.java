package nju.edu.homework.action;

import java.util.ArrayList;
import java.util.List;

import nju.edu.homework.model.Course;
import nju.edu.homework.model.Homework;
import nju.edu.homework.model.User;
import nju.edu.homework.service.CourseService;
import nju.edu.homework.service.HomeworkService;
import nju.edu.homework.service.UserService;
import nju.edu.homework.vo.HomeworkStateListVO;
import nju.edu.homework.vo.HomeworkStateNumVO;
import nju.edu.homework.vo.StatStudentCourseVo;
import nju.edu.homework.vo.StatStudentHomeworkVO;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

@Controller
public class StatStudentInfoAction extends StatisticAction{

	private static final long serialVersionUID = 1L;
	
	@Autowired
	private UserService userService;
	@Autowired
	private CourseService courseService;
	@Autowired
	private HomeworkService homeworkService;
	
	private User user;
	
	private List<StatStudentCourseVo> assistantCourseList;
	private List<StatStudentCourseVo> studentCourseList;
	
	@Action(
			value = "showStudentInfoStat",
			results = {
					@Result(name = SUCCESS, location = "/jsp/director/statStudentInfo.jsp"),
			})
	
	public String showStudentInfoStat() throws Exception {
		setSelectList();
		setMonthSelectList();
		
		int studentId = Integer.parseInt(request.getParameter("userId"));
		setUser(userService.getUserById(studentId));
		
		assistantCourseList = new ArrayList<StatStudentCourseVo>();
		studentCourseList = new ArrayList<StatStudentCourseVo>();
		
		if(userService.isAssistantInSemester(user.getId(), getSemester())){
			buildAssistantCourseList();
		}
		buildStudentCourseList();
		return SUCCESS;
	}
	
	private void buildAssistantCourseList() {
		Course course = userService.getAssistantCourseByid(user.getId());
		StatStudentHomeworkVO stats = courseService.getStatAssisHomeworkByMonth(course.getId(), getMonth());
		HomeworkStateNumVO homeworkNum = stats.getNums();
		int reCorrect = 0;
		List<Homework> homeworks = stats.getPassHomeworks();
		for(Homework h: homeworks){
			reCorrect += h.getFailedTimes();
		}
		StatStudentCourseVo vo = new StatStudentCourseVo(course, homeworkNum, reCorrect);
		assistantCourseList.add(vo);
	}

	private void buildStudentCourseList() {
		List<Course> courses = userService.getStudentCourseBySemester(user.getId(), getSemester());
		for( Course course: courses){
			
			StatStudentHomeworkVO stats = courseService.getStatStHomeworkByMonth(course.getId(), getMonth());
			HomeworkStateNumVO homeworkNum = stats.getNums();
			HomeworkStateListVO homeworkLists = stats.getLists();
			
			List<Homework> overHomeworks = homeworkLists.getOverHomeworks();
			int submit = 0;
			for (Homework homework : overHomeworks) {
				if(homeworkService.isStudentSubmit(homework.getId(),user.getId())){
					submit++;
				}
			}
			
			List<Homework> passHomeworks = homeworkLists.getPassHomeworks();
			double totalGrade = 0;
			for (Homework homework : passHomeworks) {
				if(homeworkService.isStudentSubmit(homework.getId(),user.getId())){
					totalGrade =+ homeworkService.getGradeByStudent(homework.getId(), user.getId());
				}
			}
			double average = 0;
			average = (passHomeworks.size() == 0?0:totalGrade/passHomeworks.size());
			StatStudentCourseVo vo = new StatStudentCourseVo(course, homeworkNum, submit, average);
			studentCourseList.add(vo);
		}
	}


	public List<StatStudentCourseVo> getAssistantCourseList() {
		return assistantCourseList;
	}

	public List<StatStudentCourseVo> getStudentCourseList() {
		return studentCourseList;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
}
