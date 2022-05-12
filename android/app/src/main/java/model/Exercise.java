package model;

public class Exercise {

//data
	private int sets;
	private int reps;
	private String exerciseName;
	private String muscleGroup;
	private int maxlastreps;

//constructor
	/**
	 * Constructs a new exercise object with a given name, muscle group, weight
	 * (that they last used), last reps, last sets, and intensity of that exercise.
	 * 
	 * @param name          name of the exercise
	 * @param muscle        name of the muscle group
	 * @param userReps      last number of reps
	 * @param userSets      last number of sets
	 */
	public Exercise(String name, String muscle, int userReps, int userSets) {
		exerciseName = name;
		muscleGroup = muscle;
		sets = userSets;
		reps = userReps;
		maxlastreps = 0;
	}

	/**
	 * Creates a new exercise object with a given name and muscle group, sets and reps are set to 0
	 * @param name
	 * @param muscle
	 */
	public Exercise(String name, String muscle) {
		exerciseName = name;
		muscleGroup = muscle;
		sets = 0;
		reps = 0;
		maxlastreps=0;
	}

	/**
	 * returns the max reps that the user could do on the last set
	 * @return max last reps user did
	 */
	public int getMaxlastreps() {
		return maxlastreps;
	}
	
	/**
	 * sets the maxlastreps to how many reps the user did
	 * @param maxreps the number of reps the user completed
	 */
	public void setMaxlastreps(int maxreps) {
		maxlastreps=maxreps;
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
		//return getSets() + " x " + getReps() + " " + getName() + " " + getWeight() + " lbs";
	return getName() + " " + getMuscleGroup();
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