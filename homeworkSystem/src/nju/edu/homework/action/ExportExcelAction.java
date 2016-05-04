package nju.edu.homework.action;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

import nju.edu.homework.model.Grade;
import nju.edu.homework.model.User;
import nju.edu.homework.service.CourseService;
import nju.edu.homework.service.GradeService;
import nju.edu.homework.util.Common;
import nju.edu.homework.util.ExcelUtil;
import nju.edu.homework.vo.ExcelVO;
import nju.edu.homework.vo.GradeSaveVO;
import nju.edu.homework.vo.StudentExcelVO;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

@Controller
public class ExportExcelAction extends BaseAction{

	private static final long serialVersionUID = 1L;
	
	@Autowired 
	private CourseService courseService;
	@Autowired
	private GradeService gradeService;
	
	private String exportFileName;
	private InputStream excelFile;
	
	@Action(
			value = "exportStudentListExcel",
			results = {
					@Result(name = SUCCESS, type = "stream", params = {  
				            "contentType", "application/vnd.ms-excel", 
				            "inputName",  "excelFile", "contentDisposition", 
				            "attachment;filename=${exportFileName}.xls", 
				            "bufferSize", "1024" })
			})
	
	public String execute() throws Exception {
		int courseId = Integer.parseInt(request.getParameter("courseId"));
		int homeworkId = Integer.parseInt(request.getParameter("homeworkId"));
		ExcelUtil eu = new ExcelUtil();  
		String title[] = Common.EXPORT_STUCENT_TITLE;
		List<User> studentList = new ArrayList<User>(courseService.getStudentsByCourseId(courseId));
		List<ExcelVO> dataList = formatStudentList(studentList, homeworkId);
        HSSFWorkbook workbook = eu.exportExcel(title, dataList);
        ByteArrayOutputStream output = new ByteArrayOutputStream();  
        workbook.write(output);  
  
        byte[] ba = output.toByteArray();  
        setExcelFile(new ByteArrayInputStream(ba));
        setExportFileName("studentList");
        output.flush();  
        output.close();  
		return SUCCESS;
	}


	private List<ExcelVO> formatStudentList(List<User> studentList, int homeworkId) {
		List<ExcelVO> list = new ArrayList<ExcelVO>();
		for( User user : studentList){
			Grade grade = gradeService.getGradeByUserAndHomework(user.getId(), homeworkId);
			StudentExcelVO vo = null;
			if(grade == null){
				vo = new StudentExcelVO(user.getUserId(), user.getName(), "", "");
			}
			else{
				vo = new StudentExcelVO(user.getUserId(), user.getName(), grade.getGrade(), grade.getComment());
			}
			
			list.add(vo);
		}
		return list;
	}


	public String getExportFileName() {
		return exportFileName;
	}

	public void setExportFileName(String exportFileName) {
		this.exportFileName = exportFileName;
	}

	public void setExcelFile(InputStream excelFile) {
		this.excelFile = excelFile;
	}
	
	public InputStream getExcelFile(){
		return excelFile;
	}

}
