package model;

public class Exercise {

//data
	private double weight;
	private int intensity;
	private int sets;
	private int reps;
	private String exerciseName;
	private String muscleGroup;

//constructor

	public Exercise(String name, String muscle, double userMaxWeight,
			int userReps, int userSets, int userIntensity) {
		exerciseName = name;
		muscleGroup = muscle;
		weight = Math.round(userMaxWeight * .85/5)*5;
		sets = userSets;
		reps = userReps;
		intensity = userIntensity;

	}

	public String getMuscleGroup() {
		return muscleGroup;
	}

	public String getName() {
		return exerciseName;
	}

	public String toString() {
		return getSets() + " x " + getReps() + " " + getName() + " " + getWeight() + " lbs";
	}


	int getIntensity() {
		return intensity;
	}

	private void setIntensity(int intense) {
		intensity = intense;
	}


	public double getWeight() {
		return weight;
	}

	public void setWeight(double weight) {
		this.weight = weight;
	}

	public int getSets() {
		return sets;
	}

	public void setSets(int sets) {
		this.sets = sets;
	}

	public int getReps() {
		return reps;
	}

	public void setReps(int reps) {
		this.reps = reps;
	}

}