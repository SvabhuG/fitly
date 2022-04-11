package model;

import java.util.ArrayList;

public class WorkoutGenerator {

	public static void main(String[] args) {
//arraylists of each muscle group?
		Exercise flyes = new Exercise("Flyes", "Chest", 50.0, 8, 6, 2);
		Exercise benchPress = new Exercise("Bench Press", "Chest", 125.0, 12, 3, 7);
		Exercise pullover = new Exercise("Pullover", "Chest", 20, 12, 3, 10);

		ArrayList<Exercise> Exercises = new ArrayList<Exercise>();
		Exercises.add(flyes);
		Exercises.add(benchPress);
		Exercises.add(pullover);

		// set inputs to what they actually did not what we suggested
		// if weight increase isn't a multiple of 5, add more reps?
		// if statements for each muscle group?
		//running into issues with increasing weight
		for (Exercise exercise : Exercises) {
			// intensity scaling

			if (exercise.getIntensity() >= 8) {
				exercise.setReps(exercise.getReps() - 2);
				if (exercise.getWeight()* .85 % 5 != 0)
					exercise.setReps(exercise.getReps()+1);
				else
				exercise.setWeight(exercise.getWeight() * .85);
				// sets stays the same?
			} else if (exercise.getIntensity() > 4 && exercise.getIntensity() < 8) {
				if (exercise.getWeight() * 1.05 % 5 != 0) 
					exercise.setReps(exercise.getReps() + 1);
				 else
					exercise.setWeight(exercise.getWeight() * 1.05);

//sets and reps stay the same?
			} else if (exercise.getIntensity() <= 4) {
				exercise.setWeight(Math.ceil((exercise.getWeight() * 1.15)/5)*5 );
				exercise.setSets(exercise.getSets() + 1);
			}

		} // end for

		System.out.println(flyes.getMuscleGroup() + " Workout \n" + flyes.toString() + "\n" + benchPress.toString()
				+ "\n" + pullover.toString());
		// time since last scaling
		/**
		 * for (Chest exercise : chestExercises) { if
		 * (exercise.getTimeSinceLast()==suggested) { //no change }
		 * 
		 * else if (exercise.getTimeSinceLast()<suggested) { //scale down? }
		 * 
		 * else if (exercise.getTimeSinceLast()>suggested) { //also scale down? } }//end
		 * for
		 */
	}

}
