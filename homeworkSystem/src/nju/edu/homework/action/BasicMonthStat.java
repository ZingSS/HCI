package nju.edu.homework.action;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.List;

import nju.edu.homework.model.Course;
import nju.edu.homework.model.Semester;
import nju.edu.homework.service.CourseService;
import nju.edu.homework.service.HomeworkService;
import nju.edu.homework.service.SemesterService;
import nju.edu.homework.vo.StatBasicCourseVO;
import nju.edu.homework.vo.StatSeMoVO;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

@Controller
public class BasicMonthStat extends StatisticAction{

	private static final long serialVersionUID = 1L;
	
	@Autowired
	private CourseService courseService;
	@Autowired
	private HomeworkService homeworkService;
	@Autowired
	private SemesterService semesterService;
	
	private List<StatBasicCourseVO> courseList;	
	private List<Semester> validSemesters;
	
	private StatSeMoVO statSM;
	
	@SuppressWarnings("unchecked")
	@Action(
			value = "showInitLastMonth",
			results = {
					@Result(name = SUCCESS, location = "/jsp/director/director.jsp"),
			})
	
	public String showInitLastMonth() throws Exception {

		setSelectList();
		setValidSemesters(semesterService.getValidSemester());
		setMonthSelectList(validSemesters.get(0).getName());
		String currentMonth = (Calendar.getInstance().get(Calendar.MONTH) + 1) + "";
		String iniMonth = Arrays.asList(getMonthList()).contains(currentMonth)?currentMonth:getMonthList()[0];
		setMonth(iniMonth);
		statSM = new StatSeMoVO(validSemesters.get(0), iniMonth);
		session.put("statSM", statSM);
		
		setStatBasicCourse(semesterService.getCourseBySemester(semesterList[0]));
		return SUCCESS;
	}
	
	@Action(
			value = "showStatCourseMonth",
			results = {
					@Result(name = SUCCESS, location = "/jsp/director/director.jsp"),
			})
	
	public String showStatCourseMonth() throws Exception {
		setSelectList();
		setMonthSelectList();		
		setStatBasicCourse(semesterService.getCourseBySemester(getSemester()));
		return SUCCESS;
	}
	
	private void setStatBasicCourse(List<Course> courses) {
		courseList = new ArrayList<StatBasicCourseVO>();
		for(Course course : courses){
			int homeworkNum = courseService.getMonthHomeworkNumber(course.getId(), getMonth());
			StatBasicCourseVO vo = new StatBasicCourseVO(course, homeworkNum);
			courseList.add(vo);
		}
	}
	public List<Semester> getValidSemesters() {
		return validSemesters;
	}

	public void setValidSemesters(List<Semester> validSemesters) {
		this.validSemesters = validSemesters;
	}

	public void setMonth(String month) {
		this.month = month;
	}

	public List<StatBasicCourseVO> getCourseList() {
		return courseList;
	}

	public void setCourseList(List<StatBasicCourseVO> courseList) {
		this.courseList = courseList;
	}

}
