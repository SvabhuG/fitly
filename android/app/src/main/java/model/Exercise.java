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
	/**
	 * Constructs a new exercise object with a given name, muscle group, weight
	 * (that they last used), last reps, last sets, and intensity of that exercise.
	 * 
	 * @param name          name of the exercise
	 * @param muscle        name of the muscle group
	 * @param userWeight    last used weight
	 * @param userReps      last number of reps
	 * @param userSets      last number of sets
	 * @param userIntensity user-opinion of intensity of the exercise
	 */
	public Exercise(String name, String muscle, double userWeight, int userReps, int userSets, int userIntensity) {
		exerciseName = name;
		muscleGroup = muscle;
		weight = userWeight;
		// weight = Math.round(userMaxWeight * .85 / 5) * 5;
		sets = userSets;
		reps = userReps;
		intensity = userIntensity;

	}

	/**
	 * returns the muscle group
	 * 
	 * @return the muscle group
	 */
	public String getMuscleGroup() {
		return muscleGroup;
	}

	/**
	 * returns the name of the exercise
	 * 
	 * @return name of exercise
	 */
	public String getName() {
		return exerciseName;
	}

	/**
	 * formats the sets, reps, name, and weight of the exercise as a readable
	 * exercise
	 */
	public String toString() {
		return getSets() + " x " + getReps() + " " + getName() + " " + getWeight() + " lbs";
	}

	/**
	 * returns the intensity of the exercise
	 * 
	 * @return intensity
	 */
	public int getIntensity() {
		return intensity;
	}

	/**
	 * sets the intensity to a given intensity
	 * 
	 * @param intense the new intensity
	 */
	private void setIntensity(int intense) {
		intensity = intense;
	}

	/**
	 * returns the current weight that the user is lifting
	 * 
	 * @return the weight
	 */
	public double getWeight() {
		return weight;
	}

	/**
	 * sets the weight to a given weight
	 * 
	 * @param weight the new weight
	 */
	public void setWeight(double weight) {
		this.weight = weight;
	}

	/**
	 * returns the current sets the user is doing
	 * 
	 * @return the number of sets
	 */
	public int getSets() {
		return sets;
	}

	/**
	 * changes the number of sets to a given number of sets
	 * 
	 * @param sets new number of sets
	 */
	public void setSets(int sets) {
		this.sets = sets;
	}

	/**
	 * returns the number of reps
	 * 
	 * @return number of reps
	 */
	public int getReps() {
		return reps;
	}

	/**
	 * changes the number of reps to a given number of reps
	 * 
	 * @param reps the new number of reps
	 */
	public void setReps(int reps) {
		this.reps = reps;
	}

}