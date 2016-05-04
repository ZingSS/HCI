package nju.edu.homework.dao.impl;

import java.util.List;

import nju.edu.homework.dao.BaseDao;
import nju.edu.homework.dao.SemesterDao;
import nju.edu.homework.model.Semester;
import nju.edu.homework.util.ResultMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class SemesterDaoImpl implements SemesterDao{
	
	@Autowired
	private BaseDao baseDao;

	@Override
	public ResultMessage save(Semester semester) {
		return baseDao.save(semester);
	}

	@Override
	public ResultMessage update(Semester semester) {
		return baseDao.update(semester);
	}

	@Override
	public ResultMessage delete(Semester semester) {
		return baseDao.delete(semester);
	}

	@Override
	public List<Semester> getAllSemesters() {
		return baseDao.getAll(Semester.class);
	}

	@Override
	public Semester getSemesterById(int semesterId) {
		return baseDao.getById(Semester.class, semesterId);
	}

}
