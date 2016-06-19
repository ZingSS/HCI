package nju.edu.homework.dao.impl;

import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import nju.edu.homework.dao.BaseDao;
import nju.edu.homework.dao.CourseDao;
import nju.edu.homework.model.Announcement;
import nju.edu.homework.model.Course;
import nju.edu.homework.util.ResultMessage;

@Repository
public class CourseDaoImpl implements CourseDao{
	
	@Autowired
	private BaseDao baseDao;

	@Override
	public ResultMessage save(Course course) {
		return baseDao.save(course);
	}

	@Override
	public List<Course> find(String[] columns, Object[] values) {
		return baseDao.findByColunms(Course.class, columns, values);
	}

	@Override
	public ResultMessage updateByCourseId(Course course) {
		return baseDao.update(course);
	}

	@Override
	public List<Course> getAllCourse() {
		return baseDao.getAll(Course.class);
	}

	@Override
	public ResultMessage delete(Course course) {
		return baseDao.delete(course);
	}

	@Override
	public Course getCourseById(int id) {
		return baseDao.getById(Course.class, id);
	}

	@Override
	public ResultMessage merge(Course course) {
		return baseDao.merge(course);
	}

	@Override
	public List<String> getAllSemesters() {
		return baseDao.findOneColumnDesc(Course.class, "semester", "String");
	}

	@Override
	public int saveAndGetId(Course course) {
		return baseDao.saveAndGetId(course);
	}

	@Override
	public List<Announcement> getAnnouncement(int id) {
		String sqlStr = "from Announcement s where s.cid=" + id;
		List<Announcement> list = baseDao.find(sqlStr);
		Collections.sort(list);
		return list;
	}

}
