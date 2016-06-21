package nju.edu.homework.action;

import java.io.FileOutputStream;
import java.sql.Date;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import nju.edu.homework.model.Course;
import nju.edu.homework.model.CourseFile;
import nju.edu.homework.model.Homework;
import nju.edu.homework.model.User;
import nju.edu.homework.service.CourseFileService;
import nju.edu.homework.service.CourseService;
import nju.edu.homework.service.HomeworkService;
import nju.edu.homework.service.SemesterService;
import nju.edu.homework.service.UserService;
import nju.edu.homework.util.Common;
import nju.edu.homework.util.ExcelUtil;
import nju.edu.homework.vo.ExcelVO;
import nju.edu.homework.vo.OnlineUserVO;
import nju.edu.homework.vo.StudentGradeVO;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

/**
 * 用于展示老师的所有课程的列表
 * @author soujing
 *
 */
@Controller
public class TeacherCourseListAction extends BaseAction{

	private static final long serialVersionUID = 1L;
	
	@Autowired
	private CourseService courseService;
	@Autowired
	private UserService userService;
	@Autowired
	private SemesterService semesterService;
	@Autowired
	private CourseFileService courseFileService;
	@Autowired
	private HomeworkService homeworkService;
	
	private List<Course> courseList;
	private List<String> semesterList;
	
	public List<String> getSemesterList() {
		return semesterList;
	}

	public void setSemesterList(List<String> semesterList) {
		this.semesterList = semesterList;
	}

	private Map<String, List<Course>> semesterCourseList;
	
	@Action(
			value = "showTeacherCourseList",
			results = {
					@Result(name = SUCCESS, location = "/jsp/teacher/teacherCourseList.jsp"),
			})
	public String execute() throws Exception {
		int id = ((OnlineUserVO)session.get("onlineUser")).getId();
		List<String> semesters = semesterService.getAllStringSemesters();
		setSemesterList(semesters);
		setCourseList(courseService.getCourseByTeacherId(id));
		semesterCourseList = new LinkedHashMap<String, List<Course>>();
		for(String semester : semesters){
			List<Course> oneSemesterCourse = new ArrayList<Course>();
			for(Course course : courseList){
				if (semester.equals(course.getSemester().getName())) {
					oneSemesterCourse.add(course);
				}
			}
			
			semesterCourseList.put(semester, oneSemesterCourse);
		}
		// 判断当前的课是不是要导出Excel表
		isCourseExportExcel();
		return SUCCESS;
	}
	
	@Action(
			value = "showTermCourseList",
			results = {
					@Result(name = SUCCESS, location = "/jsp/teacher/teacherCourseList.jsp"),
			})
	public String showTermCourseList() throws Exception {
		int id = ((OnlineUserVO)session.get("onlineUser")).getId();
		String selectTerm = (String) request.getParameter("selectTerm");
		request.setAttribute("selectTerm", selectTerm);
		List<String> semesterList = semesterService.getAllStringSemesters();
		setSemesterList(semesterList);
		List<String> semesters = new ArrayList<String>();
		if(selectTerm.equals("all")){
			semesters=semesterList;
		}else{
			semesters.add(selectTerm);
		}
		setCourseList(courseService.getCourseByTeacherId(id));
		semesterCourseList = new LinkedHashMap<String, List<Course>>();
		for(String semester : semesters){
			List<Course> oneSemesterCourse = new ArrayList<Course>();
			for(Course course : courseList){
				if (semester.equals(course.getSemester().getName())) {
					oneSemesterCourse.add(course);
				}
			}
			
			semesterCourseList.put(semester, oneSemesterCourse);
		}
		// 判断当前的课是不是要导出Excel表
		isCourseExportExcel();
		return SUCCESS;
	}
	
	private void isCourseExportExcel() throws Exception{
		List<Course> courses = courseService.getAllCourse();
		Date currentDate = new Date(System.currentTimeMillis());
		Date rangeDate = new Date(System.currentTimeMillis() + 2*24*60*60*1000);
		for(Course course : courses){
			Date endDate = course.getSemester().getEndTime();
			if(currentDate.before(endDate) && rangeDate.after(endDate) && !courseFileService.hasExported(course.getId())){
				buildExcel(course.getId());
			}
		}
	}
	
	public void buildExcel(int courseId) throws Exception{
		ExcelUtil eu = new ExcelUtil();  
		String title[] = Common.EXPORT_COURSE_STUDENT_TITLE;
		List<User> students = new ArrayList<User>(courseService.getStudentsByCourseId(courseId));
		List<ExcelVO> dataList = Common.formatStudent(students);
		// 生成workbook即由标题和数据生成Excel表格
        HSSFWorkbook workbook = eu.exportExcel(title, dataList);
        // 生成作业sheet相关的内容
        List<Homework> homeworks = courseService.getHomeworkByCourseId(courseId);
        List<ExcelVO> homeworkVos = Common.formatHomework(homeworks);
        workbook = eu.addSheet(Common.EXPORT_COURSE_HW_TITLE, homeworkVos, workbook, "homeworkList");
        // 生成每个作业的成绩，sheet以作业编号命名
        for(Homework homework: homeworks){
        	List<ExcelVO> gradeVo = homeworkService.getStudentGrade(homework.getId());
        	if(gradeVo == null || gradeVo.size() == 0){
        		continue;
        	}
        	workbook = eu.addSheet(Common.EXPORT_COURSE_SG_TITLE, gradeVo, workbook, homework.getId()+"");
        }
        // 把生成的文件直接存起来
        String dir = Common.buildDir(courseId); 
        if (dir.equals("")) {
			return;
		}
        String fileName = "course" + courseId + ".xls";
        FileOutputStream fileOut = new FileOutputStream(dir + "/" + fileName);
        workbook.write(fileOut);
        fileOut.close(); 
        // 把生成的文件存到数据库里
        CourseFile file = new CourseFile(fileName, dir);
        courseFileService.addCourseFile(file, courseId);
	}
	
	


	public List<Course> getCourseList() {
		return courseList;
	}

	public void setCourseList(List<Course> courseList) {
		this.courseList = courseList;
	}

	public Map<String, List<Course>> getSemesterCourseList() {
		return semesterCourseList;
	}

	public void setSemesterCourseList(Map<String, List<Course>> semesterCourseList) {
		this.semesterCourseList = semesterCourseList;
	}

}
