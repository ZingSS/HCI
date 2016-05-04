package nju.edu.homework.action;

import java.util.ArrayList;
import java.util.List;

import nju.edu.homework.model.User;
import nju.edu.homework.service.UserService;
import nju.edu.homework.util.Common;
import nju.edu.homework.vo.StatStudentCourseNumVO;
import nju.edu.homework.vo.StatStudentVO;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

@Controller
public class StatAllStudentAction extends StatisticAction{

	private static final long serialVersionUID = 1L;
	
	@Autowired
	private UserService userService;
	
	private List<StatStudentVO> studentList;
	
	@Action(
			value = "showAllStudentStat",
			results = {
					@Result(name = SUCCESS, location = "/jsp/director/statAllStudent.jsp"),
			})
	
	public String showAllStudentStat() throws Exception {
		setSelectList();
		setMonthSelectList();
		List<User> students = userService.getUserByRole(Common.ROLE_STUDENT);
		studentList = new ArrayList<StatStudentVO>();
		for(User user : students){
			StatStudentCourseNumVO nums = userService.getSACourseNumBySemester(user.getId(), getSemester());
			StatStudentVO vo = new StatStudentVO(user, nums.getCourseNum(), nums.getAssistantCourseNum());
			studentList.add(vo);
		}
		return SUCCESS;
	}

	public List<StatStudentVO> getStudentList() {
		return studentList;
	}

	public void setStudentList(List<StatStudentVO> studentList) {
		this.studentList = studentList;
	}

}
