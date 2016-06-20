package nju.edu.homework.dao.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import nju.edu.homework.dao.BaseDao;
import nju.edu.homework.dao.HomeworkDao;
import nju.edu.homework.model.Announcement;
import nju.edu.homework.model.Homework;
import nju.edu.homework.util.ResultMessage;

@Repository
public class HomeworkDaoImpl implements HomeworkDao{
	
	@Autowired
	private BaseDao baseDao;

	@Override
	public ResultMessage save(Homework homework) {
		return baseDao.save(homework);
	}
	
	@Override
	public int saveAndGetId(Homework homework) {
		return baseDao.saveAndGetId(homework);
	}

	@Override
	public ResultMessage delete(Homework homework) {
		return baseDao.delete(homework);
	}

	@Override
	public ResultMessage updateHomeworkById(Homework homework) {
		Homework oldHomework = getHomeworkById(homework.getId());
		homework.setCourse(oldHomework.getCourse());
		return baseDao.update(homework);
	}

	@Override
	public List<Homework> find(String[] columns, Object[] values) {
		return baseDao.findByColunms(Homework.class, columns, values); 
	}

	@Override
	public List<Homework> getAllHomeworks() {
		return baseDao.getAll(Homework.class);
	}

	@Override
	public Homework getHomeworkById(int id) {
		return baseDao.getById(Homework.class, id);
	}

	@Override
	public void saveAnnouncement(Announcement an) {
		baseDao.save(an);
	}

}
