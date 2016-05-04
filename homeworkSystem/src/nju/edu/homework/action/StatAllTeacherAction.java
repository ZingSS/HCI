package nju.edu.homework.action;

import java.util.ArrayList;
import java.util.List;

import nju.edu.homework.model.User;
import nju.edu.homework.service.UserService;
import nju.edu.homework.util.Common;
import nju.edu.homework.vo.StatStudentVO;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

@Controller
public class StatAllTeacherAction extends StatisticAction{

	private static final long serialVersionUID = 1L;
	
	@Autowired
	private UserService userService;
	
	private List<StatStudentVO> teacherList;
	
	@Action(
			value = "showAllTeacherStat",
			results = {
					@Result(name = SUCCESS, location = "/jsp/director/statAllTeacher.jsp"),
			})
	
	public String showAllTeacherStat() throws Exception {
		setSelectList();	
		setMonthSelectList();
		List<User> students = userService.getUserByRole(Common.ROLE_TEACHER);
		teacherList = new ArrayList<StatStudentVO>();
		for(User user : students){
			int courseNum = userService.getTeacherCourseNumBySemester(user.getId(), getSemester());
			StatStudentVO vo = new StatStudentVO(user, courseNum);
			teacherList.add(vo);
		}
		return SUCCESS;
	}

	public List<StatStudentVO> getTeacherList() {
		return teacherList;
	}

	public void setTeacherList(List<StatStudentVO> teacherList) {
		this.teacherList = teacherList;
	}

}
