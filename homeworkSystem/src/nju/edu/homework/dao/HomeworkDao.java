package nju.edu.homework.dao;

import java.util.List;

import nju.edu.homework.model.Announcement;
import nju.edu.homework.model.Homework;
import nju.edu.homework.util.ResultMessage;

public interface HomeworkDao{
	
	public ResultMessage save(Homework homework);
	
	public int saveAndGetId(Homework homework);
	
	public ResultMessage delete(Homework homework);
	
	public ResultMessage updateHomeworkById(Homework homework);
	
	public List<Homework> find(String[] columns, Object[] values);
	
	public List<Homework> getAllHomeworks();
	
	public Homework getHomeworkById(int id);

	public void saveAnnouncement(Announcement an);
	
	
}
