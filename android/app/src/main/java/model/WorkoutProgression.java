package model;

import java.util.ArrayList;
import java.util.Scanner;

public class WorkoutProgression {

	public static void main(String[] args) {
		User me = new User(2);
		me.buildUser();
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
