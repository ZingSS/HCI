package nju.edu.homework.service.impl;

import java.util.ArrayList;
import java.util.List;

import nju.edu.homework.dao.FileDao;
import nju.edu.homework.dao.HomeworkDao;
import nju.edu.homework.dao.UserDao;
import nju.edu.homework.model.File;
import nju.edu.homework.model.Homework;
import nju.edu.homework.model.User;
import nju.edu.homework.service.FileService;
import nju.edu.homework.util.ResultMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class FileServiceImpl implements FileService{
	
	@Autowired
	private FileDao fileDao;
	@Autowired
	private UserDao userDao;
	@Autowired
	private HomeworkDao homeworkDao;

	@Override
	public ResultMessage addFile(File file, int homeworkId, int studentId) {
		Homework homework = homeworkDao.getHomeworkById(homeworkId);
		User user = userDao.getUserById(studentId);
		file.setHomework(homework);
		file.setUser(user);
		System.out.println(file.getName() + "  " + file.getPath() + "    这是要被存储的文件");
		fileDao.save(file);
		
		homework.getFiles().add(file);			// 这是学生的
		user.getFiles().add(file);
		homeworkDao.updateHomeworkById(homework);
		return userDao.updateByUserId(user);
	}
	
	@Override
	public ResultMessage addHomeworkFile(File file, int homeworkId, int teacherId) {
		Homework homework = homeworkDao.getHomeworkById(homeworkId);
		User user = userDao.getUserById(teacherId);
		file.setHomework(homework);
		file.setUser(user);
		System.out.println(file.getName() + "  " + file.getPath() + "    这是要被存储的文件");
		fileDao.save(file);
		
		homework.setFileId(file.getId());		// 这是老师上传的作业附件 所以直接加到homework 中
		return homeworkDao.updateHomeworkById(homework);
	}

	@Override
	public ResultMessage addPublishFile(File file, int homeworkId, int teacherId) {
		Homework homework = homeworkDao.getHomeworkById(homeworkId);
		User user = userDao.getUserById(teacherId);
		file.setHomework(homework);
		file.setUser(user);
		System.out.println(file.getName() + "  " + file.getPath() + "    这是要被存储的文件");
		fileDao.save(file);
		
		homework.setPublishFileId(file.getId());	// 这是老师上传的作业答案和点评 所以直接加到homework 中
		return homeworkDao.updateHomeworkById(homework);
	}
	@Override
	public ResultMessage delete(File file) {
		return fileDao.delete(file);
	}

	@Override
	public ResultMessage update(File file) {
		return fileDao.updateFileById(file);
	}

	@Override
	public List<File> getAllFiles() {
		return fileDao.getAllFiles();
	}

	@Override
	public File getFileById(int fileId) {
		return fileDao.getFileById(fileId);
	}

	@Override
	public File getFileByUserAndHomework(int studentId, int homeworkId) {
		List<File> list = getAllFiles();
		for(File file : list){
			if (file.getHomework().getId() == homeworkId && file.getUser().getId() == studentId) {
				return file;
			}
		}
		return null;
	}

	@Override
	public List<Boolean> studentsHasHomework(List<User> courseStudentList, int homeworkId) {
		List<Boolean> list = new ArrayList<Boolean>();
		for(User user : courseStudentList){
			if (getFileByUserAndHomework(user.getId(), homeworkId) == null) {
				list.add(false);
			}
			else {
				list.add(true);
			}
		}
		return list;
	}

	@Override
	public boolean haveFile(int homeworkId, int userId) {
		return getFileByUserAndHomework(userId, homeworkId)==null?false:true;
	}

	@Override
	public void updateFile(File fileEntity, int homeworkId, int userId) {
		File file = getFileByUserAndHomework(userId, homeworkId);
		java.io.File deleteFile = new java.io.File(file.getPath() + "/" +file.getName());
		deleteFile.delete();
		file.setName(fileEntity.getName());
		update(file);
	}


	@Override
	public boolean hasStudentSubmited(int homeworkId, int studentId) {
		List<File> list = getAllFiles();
		for(File file : list){
			if (file.getHomework().getId() == homeworkId && file.getUser().getId() == studentId) {
				return true;
			}
		}
		return false;
	}

}
