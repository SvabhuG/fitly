package model;

import java.util.ArrayList;
import java.util.Scanner;
import model.Exercise;
import model.User;

public class WorkoutProgression {

	public static void main(String[] args) {
		User me = new User(2);
		me.buildUser();
		//set the max last reps to 8 for db/bb and 4 for bodyweight after build user so it doesn't scale prematurely
		me.baseWorkout();
		me.getExercises().get(0).setMaxlastreps(12);
		me.getExercises().get(1).setMaxlastreps(8);
		me.getExercises().get(2).setMaxlastreps(3);
		me.getExercises().get(3).setMaxlastreps(1);
		me.getExercises().get(4).setMaxlastreps(20);
		me.getExercises().get(5).setMaxlastreps(13);
		me.workoutUpdate();
		me.getExercises().get(0).setMaxlastreps(20);
		me.getExercises().get(1).setMaxlastreps(3);
		me.getExercises().get(2).setMaxlastreps(15);
		me.getExercises().get(3).setMaxlastreps(5);
		me.getExercises().get(4).setMaxlastreps(0);
		me.getExercises().get(5).setMaxlastreps(9);
		me.workoutUpdate();
//		me.workoutUpdate();
	//	me.workoutUpdate();
		//me.workoutUpdate();

		
	}

}
