package model;

public class Chest {

//data
private double timeSinceLast;
private double weightlastEx1;
private double weightlastEx2;
private double weightlastEx3;
private double maxWeightCompound;
private double timeWorkedLast;

//constructors


public Chest() {
	timeSinceLast = 0;
	weightlastEx1 = 0;
	weightlastEx2 = 0;
	weightlastEx3 = 0;
	maxWeightCompound = 0;
	timeWorkedLast = 0;
}

public Chest(double userSinceLast, double userWeightEx1, double userWeightEx2, double userWeightEx3, double usermaxLbCompound, double userTimeLast) {
	timeSinceLast = userSinceLast;
	weightlastEx1 = userWeightEx1;
	weightlastEx2 = userWeightEx2;
	weightlastEx3 = userWeightEx3;
	maxWeightCompound = usermaxLbCompound;
	timeWorkedLast = userTimeLast;
}

//methods
public double getTimeSinceLast() {
	return timeSinceLast;
}

public void setTimeSinceLast(double timeSinceLast) {
	this.timeSinceLast = timeSinceLast;
}

public double getWeightlastEx1() {
	return weightlastEx1;
}

public void setWeightlastEx1(double weightlastEx1) {
	this.weightlastEx1 = weightlastEx1;
}

public double getWeightlastEx2() {
	return weightlastEx2;
}

public void setWeightlastEx2(double weightlastEx2) {
	this.weightlastEx2 = weightlastEx2;
}

public double getWeightlastEx3() {
	return weightlastEx3;
}

public void setWeightlastEx3(double weightlastEx3) {
	this.weightlastEx3 = weightlastEx3;
}

public double getMaxWeightCompound() {
	return maxWeightCompound;
}

public void setMaxWeightCompound(double maxWeightCompound) {
	this.maxWeightCompound = maxWeightCompound;
}

public double getTimeWorkedLast() {
	return timeWorkedLast;
}

public void setTimeWorkedLast(double timeWorkedLast) {
	this.timeWorkedLast = timeWorkedLast;
}

public void Ex1Chest() {
	String Ex1 = new String();
}
}


	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

