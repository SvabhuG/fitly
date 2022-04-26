package model;

public class Dumbbell extends Exercise{
private int weight;
	
public Dumbbell(String name, String musclegroup) {
	super(name, musclegroup);
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
	 * sets the weight to 5 lbs more than what they were doing
	 *  
	 * @param weight the new weight
	 */
	public void updateWeightsoft() {
		weight+=5;
	}
	
	/**
	 * sets the weight to 10 lbs more than what they were doing
	 *  
	 * @param weight the new weight
	 */
	public void updateWeighthard() {
		weight+=10;
	}
	
	/**
	 * sets the weight to a given weight
	 * @param weight in lbs
	 */
	public void setWeight(int weight) {
		this.weight= weight;
	}
}
