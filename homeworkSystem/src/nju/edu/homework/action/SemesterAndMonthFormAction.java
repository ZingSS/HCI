package nju.edu.homework.action;

import nju.edu.homework.service.SemesterService;
import nju.edu.homework.util.Common;
import nju.edu.homework.vo.StatSeMoVO;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

@Controller 
public class SemesterAndMonthFormAction extends StatisticAction{

	private static final long serialVersionUID = 555997045084304057L;
	
	@Autowired
	private SemesterService semesterService;
	
	private StatSeMoVO statSM;
	private int courseId;
	private int userId;

	@SuppressWarnings("unchecked")
	@Action(
			value = "setSemesterAndMonth",
			results = {
					@Result(name = Common.STAT_ALL_COURSE, location = "showStatCourseMonth.action", type="redirect"),
					@Result(name = Common.STAT_COURSE_HW, location = "showCourseStat.action", type="redirect",
							params = {"courseId", "%{courseId}"}),
					@Result(name = Common.STAT_COURSE_ST, location = "showCourseStudentStat.action", type="redirect",
					params = {"courseId", "%{courseId}"}),
					@Result(name = Common.STAT_ALL_ST, location = "showAllStudentStat.action", type="redirect"),
					@Result(name = Common.STAT_ALL_TE, location = "showAllTeacherStat.action", type="redirect"),
					@Result(name = Common.STAT_ST_INFO, location = "showStudentInfoStat.action", type="redirect",
							params = {"userId", "%{userId}"}),
					@Result(name = Common.STAT_TE_INFO, location = "showTeacherInfoStat.action", type="redirect",
							params = {"userId", "%{userId}"}),
			})
	
	public String setSemesterAndMonth() throws Exception {
		String semester = request.getParameter("semester");
		String jumpType = request.getParameter("jumpType");
		statSM = new StatSeMoVO(semesterService.getSemester(semester), request.getParameter("month"));
		session.put("statSM", statSM);	// 保存到session中
		if (jumpType.equals(Common.STAT_COURSE_HW) || jumpType.equals(Common.STAT_COURSE_ST)) {
			courseId = Integer.parseInt(request.getParameter("courseId"));
		}
		else if(jumpType.equals(Common.STAT_ST_INFO) || jumpType.equals(Common.STAT_TE_INFO)){
			userId = Integer.parseInt(request.getParameter("userId"));
		}
		return jumpType;
	}

	public int getCourseId() {
		return courseId;
	}

	public void setCourseId(int courseId) {
		this.courseId = courseId;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}
}
