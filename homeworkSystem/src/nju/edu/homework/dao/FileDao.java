package nju.edu.homework.dao;

import java.util.List;

import nju.edu.homework.model.File;
import nju.edu.homework.util.ResultMessage;

public interface FileDao {

	public ResultMessage save(File file);
	
	public int saveAndGetId(File file);
	
	public ResultMessage delete(File file);
	
	public ResultMessage updateFileById(File file);
	
	public List<File> find(String[] columns, Object[] values);
	
	public List<File> getAllFiles();
	
	public File getFileById(int id);
}
