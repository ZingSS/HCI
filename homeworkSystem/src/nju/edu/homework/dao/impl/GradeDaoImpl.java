package nju.edu.homework.dao.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import nju.edu.homework.dao.BaseDao;
import nju.edu.homework.dao.GradeDao;
import nju.edu.homework.model.Grade;
import nju.edu.homework.util.ResultMessage;

@Repository
public class GradeDaoImpl implements GradeDao{
	
	@Autowired
	private BaseDao baseDao;

	@Override
	public ResultMessage save(Grade grade) {
		return baseDao.save(grade);
	}

	@Override
	public int saveAndGetId(Grade grade) {
		return baseDao.saveAndGetId(grade);
	}

	@Override
	public ResultMessage delete(Grade grade) {
		return baseDao.delete(grade);
	}

	@Override
	public ResultMessage updateGradeById(Grade grade) {
		return baseDao.update(grade);
	}

	@Override
	public List<Grade> find(String[] columns, Object[] values) {
		return baseDao.findByColunms(Grade.class, columns, values);
	}

	@Override
	public List<Grade> getAllGrades() {
		return baseDao.getAll(Grade.class);
	}

	@Override
	public Grade getGradeById(int id) {
		return baseDao.getById(Grade.class, id);
	}

	
}
