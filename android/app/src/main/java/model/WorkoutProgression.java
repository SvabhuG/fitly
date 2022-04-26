package model;

import java.util.ArrayList;
import java.util.Scanner;

public class WorkoutProgression {

	public static void main(String[] args) {
		User me = new User(2);
		me.buildUser();
		me.baseWorkout();
		me.getRotation();
		me.workoutUpdate();
		me.workoutUpdate();
		me.workoutUpdate();
		me.workoutUpdate();
		me.workoutUpdate();

		//ccurrently is getting into strength not hypertrophy??
		
	}

}
