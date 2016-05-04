package nju.edu.homework.service;

import java.util.List;

import nju.edu.homework.model.File;
import nju.edu.homework.model.User;
import nju.edu.homework.util.ResultMessage;

public interface FileService {
	
	public ResultMessage addFile(File file, int homeworkId, int studentId);
	
	public ResultMessage addHomeworkFile(File file, int homeworkId, int teacherId);
	
	public ResultMessage addPublishFile(File file, int homeworkId, int teacherId);
		
	public ResultMessage delete(File file);
	
	public ResultMessage update(File file);
	
	public List<File> getAllFiles();
	
	public File getFileById(int fileId);

	public File getFileByUserAndHomework(int studentId, int homeworkId);

	public List<Boolean> studentsHasHomework(List<User> courseStudentList, int homeworkId);

	public boolean haveFile(int homeworkId, int userId);

	public void updateFile(nju.edu.homework.model.File fileEntity, int homeworkId, int userId);

	public boolean hasStudentSubmited(int homeworkId, int studentId);

	

}
