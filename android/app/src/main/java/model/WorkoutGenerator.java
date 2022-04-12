package model;

import java.util.ArrayList;

public class WorkoutGenerator {

	public static void main(String[] args) {
		Exercise flyes = new Exercise("Flyes", "Chest", 125.0, 8, 6, 2);
		Exercise benchPress = new Exercise("Bench Press", "Chest", 125.0, 12, 3, 7);
		Exercise pullover = new Exercise("Pullover", "Chest", 20, 12, 3, 10);
		Exercise deadlift = new Exercise("Deadlift", "Back", 150, 8, 3, 5);
		Exercise dbrows = new Exercise("Rows", "Back", 15, 5, 12, 5);
		Exercise latpulldowns = new Exercise("Lat Pull Downs", "Back", 45, 6, 10, 2);

		
		
		ArrayList<Exercise> Exercises = new ArrayList<Exercise>();
		Exercises.add(flyes);
		Exercises.add(benchPress);
		Exercises.add(pullover);
		Exercises.add(deadlift);
		Exercises.add(dbrows);
		Exercises.add(latpulldowns);


		// set inputs to what they actually did not what we suggested
		// if weight increase isn't a multiple of 5, add more reps?
		// if statements for each muscle group?
		// running into issues with increasing weight

		// intensity scaling
		int count = 0;

		for (Exercise exercise : Exercises) {
			if (count % 3 == 0)
				System.out.println("\n" + exercise.getMuscleGroup() + " Workout");
			count++;

			if (exercise.getIntensity() >= 8) {
				exercise.setReps(exercise.getReps() - 2);
				exercise.setWeight(Math.round((exercise.getWeight() * .85) / 5) * 5);

				/*
				 * if (exercise.getWeight() * .85 % 5 != 0) exercise.setReps(exercise.getReps()
				 * + 1); else exercise.setWeight(exercise.getWeight() * .85);
				 */
				// sets stays the same?
			} else if (exercise.getIntensity() > 4 && exercise.getIntensity() < 8) {
				exercise.setReps(exercise.getReps() + 1);
				/*
				 * if (exercise.getWeight() * 1.05 % 5 != 0) exercise.setReps(exercise.getReps()
				 * + 1); else exercise.setWeight(exercise.getWeight() * 1.05);
				 */

//sets and reps stay the same?
			} else if (exercise.getIntensity() <= 4) {
				exercise.setWeight(Math.round((exercise.getWeight() * 1.05) / 5) * 5);
				exercise.setSets(exercise.getSets() + 1);
			}
			System.out.println(exercise.toString());

		} // end for


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
