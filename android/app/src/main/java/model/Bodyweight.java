package model;

public class Bodyweight extends Exercise{

	public Bodyweight(String name, String musclegroup) {
		super(name, musclegroup);
	}
	
	public void updateReps() {
		setReps(getReps()+2);
	}
	
}
