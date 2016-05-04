package nju.edu.homework.dao.impl;

import java.util.List;

import nju.edu.homework.dao.BaseDao;
import nju.edu.homework.dao.CourseFileDao;
import nju.edu.homework.model.CourseFile;
import nju.edu.homework.util.ResultMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CourseFileDaoImpl implements CourseFileDao{
	
	@Autowired
	private BaseDao baseDao;

	@Override
	public ResultMessage saveFile(CourseFile courseFile) {
		return baseDao.save(courseFile);
	}

	@Override
	public List<CourseFile> getAll() {
		return baseDao.getAll(CourseFile.class);
	}

}
