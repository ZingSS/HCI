package nju.edu.homework.dao.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import nju.edu.homework.dao.BaseDao;
import nju.edu.homework.dao.FileDao;
import nju.edu.homework.model.File;
import nju.edu.homework.util.ResultMessage;

@Repository
public class FileDaoImpl implements FileDao{
	
	@Autowired
	private BaseDao baseDao;

	@Override
	public ResultMessage save(File file) {
		return baseDao.save(file);
	}

	@Override
	public int saveAndGetId(File file) {
		return baseDao.saveAndGetId(file);
	}

	@Override
	public ResultMessage delete(File file) {
		return baseDao.delete(file);
	}

	@Override
	public ResultMessage updateFileById(File file) {
		return baseDao.update(file);
	}

	@Override
	public List<File> find(String[] columns, Object[] values) {
		return baseDao.findByColunms(File.class, columns, values);
	}

	@Override
	public List<File> getAllFiles() {
		return baseDao.getAll(File.class);
	}

	@Override
	public File getFileById(int id) {
		return baseDao.getById(File.class, id);
	}

}
