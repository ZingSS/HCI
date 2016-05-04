package nju.edu.homework.vo;

import java.util.List;

import nju.edu.homework.model.Homework;

public class StatStudentHomeworkVO {

	private HomeworkStateNumVO nums;
	private HomeworkStateListVO lists;
	private List<Homework> passHomeworks;
	
	public StatStudentHomeworkVO(HomeworkStateNumVO nums, List<Homework> passHomeworks) {
		this.nums = nums;
		this.passHomeworks = passHomeworks;
	}
	
	public StatStudentHomeworkVO(HomeworkStateNumVO nums, HomeworkStateListVO lists) {
		this.nums = nums;
		this.lists = lists;
	}

	public List<Homework> getPassHomeworks() {
		return passHomeworks;
	}

	public HomeworkStateNumVO getNums() {
		return nums;
	}

	public HomeworkStateListVO getLists() {
		return lists;
	}

	public void setLists(HomeworkStateListVO lists) {
		this.lists = lists;
	}


}
