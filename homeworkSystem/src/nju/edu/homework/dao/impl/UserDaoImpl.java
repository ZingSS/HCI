package nju.edu.homework.dao.impl;

import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import nju.edu.homework.dao.BaseDao;
import nju.edu.homework.dao.UserDao;
import nju.edu.homework.model.User;
import nju.edu.homework.util.ResultMessage;

@Repository
public class UserDaoImpl implements UserDao{
	
	@Autowired
	private BaseDao baseDao;

	@Override
	public ResultMessage save(User user) {
		return baseDao.save(user);
	}
	
	public ResultMessage merge(User user){
		return baseDao.merge(user);
	}

	@Override
	public List<User> find(String[] columns, Object[] values) {
		return baseDao.findByColunms(User.class, columns, values);
	}

	@Override
	public ResultMessage updateByUserId(User user) {
		return baseDao.update(user);
	}

	@Override
	public List<User> getAllUsers() {
		List<User> users = baseDao.getAll(User.class);
		Collections.sort(users);
		return users;
	}

	@Override
	public ResultMessage delete(User user) {
		return baseDao.delete(user);
	}

	@Override
	public ResultMessage delelte(int id) {
		return baseDao.delete(User.class, id);
	}

	@Override
	public User getUserById(int id) {
		return baseDao.getById(User.class, id);
	}

	@Override
	public List<User> fuzzySearch(String[] columns, String[] values) {
		return baseDao.fuzzySearch(User.class, columns, values);
	}

}
