package nju.edu.homework.action;

import java.util.List;

import nju.edu.homework.model.Course;
import nju.edu.homework.service.CourseService;
import nju.edu.homework.service.SemesterService;
import nju.edu.homework.vo.CourseUpdateVO;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

@Controller
public class UpdateCourseAction extends BaseAction{

	private static final long serialVersionUID = 1L;
	
	@Autowired
	private CourseService courseService;
	@Autowired
	private SemesterService semesterService;
	
	private Course course;
	private CourseUpdateVO vo;
	private String day;
	private String begin;
	private String end;
	
	private String[] semesterList;
	
	@Action(value = "jumpToUpdateCourse",
			results = {
			@Result( name = SUCCESS, location = "/jsp/administrator/updateCourse.jsp")
	})
	public String jumpToUpdateCourse() throws Exception{
		int courseId = Integer.parseInt(request.getParameter("courseId"));
		setCourse(courseService.getCourseById(courseId));
		String time = getCourse().getTime();
		setDay(time.substring(0, 2));
		int diPosition = time.indexOf("第");
		int hPosition = time.indexOf("-");
		int jiePosition = time.indexOf("节");
		setBegin(time.substring(diPosition+1, hPosition));
		setEnd(time.substring(hPosition+1, jiePosition));
		setSelectList();
		return SUCCESS;
	}
	
	@Action(value = "updateCourse",
			results = {
			@Result( name = SUCCESS, location = "/jsp/administrator/courseList.action", type="redirect")
	})
	public String updateCourse() throws Exception{
		vo.setTime(getDay() + "  第" + getBegin() + "-" + getEnd() + "节");
		courseService.update(vo);
		return SUCCESS;
	}
	
	public void setSelectList(){
		List<String> semesters = semesterService.getAllStringSemesters();
		String ss[] = semesters.toArray(new String[]{});
		setSemesterList(ss);
	}

	public CourseService getCourseService() {
		return courseService;
	}

	public void setCourseService(CourseService courseService) {
		this.courseService = courseService;
	}

	public Course getCourse() {
		return course;
	}

	public void setCourse(Course course) {
		this.course = course;
	}

	public String getDay() {
		return day;
	}

	public void setDay(String day) {
		this.day = day;
	}

	public String getBegin() {
		return begin;
	}

	public void setBegin(String begin) {
		this.begin = begin;
	}

	public String getEnd() {
		return end;
	}

	public void setEnd(String end) {
		this.end = end;
	}

	public CourseUpdateVO getVo() {
		return vo;
	}

	public void setVo(CourseUpdateVO vo) {
		this.vo = vo;
	}

	public String[] getSemesterList() {
		return semesterList;
	}

	public void setSemesterList(String[] semesterList) {
		this.semesterList = semesterList;
	}

	
}
