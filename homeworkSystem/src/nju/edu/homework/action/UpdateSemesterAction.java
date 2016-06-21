package nju.edu.homework.action;

import java.sql.Date;

import nju.edu.homework.model.Semester;
import nju.edu.homework.service.SemesterService;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

@Controller
public class UpdateSemesterAction extends BaseAction{

	private static final long serialVersionUID = 1L;

	@Autowired
	private SemesterService semesterService;

	private Semester semester;

	@Action(value = "updateSemester",
			results = {
			@Result( name = SUCCESS, location = "/jsp/administrator/courseList.action", type="redirect")
	})
	public String updateSemester() throws Exception{
		String startTime = request.getParameter("beginYear") + "-" + request.getParameter("beginMonth")
				+ "-" + request.getParameter("beginDay");
		String endTime = request.getParameter("endYear") + "-" + request.getParameter("endMonth")
				+ "-" + request.getParameter("endDay");
		String name = request.getParameter("updateSemester");
		semester = new Semester(name, Date.valueOf(startTime), Date.valueOf(endTime));
		semesterService.updateSemester(semester);
		return SUCCESS;
	}
}
