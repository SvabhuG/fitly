package model;

public class Barbell extends Exercise {

	private double weight;
	
	public Barbell(String name, String musclegroup) {
		super (name, musclegroup);
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
	 * sets the weight to 10 lbs more than the previous weight
	 * 
	 */
	public void updateWeighthard() {
		weight+=10;
	}
	
	/**
	 * sets the weight to 5 lbs more than the previous weight
	 * 
	 */
	public void updateWeightsoft() {
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
