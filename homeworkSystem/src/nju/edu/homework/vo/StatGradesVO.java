package nju.edu.homework.vo;

public class StatGradesVO {
	
	private int heighest;
	private int lowest;
	private double average;
	
	public StatGradesVO(int heighest, int lowest, double average) {
		this.heighest = heighest;
		this.lowest = lowest;
		this.average = average;
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
