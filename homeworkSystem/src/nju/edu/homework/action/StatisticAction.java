package nju.edu.homework.action;

import nju.edu.homework.service.SemesterService;
import nju.edu.homework.vo.StatSeMoVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

@Controller
public class StatisticAction extends BaseAction{

	private static final long serialVersionUID = 1L;
	
	@Autowired
	private SemesterService semesterService;
	
	protected String semester;
	protected String month;
	
	protected String[] semesterList;
	protected String[] monthList;
	
	public String getSemester() {
		StatSeMoVO vo = (StatSeMoVO)session.get("statSM");
		semester = vo.getSemester().getName();
		return semester;
	}
	public String getMonth() {
		StatSeMoVO vo = (StatSeMoVO)session.get("statSM");
		month = vo.getMonth();
		return month;
	}
	
	public void setMonthSelectList() {
		String selectSemester = getSemester();
		setMonthSelectList(selectSemester);
	}
	
	public void setMonthSelectList(String semester) {
		String ms[] = new String[5];
		if (semester.contains("一")) {
			ms = new String[]{"9", "10", "11", "12", "1"};
		}
		else {
			ms = new String[]{"2", "3", "4", "5", "6", "7"};
		}
		setMonthList(ms);
	}

	public void setSelectList(){
		String ss[] = semesterService.getValidSemesterName().toArray(new String[]{});
		setSemesterList(ss);	
	}
	
	public void setSelectList(String semester){
		String ss[] = {semester};
		setSemesterList(ss);	
	}
	public String[] getSemesterList() {
		return semesterList;
	}
	public void setSemesterList(String[] semesterList) {
		this.semesterList = semesterList;
	}
	public String[] getMonthList() {
		return monthList;
	}
	public void setMonthList(String[] monthList) {
		this.monthList = monthList;
	}

}
