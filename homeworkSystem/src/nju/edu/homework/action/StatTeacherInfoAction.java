package nju.edu.homework.action;

import java.util.ArrayList;
import java.util.List;

import nju.edu.homework.model.Course;
import nju.edu.homework.model.User;
import nju.edu.homework.service.CourseService;
import nju.edu.homework.service.UserService;
import nju.edu.homework.vo.StatTeacherInfoVO;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

@Controller
public class StatTeacherInfoAction extends StatisticAction{

	private static final long serialVersionUID = 1L;
	
	@Autowired
	private UserService userService;
	@Autowired
	private CourseService courseService;
	
	private User user;
	
	private List<StatTeacherInfoVO> teacherCourseList;
	
	@Action(
			value = "showTeacherInfoStat",
			results = {
					@Result(name = SUCCESS, location = "/jsp/director/statTeacherInfo.jsp"),
			})
	
	public String showTeacherInfoStat() throws Exception {
		setSelectList();
		setMonthSelectList();
		
		int studentId = Integer.parseInt(request.getParameter("userId"));
		setUser(userService.getUserById(studentId));
		
		buildTeacherCourseList();
		
		return SUCCESS;
	}

	private void buildTeacherCourseList() {
		teacherCourseList = new ArrayList<StatTeacherInfoVO>();
		List<Course> courseList = userService.getTeacherCourseBySemester(user.getId(), getSemester());
		for(Course course : courseList){
			int homeworkNum = courseService.getMonthHomeworkNumber(course.getId(), getMonth());
			StatTeacherInfoVO vo = new StatTeacherInfoVO(course, homeworkNum);
			teacherCourseList.add(vo);
		}
		
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public List<StatTeacherInfoVO> getTeacherCourseList() {
		return teacherCourseList;
	}

	public void setTeacherCourseList(List<StatTeacherInfoVO> teacherCourseList) {
		this.teacherCourseList = teacherCourseList;
	}

}
