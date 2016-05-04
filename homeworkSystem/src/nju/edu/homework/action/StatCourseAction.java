package nju.edu.homework.action;


import java.util.ArrayList;
import java.util.List;

import nju.edu.homework.model.Course;
import nju.edu.homework.model.Homework;
import nju.edu.homework.service.CourseService;
import nju.edu.homework.service.HomeworkService;
import nju.edu.homework.vo.StatCourseHomeworkVO;
import nju.edu.homework.vo.StatGradesVO;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

@Controller
public class StatCourseAction extends StatisticAction{

	private static final long serialVersionUID = 1L;
	
	@Autowired
	private CourseService courseService;
	@Autowired
	private HomeworkService homeworkService;
	
	private List<StatCourseHomeworkVO> homeworkList;
	
	private Course course;
	
	@Action(
			value = "showCourseStat",
			results = {
					@Result(name = SUCCESS, location = "/jsp/director/statCourse.jsp"),
			})
	
	public String execute() throws Exception {
		setSelectList(getSemester());
		setMonthSelectList();
		String courseId = request.getParameter("courseId");
		setCourse(courseService.getCourseById(Integer.parseInt(courseId)));
		List<Homework> homeworks = courseService.getMonthHomework(course.getId(), getMonth());
		homeworkList = new ArrayList<StatCourseHomeworkVO>();
		if (homeworks == null || homeworks.size() == 0 ) {
			return SUCCESS;
		}
		for(Homework homework : homeworks){
			StatGradesVO grades = homeworkService.getStatGrades(homework.getId());
			StatCourseHomeworkVO vo = new StatCourseHomeworkVO(homework, grades.getHeighest(), grades.getLowest(), grades.getAverage());
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

	public List<StatCourseHomeworkVO> getHomeworkList() {
		return homeworkList;
	}

	public void setHomeworkList(List<StatCourseHomeworkVO> homeworkList) {
		this.homeworkList = homeworkList;
	}
}
