import 'Exercise.dart';

class Dumbbell extends Exercise
{
  int weight = 0;

  Dumbbell(String name, String musclegroup) : super(name, musclegroup)
  {

  }

  int getWeight()
  {
    return weight;
  }

  void updateWeightsoft()
  {
    weight += 5;
  }

  void updateWeighthard()
  {
    weight += 10;
  }

  void setWeight(int weight)
  {
    this.weight = weight;
  }
}