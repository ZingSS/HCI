package nju.edu.homework.vo;

import nju.edu.homework.model.Homework;

public class StatCourseHomeworkVO {

	private Homework homework;
	private int heighest;
	private int lowest;
	private double average;
	
	public StatCourseHomeworkVO(Homework homework, int heighest, int lowest, double average) {
		this.homework = homework;
		this.heighest = heighest;
		this.lowest = lowest;
		this.average = average;
	}

	public Homework getHomework() {
		return homework;
	}

	public void setHomework(Homework homework) {
		this.homework = homework;
	}

	public int getHeighest() {
		return heighest;
	}

	public void setHeighest(int heighest) {
		this.heighest = heighest;
	}

	public int getLowest() {
		return lowest;
	}

	public void setLowest(int lowest) {
		this.lowest = lowest;
	}

	public double getAverage() {
		return average;
	}

	public void setAverage(double average) {
		this.average = average;
	}
	
	
}
