import 'Exercise.dart';

class Barbell extends Exercise
{
  int weight = 0;

  Barbell(String name, String musclegroup) : super(name, musclegroup)
  {

  }

  int getWeight()
  {
    return weight;
  }

  void updateWeighthard()
  {
    weight += 10;
  }

  void updateWeightsoft()
  {
    weight += 10;
  }

  void setWeight(int weight)
  {
    this.weight = weight;
  }
}