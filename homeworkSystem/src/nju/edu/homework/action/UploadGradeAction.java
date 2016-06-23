package nju.edu.homework.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;

import nju.edu.homework.model.Grade;
import nju.edu.homework.model.User;
import nju.edu.homework.service.FileService;
import nju.edu.homework.service.GradeService;
import nju.edu.homework.service.UserService;
import nju.edu.homework.util.Common;
import nju.edu.homework.vo.GradeSaveVO;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

@Controller
public class UploadGradeAction extends BaseAction{

	private static final long serialVersionUID = 1L;
	
	@Autowired
	private FileService fileService;
	@Autowired
	private UserService userService;
	@Autowired
	private GradeService gradeService;
	
	private String fileFileName;
	private File file;
	private int courseId;
	private int homeworkId;

	@Action(
			value = "uploadGrade",
			results = {
					@Result(name = SUCCESS, location = "/jsp/student/toCorrectHomework.action", type="redirect", params = {"courseId", "${courseId}", "homeworkId", "${homeworkId}", }),
			})
	
	public String execute() throws Exception {
		
		int homeworkId = Integer.parseInt(request.getParameter("homeworkId"));
		String courseId = request.getParameter("courseId");

		String dir = Common.FILE_PATH + "/Course" + courseId + "/Homework" + homeworkId;
		System.out.println(dir + "  这是路径名   ");
		
		Workbook book = createWorkBook(new FileInputStream(file));  
		if (book == null) {
			return ERROR;
		}
		if (book.getNumberOfSheets()> 0){
            //写个循环，获取所有的，这边我就获取第一个sheet，为了简单
			Sheet aSheet = book.getSheetAt(0);
			int lastRows = aSheet.getPhysicalNumberOfRows();	// 这个方法得到了所有的行数
			System.out.println(lastRows + "   xml文件里面的行数");
			Row titleRow = aSheet.getRow(0);
			if (!isTitleRowValid(titleRow)) {
				System.out.println("这个文件不合法啊");
				return ERROR;
			}
		    for(int j = 1; j < lastRows; j++){		// 这里要除去第一行
		        Row aRow = aSheet.getRow(j);
		        if(aRow != null){
		        	int studentId = 0;
		        	String grade = null;
		        	String comment = null;
		            if(aRow.getCell(0) != null){	// 这里是学号
		            	String id = getCellContent(aRow.getCell(0));
		            	System.out.println(id + "  这是得到的学生id");
		                User user = userService.getuserByUserId(id);
		                studentId = user.getId();
		                System.out.println(studentId + "   这是得到的学生的编号");
		            	}
		            if (aRow.getCell(1) != null) {	// 这里是姓名
						
					}
		            if (aRow.getCell(2) != null) { 	// 这里是成绩
		            	grade = (int)aRow.getCell(2).getNumericCellValue() + "";
		            	System.out.println(grade + "  这是得到的学生成绩");
					}
		            if (aRow.getCell(3) != null) {
						comment = getCellContent(aRow.getCell(3));
					}
		            if (studentId != 0) {
		            	GradeSaveVO gradeVo = new GradeSaveVO(new Grade(grade, comment), homeworkId, studentId);
		            	// 需要判断当前用户是否已经有成绩了
		            	if(gradeService.haveGrade(homeworkId, studentId)){
		            		gradeService.update(gradeVo);
		            	}
		            	else{
		            		gradeService.addGrade(gradeVo);
		            	}
					}
		            }
		         }
		     }
         
        return SUCCESS;
	}
	
	private boolean isTitleRowValid(Row titleRow) {
		if (getCellContent(titleRow.getCell(0)).equals("学号")) {
			if (getCellContent(titleRow.getCell(1)).equals("姓名")) {
				if (getCellContent(titleRow.getCell(2)).equals("成绩")) {
					System.out.println("xml文件大概是合法的");
					return true;
				}
			}
		}
		return false;
	}
	
	// 得到单元格的String格式
	private String getCellContent(Cell cell){
		return cell.getStringCellValue().trim();
	}

	public Workbook createWorkBook(InputStream inputStream) throws IOException{    
        if(getFileFileName().toLowerCase().endsWith("xls")){    
             return new HSSFWorkbook(inputStream);    
        }else if(getFileFileName().toLowerCase().endsWith("xlsx")){  
             return new XSSFWorkbook(inputStream);  
        }else{  
             return null;  
        }  
     }
	
	public File getFile() {
		return file;
	}

	public void setFile(File file) {
		this.file = file;
	}

	public String getFileFileName() {
		return fileFileName;
	}

	public void setFileFileName(String fileFileName) {
		this.fileFileName = fileFileName;
	}

	public int getCourseId() {
		return courseId;
	}

	public void setCourseId(int courseId) {
		this.courseId = courseId;
	}

	public int getHomeworkId() {
		return homeworkId;
	}

	public void setHomeworkId(int homeworkId) {
		this.homeworkId = homeworkId;
	} 
}
