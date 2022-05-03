import 'Exercise.dart';

class Bodyweight extends Exercise
{

  Bodyweight(String name, String musclegroup) : super(name, musclegroup)
  {
  }

  void updateReps()
  {
    setReps(getReps() + 2);
  }
}