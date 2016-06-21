package nju.edu.homework.action;

import java.io.FileInputStream;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;

import nju.edu.homework.model.CourseFile;
import nju.edu.homework.model.File;
import nju.edu.homework.service.CourseFileService;
import nju.edu.homework.service.FileService;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

@Controller
public class DownloadHomeworkAction extends BaseAction{

	private static final long serialVersionUID = 1L;

	@Autowired
	private FileService fileService;
	@Autowired
	private CourseFileService courseFileService;

	private File file;
	private CourseFile courseFile;
	private String fileName;

	@Action(
			value = "downloadHomework",
			results = {
					@Result(name = SUCCESS, location = "/jsp/student/toSubmitHomework.action", type="stream"),
					@Result(name = SUCCESS, type = "stream", params = {
				            "contentType", "application/octet-stream;charset=utf-8",
				            "inputName",  "inputStream",
				            "contentDisposition", "attachment;filename=\"${fileName}\"",
				            "bufferSize", "4096" })
			})

	public String downloadHomework() throws Exception {
		int studentId = Integer.parseInt(request.getParameter("studentId"));
		int homeworkId = Integer.parseInt(request.getParameter("homeworkId"));
		setFile(fileService.getFileByUserAndHomework(studentId, homeworkId));
		setFileName(file.getName());
		return SUCCESS;
	}

	@Action(
			value = "downloadAttachment",
			results = {
					@Result(name = SUCCESS, location = "/jsp/student/toSubmitHomework.action", type="stream"),
					@Result(name = SUCCESS, type = "stream", params = {
				            "contentType", "application/octet-stream;charset=utf-8",
				            "inputName",  "inputStream",
				            "contentDisposition", "attachment;filename=\"${fileName}\"",
				            "bufferSize", "4096" })
			})

	public String downloadAttachment() throws Exception {
		int fileId = Integer.parseInt(request.getParameter("fileId"));
		setFile(fileService.getFileById(fileId));
		setFileName(file.getName());
		return SUCCESS;
	}

	@Action(
			value = "downloadSummary",
			results = {
					@Result(name = SUCCESS, location = "/jsp/student/toSubmitHomework.action", type="stream"),
					@Result(name = SUCCESS, type = "stream", params = {
				            "contentType", "application/octet-stream;charset=utf-8",
				            "inputName",  "inputCourseStream",
				            "contentDisposition", "attachment;filename=\"${fileName}\"",
				            "bufferSize", "4096" })
			})

	public String downloadSummary() throws Exception {
		int courseId = Integer.parseInt(request.getParameter("courseId"));
		setCourseFile(courseFileService.getFileByCourseId(courseId));
		setFileName(courseFile.getName());
		return SUCCESS;
	}

	public InputStream getInputStream() throws Exception {
        String path = file.getPath() + "//"+ file.getName();
        return  new FileInputStream(path);
    }

	public InputStream getInputCourseStream() throws Exception {
        String path = courseFile.getPath() + "//"+ courseFile.getName();
        return  new FileInputStream(path);
    }

	public File getFile() {
		return file;
	}

	public void setFile(File file) {
		this.file = file;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) throws UnsupportedEncodingException {
		this.fileName = new String(fileName.getBytes(),"ISO-8859-1");
	}

	public CourseFile getCourseFile() {
		return courseFile;
	}

	public void setCourseFile(CourseFile courseFile) {
		this.courseFile = courseFile;
	}

}
