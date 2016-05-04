package nju.edu.homework.action;

import java.io.FileOutputStream;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

import nju.edu.homework.model.CourseFile;
import nju.edu.homework.model.Homework;
import nju.edu.homework.model.User;
import nju.edu.homework.service.CourseFileService;
import nju.edu.homework.service.CourseService;
import nju.edu.homework.util.Common;
import nju.edu.homework.util.ExcelUtil;
import nju.edu.homework.vo.CourseHomeworkExcelVO;
import nju.edu.homework.vo.CourseStudentExcelVO;
import nju.edu.homework.vo.ExcelVO;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

@Controller
public class ExportCourseExcelAction extends BaseAction{
	
	private static final long serialVersionUID = 1L;
	
	@Autowired
	private CourseService courseService;
	@Autowired
	private CourseFileService courseFileService;
	
	private String exportFileName;
	private InputStream excelFile;
	
	
	// TODO 这个到时候弄成自动的
	@Action(
			value = "exportCourseExcel",
			results = {
					@Result(name = SUCCESS, location="/jsp/teacher/courseList.action", type="redirect")
			})
	
	public String exportCourseExcel() throws Exception {
		int courseId = Integer.parseInt(request.getParameter("courseId"));
		
		ExcelUtil eu = new ExcelUtil();  
		String title[] = Common.EXPORT_COURSE_STUDENT_TITLE;
		List<User> students = new ArrayList<User>(courseService.getStudentsByCourseId(courseId));
		List<ExcelVO> dataList = formatStudent(students);
		// 生成workbook即由标题和数据生成Excel表格
        HSSFWorkbook workbook = eu.exportExcel(title, dataList);
        // 生成作业sheet相关的内容
        List<ExcelVO> homeworkVos = formatHomework(courseId);
        workbook = eu.addSheet(Common.EXPORT_COURSE_HW_TITLE, homeworkVos, workbook, "homeworkList");
        // 把生成的文件直接存起来
        String dir = Common.buildDir(courseId); 
        if (dir.equals("")) {
			return ERROR;
		}
        String fileName = "course" + courseId + ".xls";
        FileOutputStream fileOut = new FileOutputStream(dir + "/" + fileName);
        workbook.write(fileOut);
        fileOut.close(); 
        // 把生成的文件存到数据库里
        CourseFile file = new CourseFile(fileName, dir);
        courseFileService.addCourseFile(file, courseId);
		return SUCCESS;
	}
	
	private List<ExcelVO> formatHomework(int courseId) {
		List<ExcelVO> vos = new ArrayList<ExcelVO>();
		List<Homework> homeworks = courseService.getHomeworkByCourseId(courseId);
		for(Homework homework : homeworks){
			vos.add(new CourseHomeworkExcelVO(homework.getName(), homework.getStudentDDL(), homework.getAssistantDDL()));
		}
		return vos;
	}

	private List<ExcelVO> formatStudent(List<User> students){
		List<ExcelVO> vos = new ArrayList<ExcelVO>();
		for( User user : students){
			vos.add(new CourseStudentExcelVO(user.getUserId(), user.getName()));
		}
		return vos;
	}

	public String getExportFileName() {
		return exportFileName;
	}

	public void setExportFileName(String exportFileName) {
		this.exportFileName = exportFileName;
	}

	public InputStream getExcelFile() {
		return excelFile;
	}

	public void setExcelFile(InputStream excelFile) {
		this.excelFile = excelFile;
	}

}
