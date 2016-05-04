package nju.edu.homework.action;


import java.util.ArrayList;
import java.util.List;

import nju.edu.homework.model.Course;
import nju.edu.homework.model.Homework;
import nju.edu.homework.model.User;
import nju.edu.homework.service.CourseService;
import nju.edu.homework.service.HomeworkService;
import nju.edu.homework.vo.StatCourseStudentVO;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

@Controller
public class StatCourseStudentAction extends StatisticAction{

	private static final long serialVersionUID = 1L;
	
	@Autowired
	private CourseService courseService;
	@Autowired
	private HomeworkService homeworkService;
	
	private Course course;
	private int passNumber;
	private List<StatCourseStudentVO> assistants;
	private List<StatCourseStudentVO> students;
	
	@Action(
			value = "showCourseStudentStat",
			results = {
					@Result(name = SUCCESS, location = "/jsp/director/statCourseStudent.jsp"),
			})
	
	public String showCourseStudentStat() throws Exception {
		setSelectList(getSemester());
		setMonthSelectList();
		int courseId = Integer.parseInt(request.getParameter("courseId"));
		setCourse(courseService.getCourseById(courseId));
		setPresentStudentList(courseId);
		return SUCCESS;
	}
	
	private void setPresentStudentList(int courseId){
		List<Homework> passHomeworks = courseService.getPassHomworkByMonth(courseId, getMonth());
		assistants = new ArrayList<StatCourseStudentVO>();
		students = new ArrayList<StatCourseStudentVO>();
		if (passHomeworks == null) {
			setPassNumber(0);
			return;
		}
		setPassNumber(passHomeworks.size());
		int reCorrect = 0;
		for(Homework homework : passHomeworks){
			reCorrect += homework.getFailedTimes();
		}
		List<User> assistantList = courseService.getAssistantByCourse(courseId);
		for(User user : assistantList){
			StatCourseStudentVO vo = new StatCourseStudentVO(user, reCorrect);
			assistants.add(vo);
		}
		
		List<User> studentList = new ArrayList<User>(courseService.getStudentsByCourseId(courseId));
		for(User user: studentList){
			int submit = 0;
			double totalGrade = 0,average = 0;
			for (Homework homework : passHomeworks) {
				if(homeworkService.isStudentSubmit(homework.getId(),user.getId())){
					submit++;
					totalGrade =+ homeworkService.getGradeByStudent(homework.getId(), user.getId());
				}
			}
			average = totalGrade/passHomeworks.size();
			StatCourseStudentVO vo = new StatCourseStudentVO(user, submit, average);
			students.add(vo);
		}
		
	}

	public Course getCourse() {
		return course;
	}

	public void setCourse(Course course) {
		this.course = course;
	}

	public List<StatCourseStudentVO> getAssistants() {
		return assistants;
	}

	public void setAssistants(List<StatCourseStudentVO> assistants) {
		this.assistants = assistants;
	}

	public List<StatCourseStudentVO> getStudents() {
		return students;
	}

	public void setStudents(List<StatCourseStudentVO> students) {
		this.students = students;
	}

	public int getPassNumber() {
		return passNumber;
	}

	public void setPassNumber(int passNumber) {
		this.passNumber = passNumber;
	}

}
