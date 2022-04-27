package model;

import java.util.ArrayList;
import java.util.Scanner;

public class User {

	private ArrayList<String> muscles;
	private ArrayList<Exercise> exercises;
	private boolean rotation;
	private int dayssincelast;
	private int mpw;
	private int lastmusclegroup;

	/**
	 * default construction of user with empty arraylists of string for muscles and
	 * exercise for exercises rotation is set to false -> this starts the user on
	 * the strength cycle. When rotation is true after 8 weeks, then they switch to
	 * hypertrophy
	 */
	public User(int muscle) {
		muscles = new ArrayList<String>();
		exercises = new ArrayList<Exercise>();
		rotation = false;
		lastmusclegroup=0;
		mpw= muscle;
	}

	/**
	 * returns arraylist of muscle groups
	 * 
	 * @return arraylist of muscle groups
	 */
	public ArrayList<String> getMuscles() {
		return muscles;
	}

	/**
	 * returns arraylist of exercises that fits the user's muscle groups
	 * 
	 * @return arraylist of exercises
	 */
	public ArrayList<Exercise> getExercises() {
		return exercises;
	}

	/**
	 * sets the arraylist exercises equal to a given arraylist
	 * 
	 * @param exercises given arraylist of string names of exercises that fit the
	 *                  user's targeted muscle group
	 */
	public void setExercises(ArrayList<Exercise> exercises) {
		this.exercises = exercises;
	}

	/**
	 * switches the rotation to the other cycle (false = strength, true =
	 * hypertrophy)
	 */
	public void switchRotation() {
		rotation = !rotation;
	}

	/**
	 * returns the rotation that the user is on (false = strength, true =
	 * hypertrophy)
	 * 
	 * @return false for strength or true for hypertrophy
	 */
	public boolean getRotation() {
		return rotation;
	}

	/**
	 * sets the arraylist muscles equal to a given arraylist
	 * 
	 * @param muscles given arraylist of string of muscle groups
	 */
	public void setMuscles(ArrayList<String> muscles) {
		this.muscles = muscles;
	}

	
	public ArrayList<String> getNextTwoMuscles(){
		ArrayList<String> groups = new ArrayList<String>();
		System.out.println("thing " + lastmusclegroup);
		if (lastmusclegroup >= muscles.size()-mpw) {
			groups.addAll( muscles.subList(lastmusclegroup, muscles.size()));
			groups.addAll(muscles.subList(0, muscles.size()-lastmusclegroup));
		}
		else groups.addAll( muscles.subList(lastmusclegroup, mpw+lastmusclegroup));
		lastmusclegroup=(lastmusclegroup+mpw)%muscles.size();
		return groups;
	}
	
	
	/**
	 * if the user has done no workouts before, then this method with assign a base
	 * of sets and reps to work with for each exercise they plan to do
	 */
	public void baseWorkout() {
		// starts with hypertrophy
		for (Exercise e : getExercises()) {
			if (e.getClass() == Bodyweight.class) {
				e.setReps(4);
				e.setSets(3);
				System.out.println("Sets: " + e.getSets() + " Reps: " + e.getReps() + " of " + e.getName());

			}
			if (e.getClass() == Dumbbell.class) {
				((Dumbbell) e).setWeight(10);
				e.setReps(8);
				e.setSets(3);
				System.out.println("Sets: " + e.getSets() + " Reps: " + e.getReps() + " of " + e.getName()
				+ " with " + ((Dumbbell) e).getWeight() + " lb dumbbells");

			}
			if (e.getClass() == Barbell.class) {
				((Barbell) e).setWeight(45);
				e.setReps(8);
				e.setSets(3);
				System.out.println("Sets: " + e.getSets() + " Reps: " + e.getReps() + " of " + e.getName()
				+ " at " + ((Barbell) e).getWeight() + " lbs");

			}
		}
	}

	public void workoutUpdate() {

	//	if (workoutcounter == workoutsperweek * 8)
	//		switchRotation();

	//	workoutcounter++;
		System.out.println("\nWorkout!!\n");

		// hypertrophy:
		//if (rotation) {
		ArrayList<String> musclesToday = getNextTwoMuscles();
			for (Exercise e : getExercises()) {
				
					if (musclesToday.contains(e.getMuscleGroup())) {
					if (e.getClass() == Bodyweight.class) {

						if (e.getReps() < e.getMaxlastreps())
							e.setReps((int) (e.getMaxlastreps() * 0.5));
						if (e.getReps()*3/4 > e.getMaxlastreps())
							e.setReps((int) (e.getReps() - 1));
						System.out.println("Sets: " + e.getSets() + " Reps: " + e.getReps() + " of " + e.getName());
					}
					
					if (e.getClass() == Dumbbell.class) {
						if (e.getSets() == 5 && e.getReps() == 10) {
							if (e.getMaxlastreps() > 15 && e.getMaxlastreps() < 20)
								((Dumbbell) e).updateWeightsoft();
							else if (e.getMaxlastreps() >= 20)
								((Dumbbell) e).updateWeighthard();

						} // end if for weight scaling
					
						else if (e.getReps()<e.getMaxlastreps()&& e.getReps() != 10)
							e.setReps(10);
						else if (e.getSets() < 5 && e.getMaxlastreps()>e.getReps()+2)
							e.setSets(e.getSets() + 1);
						else if (e.getMaxlastreps()==0) 
							((Dumbbell) e).setWeight((int) ((Dumbbell) e).getWeight()-5);
						System.out.println("Sets: " + e.getSets() + " Reps: " + e.getReps() + " of " + e.getName()
						+ " with " + ((Dumbbell) e).getWeight() + " lb dumbbells");
					
					}//end db
					if (e.getClass() == Barbell.class) {
						if (e.getSets() == 5 && e.getReps() == 10) {
							if (e.getMaxlastreps() > 15 && e.getMaxlastreps() < 20)
								((Barbell) e).updateWeightsoft();
							else if (e.getMaxlastreps() >= 20)
								((Barbell) e).updateWeighthard();
						} else if (e.getReps()<e.getMaxlastreps()&& e.getReps() != 10)
							e.setReps(10);
						else if (e.getSets() < 5 && e.getMaxlastreps()>e.getReps()+2)
							e.setSets(e.getSets() + 1);
						else if (e.getMaxlastreps()==0) 
							((Barbell) e).setWeight((int) ((Barbell) e).getWeight()-10);
						System.out.println("Sets: " + e.getSets() + " Reps: " + e.getReps() + " of " + e.getName()
								+ " at " + ((Barbell) e).getWeight() + " lbs");

					}
				}

			} // end for

		//} // end hypertrophy if

		// strength:
		/** else {
			for (Exercise e : getExercises()) {
				// figure out how to not hard code 0 and 2 and rather get it to cycle through
				// the muscle groups
				if (getMuscles().subList(0, 2).contains(e.getMuscleGroup())) {
					if (e.getClass() == Bodyweight.class) {

						if (e.getReps() < e.getMaxlastreps())
							e.setReps((int) (e.getMaxlastreps() * 0.5));
						if (e.getReps() > e.getMaxlastreps())
							e.setReps((int) (e.getReps() - 1));

						System.out.println("Sets: " + e.getSets() + " Reps: " + e.getReps() + " of " + e.getName());

					}
					if (e.getClass() == Dumbbell.class) {
						if (e.getSets() == 5 && e.getReps() == 5) {
							if (e.getSets() == 5 && e.getReps() == 10) {
								if (e.getMaxlastreps() > 15 && e.getMaxlastreps() < 20)
									((Dumbbell) e).updateWeightsoft();
								else if (e.getMaxlastreps() >= 20)
									((Dumbbell) e).updateWeighthard();
							}

							else if (e.getReps() != 5)
								e.setReps(5);
							else if (e.getSets() < 5)
								e.setSets(e.getSets() + 1);
							System.out.println("Sets: " + e.getSets() + " Reps: " + e.getReps() + " of " + e.getName()
									+ " with " + ((Dumbbell) e).getWeight() + " lb dumbbells");

						}
					}
					if (e.getClass() == Barbell.class) {
						if (e.getSets() == 5 && e.getReps() == 5)

							((Barbell) e).updateWeighthard();
						else if (e.getReps() != 5)
							e.setReps(5);
						else if (e.getSets() < 5)
							e.setSets(e.getSets() + 1);
						System.out.println("Sets: " + e.getSets() + " Reps: " + e.getReps() + " of " + e.getName()
								+ " at " + ((Barbell) e).getWeight() + " lbs");

					}
				}

			}
		} // end else
		*/
	}

	

	/**
	 * didn't know where to put this so it's going here??? basically just sets up
	 * what muscle groups and exercises the user plans on doing
	 */
	public void buildUser() {
		// all possible exercises we would offer them
		Dumbbell flyes = new Dumbbell("Flyes", "Chest");
		Barbell benchPress = new Barbell("Bench Press", "Chest");
		Dumbbell pullover = new Dumbbell("Pullover", "Chest");
		Barbell deadlift = new Barbell("Deadlift", "Back");
		Dumbbell dbrows = new Dumbbell("Rows", "Back");
		Bodyweight pullups = new Bodyweight("Pullups", "Back");
		Barbell skullcrushers = new Barbell("Skull Crushers", "Triceps");
		Bodyweight dips = new Bodyweight("Dips", "Triceps");
		Dumbbell tricepextensions = new Dumbbell("Overhead Tricep Extensions", "Triceps");
		Dumbbell bicepcurls = new Dumbbell("Bicep Curls", "Biceps");
		Dumbbell inclinecurls = new Dumbbell("Incline Curls", "Biceps");
		Dumbbell preachercurls = new Dumbbell("Preacher Curls", "Biceps");
		Dumbbell lateralraises = new Dumbbell("Lateral Raises", "Shoulders");
		Dumbbell shoulderpress = new Dumbbell("Shoulder Press", "Shoulders");
		Dumbbell inclinebenchpress = new Dumbbell("Incline Bench Press", "Shoulders");
		Barbell backsquat = new Barbell("Back Squat", "Legs");
		Bodyweight boxjumps = new Bodyweight("Box Jumps", "Legs");
		Bodyweight splitsquats = new Bodyweight("Split Squats", "Legs");

		// put them all in an arraylist
		ArrayList<Exercise> PossibleExercises = new ArrayList<Exercise>();
		PossibleExercises.add(flyes);
		PossibleExercises.add(benchPress);
		PossibleExercises.add(pullover);
		PossibleExercises.add(deadlift);
		PossibleExercises.add(dbrows);
		PossibleExercises.add(pullups);
		PossibleExercises.add(skullcrushers);
		PossibleExercises.add(dips);
		PossibleExercises.add(tricepextensions);
		PossibleExercises.add(bicepcurls);
		PossibleExercises.add(inclinecurls);
		PossibleExercises.add(preachercurls);
		PossibleExercises.add(lateralraises);
		PossibleExercises.add(shoulderpress);
		PossibleExercises.add(inclinebenchpress);
		PossibleExercises.add(backsquat);
		PossibleExercises.add(boxjumps);
		PossibleExercises.add(splitsquats);

		// all possible muscles they could target
		ArrayList<String> PossibleMuscles = new ArrayList<String>();
		PossibleMuscles.add("Back");
		PossibleMuscles.add("Chest");
		PossibleMuscles.add("Legs");
		PossibleMuscles.add("Shoulders");
		PossibleMuscles.add("Biceps");
		PossibleMuscles.add("Triceps");

		Scanner sc = new Scanner(System.in);

		ArrayList<String> UserMuscles = new ArrayList<String>();

		// determining what they want to work out (this would be the multi-selection on
		// the app)
		for (String group : PossibleMuscles) {
			System.out.println("Would you like to target " + group + "? Enter 1 if so, 0 if not.");
			if (sc.nextInt() == 1)
				UserMuscles.add(group);
		}
		sc.close();
		// assigning that to a user
		this.setMuscles(UserMuscles);
		ArrayList<Exercise> UserExercises = new ArrayList<Exercise>();

		// determining which exercises they would do to target the muscle groups they
		// want
		for (int i = 0; i < UserMuscles.size(); i++) {
			for (Exercise ex : PossibleExercises) {
				if (ex.getMuscleGroup().equalsIgnoreCase(this.getMuscles().get(i))) {
					UserExercises.add(ex);
				}
			}
		}

		// assign exercises to user
		this.setExercises(UserExercises);

		// debug check (delete)
		System.out.println(this.getExercises().toString() + " \n" + this.getMuscles().toString());
	}
}
