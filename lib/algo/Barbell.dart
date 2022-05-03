import 'Exercise.dart';

class Barbell extends Exercise
{
  double weight = 0;

  Barbell(String name, String musclegroup) : super(name, musclegroup)
  {

  }

  double getWeight()
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

  void setWeight(double weight)
  {
    this.weight = weight;
  }
}