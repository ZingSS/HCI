package nju.edu.homework.util;

import java.io.File;
import java.sql.Date;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import org.apache.struts2.ServletActionContext;

import nju.edu.homework.model.Course;
import nju.edu.homework.model.Homework;
import nju.edu.homework.model.User;
import nju.edu.homework.vo.CourseHomeworkExcelVO;
import nju.edu.homework.vo.CourseStudentExcelVO;
import nju.edu.homework.vo.ExcelVO;

public class Common {
	
	public static final String ROLE_ADMIN = "admin";
	
	public static final String ROLE_STUDENT = "student";
	
	public static final String ROLE_TEACHER = "teacher";
	
	public static final String ROLE_DIRECTOR = "director";
	
	public static final String TIME_ERROR = "timeError";
	
//	public static final String FILE_PATH = ServletActionContext.getServletContext().getRealPath("/upload");
	public static final String FILE_PATH = "/Users/soujing/Documents/Study/Junior/HCI/HCI/homeworkSystem/WebContent/upload";
//	"/Users/soujing/Documents/Study/Junior/J2EE/NewLab/homeworkSystem/WebContent/upload";
	
	public static final String COMMIT = "commit";
	public static final String APPROVAL = "approval";
	public static final String FAILED = "failed";
	public static final String PASS = "pass";
	
	public static final String PUBLISH_HOMEWORK = "publishHomework";
	public static final String SUBMISSION_DDL = "submissionDDL";
	public static final String CORRECTION_OVER = "correctionOver";
	public static final String TO_CORRECT_HOMEWORK = "toCorrectHomework";
	public static final String PUBLISH_GRADE = "publishGrade";
	public static final String RE_CORRECT = "reCorrect";
	public static final String PUBLISH_EXAMPLE = "publishExample";
	public static final String NEW_ANNOUNCEMENT="newAnnouncement";
	public static final String AS_ANNOUNCEMENT = "asAnnouncement";
	
	public static final String STAT_ALL_COURSE = "statAllCourses";
	public static final String STAT_COURSE_HW = "statCourseHomework";
	public static final String STAT_COURSE_ST = "statCourseStudent";
	public static final String STAT_ALL_ST = "statAllStudents";
	public static final String STAT_ST_INFO = "statStudentInfo";
	public static final String STAT_ALL_TE = "statAllTeachers";
	public static final String STAT_TE_INFO = "statTeacherInfo";
	
	public static final String[] EXPORT_STUCENT_TITLE = {"学号" , "姓名", "成绩", "点评"};
	public static final String[] EXPORT_COURSE_STUDENT_TITLE = {"学号" , "姓名"};
	public static final String[] EXPORT_COURSE_HW_TITLE = {"作业名" , "学生提交截止", "助教批改截止"};
	public static final String[] EXPORT_COURSE_SG_TITLE = {"学号" , "学生名", "成绩"};

	
	public static String formatSemester(String semester){
		String year = semester.substring(0, 4);
		String number = semester.substring(4);
		StringBuffer printSemester = new StringBuffer();
		printSemester.append(year).append("-").append(Integer.parseInt(year)+1).append("学年第");
		if (number.equals("1")) {
			printSemester.append("一学期");
		}
		else {
			printSemester.append("二学期");
		}
		return printSemester.toString();
	}
	
	public static String formatShortSemester(String semester){
		StringBuffer savedSemester = new StringBuffer(semester.substring(0, 4));
		if (semester.contains("一")) {
			savedSemester.append(1);
		}
		else {
			savedSemester.append(2);
		}
		return savedSemester.toString();
	}
	
	public static List<ExcelVO> formatHomework(List<Homework> homeworks) {
		List<ExcelVO> vos = new ArrayList<ExcelVO>();
		for(Homework homework : homeworks){
			vos.add(new CourseHomeworkExcelVO(homework.getName(), homework.getStudentDDL(), homework.getAssistantDDL()));
		}
		return vos;
	}

	public static List<ExcelVO> formatStudent(List<User> students){
		List<ExcelVO> vos = new ArrayList<ExcelVO>();
		for( User user : students){
			vos.add(new CourseStudentExcelVO(user.getUserId(), user.getName()));
		}
		return vos;
	}
	
	public static List<Course> sortCourse(List<Course> courses){
		Collections.sort(courses);
		return courses;
	}
	
	
	
	public static String getExtensionName(String fileName){
		int position = fileName.lastIndexOf(".");   
        return fileName.substring(position);  
	}
	
	public static String buildDir(int courseId, int homeworkId){
		String dir = Common.FILE_PATH + "/Course" + courseId + "/Homework" + homeworkId;
		File fileLocation = new File(dir);		
		if (!fileLocation.exists()) {
			boolean isCreated  = fileLocation.mkdirs();
            if(!isCreated) {  
                //目标上传目录创建失败,可做其他处理,例如抛出自定义异常等,一般应该不会出现这种情况。  
            	System.out.println("目录创建失败");
            	return "";
            }  
		}
		return dir;	
	}
	
	public static String buildDir(int courseId){
		String dir = Common.FILE_PATH + "/Course" + courseId;
		File fileLocation = new File(dir);		
		if (!fileLocation.exists()) {
			boolean isCreated  = fileLocation.mkdirs();
            if(!isCreated) {  
                //目标上传目录创建失败,可做其他处理,例如抛出自定义异常等,一般应该不会出现这种情况。  
            	System.out.println("目录创建失败");
            	return "";
            }  
		}
		return dir;
		
	}
	
	public static String formatDate(Date date){
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd"); 
		return sdf.format(date);
	}
	
	public static String formatTimestamp(Timestamp time){
		DateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");   
		return sdf.format(time);
	}
	
	public static Timestamp stringToTimestamp(String time){
		 Timestamp ts = Timestamp.valueOf(time);  	
		 return ts;
	}

}
