import 'User.dart';

class WorkoutProgression
{

  static void main(List<String> args)
  {
    User me = User(2);
    me.buildUser();
    me.baseWorkout();
    me.getExercises()[0].setMaxlastreps(12);
    me.getExercises()[1].setMaxlastreps(8);
    me.getExercises()[2].setMaxlastreps(3);
    me.getExercises()[3].setMaxlastreps(1);
    me.getExercises()[4].setMaxlastreps(20);
    me.getExercises()[5].setMaxlastreps(13);
    me.workoutUpdate();
    me.getExercises()[0].setMaxlastreps(20);
    me.getExercises()[1].setMaxlastreps(3);
    me.getExercises()[2].setMaxlastreps(15);
    me.getExercises()[3].setMaxlastreps(5);
    me.getExercises()[4].setMaxlastreps(0);
    me.getExercises()[5].setMaxlastreps(9);
    me.workoutUpdate();
  }
}