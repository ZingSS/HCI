package nju.edu.homework.action;


import java.sql.Date;
import java.util.List;

import nju.edu.homework.model.Semester;
import nju.edu.homework.service.SemesterService;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

@Controller
public class AddSemesterAction extends BaseAction{

	private static final long serialVersionUID = 1L;

	@Autowired
	private SemesterService semesterService;

	private String newSemester;
	private Semester semester;

	private String[] semesterList;

	@Action(
			value = "jumpToAddSemester",
			results = {
					@Result(name = SUCCESS, location = "/jsp/administrator/addSemester.jsp"),
			})
	public String jumpToAddSemester() throws Exception {
		Semester last = semesterService.getLastSemester();
		if (last == null) {
			setNewSemester("2016-2017学年第一学期");
			return SUCCESS;
		}
		String lastSemester = last.getName();
		if (lastSemester.contains("二")) {	// 第二个学期
    		int begin = Integer.parseInt(lastSemester.substring(0,4));
    		int end = Integer.parseInt(lastSemester.substring(5,9));
    		setNewSemester((begin+1) + "-" + (end+1) + "学年第一学期");
    	}
    	else{									// 第一个学期
    		setNewSemester(lastSemester.substring(0, 12) + "二学期");
    	}

		setSelectList();
		return SUCCESS;
	}

	@Action(
			value = "addSemester",
			results = {
					@Result(name = SUCCESS, location = "/jsp/administrator/courseList.action", type="redirect"),
			})
	public String addSemester() throws Exception {
		String startTime = request.getParameter("beginYear") + "-" + request.getParameter("beginMonth")
				+ "-" + request.getParameter("beginDay");
		String endTime = request.getParameter("endYear") + "-" + request.getParameter("endMonth")
				+ "-" + request.getParameter("endDay");
		semester = new Semester(request.getParameter("newSemester"), Date.valueOf(startTime), Date.valueOf(endTime));
		semesterService.addNewSemester(semester);
		return SUCCESS;
	}

	public void setSelectList(){
		List<String> semesters = semesterService.getAllStringSemesters();
		String ss[] = semesters.toArray(new String[]{});
		setSemesterList(ss);
	}

	public String getNewSemester() {
		return newSemester;
	}

	public void setNewSemester(String newSemester) {
		this.newSemester = newSemester;
	}

	public Semester getSemester() {
		return semester;
	}

	public void setSemester(Semester semester) {
		this.semester = semester;
	}

	public String[] getSemesterList() {
		return semesterList;
	}

	public void setSemesterList(String[] semesterList) {
		this.semesterList = semesterList;
	}

}
