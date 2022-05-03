import 'package:shared_preferences/shared_preferences.dart';

import 'Barbell.dart';
import 'Bodyweight.dart';
import 'Dumbell.dart';
import 'Exercise.dart';

class User
{
  var muscles = <String>[];
  var exercises = <Exercise>[];
  bool rotation = false;
  int mpw = 0;
  int lastmusclegroup = 0;

  User(int muscle)
  {

    rotation = false;
    lastmusclegroup = 0;
    mpw = muscle;
  }

  List<String> getMuscles()
  {
    return muscles;
  }

  List<Exercise> getExercises()
  {
    return exercises;
  }

  void setExercises(List<Exercise> exercises)
  {
    this.exercises = exercises;
  }

  void switchRotation()
  {
    rotation = (!rotation);
  }

  bool getRotation()
  {
    return rotation;
  }

  void setMuscles(List<String> muscles)
  {
    this.muscles = muscles;
  }

  List<String> getNextMuscles()
  {
    var groups = <String>[];
    print("thing " + lastmusclegroup.toString());
    if (lastmusclegroup >= (muscles.length - mpw)) {
      groups.addAll(muscles.sublist(lastmusclegroup, muscles.length));
      groups.addAll(muscles.sublist(0, muscles.length - lastmusclegroup));
    } else {
      groups.addAll(muscles.sublist(lastmusclegroup, mpw + lastmusclegroup));
    }
    lastmusclegroup = ((lastmusclegroup + mpw) % muscles.length);
    return groups;
  }

  void baseWorkout()
  {
    for (Exercise e in getExercises()) {
      if (e is Bodyweight) {
        e.setReps(4);
        e.setSets(3);
      }
      if (e is Dumbbell) {
        e.setWeight(10);
        e.setReps(8);
        e.setSets(3);
      }
      if (e is Barbell) {
        e.setWeight(45);
        e.setReps(8);
        e.setSets(3);
      }
    }
  }

  void workoutUpdate()
  {
    print("\nWorkout!!\n");
    List<String> musclesToday = getNextMuscles();
    for (Exercise e in getExercises()) {
      if (musclesToday.contains(e.getMuscleGroup())) {
        if (e is Bodyweight) {
          if (e.getReps() < e.getMaxlastreps()) {
            e.setReps((e.getMaxlastreps() * 0.5).toInt());
          }
          if (((e.getReps() * 3) ~/ 4) > e.getMaxlastreps()) {
            e.setReps(e.getReps() - 1);
          } else {
            if (e.getMaxlastreps() <= (e.getReps() * 0.25)) {
              e.setReps((e.getReps() * 0.75).toInt());
            }
          }
          print((((("Sets: " + e.getSets().toString()) + " Reps: ") + e.getReps().toString()) + " of ") + e.getName());
        }
        if (e is Dumbbell) {
          if ((e.getSets() == 5) && (e.getReps() == 10)) {
            if ((e.getMaxlastreps() > 15) && (e.getMaxlastreps() < 20)) {
              e.updateWeightsoft();
            } else {
              if (e.getMaxlastreps() >= 20) {
                e.updateWeighthard();
              }
            }
          } else {
            if ((e.getReps() < e.getMaxlastreps()) && (e.getReps() != 10)) {
              e.setReps(10);
            } else {
              if ((e.getSets() < 5) && (e.getMaxlastreps() > (e.getReps() + 2))) {
                e.setSets(e.getSets() + 1);
              } else {
                if (e.getMaxlastreps() == 0) {
                  e.setWeight(e.getWeight() - 5);
                } else {
                  if (e.getMaxlastreps() <= (e.getReps() * 0.25)) {
                    e.setReps((e.getReps() * 0.75).toInt());
                  }
                }
              }
            }
          }
          print(((((((("Sets: " + e.getSets().toString()) + " Reps: ") + e.getReps().toString()) + " of ") + e.getName()) + " with ") + e.getWeight().toString()) + " lb dumbbells");
        }
        if (e is Barbell) {
          if ((e.getSets() == 5) && (e.getReps() == 10)) {
            if ((e.getMaxlastreps() > 15) && (e.getMaxlastreps() < 20)) {
              e.updateWeightsoft();
            } else {
              if (e.getMaxlastreps() >= 20) {
                e.updateWeighthard();
              }
            }
          } else {
            if ((e.getReps() < e.getMaxlastreps()) && (e.getReps() != 10)) {
              e.setReps(10);
            } else {
              if ((e.getSets() < 5) && (e.getMaxlastreps() > (e.getReps() + 2))) {
                e.setSets(e.getSets() + 1);
              } else {
                if (e.getMaxlastreps() == 0) {
                  e.setWeight((e.getWeight() - 10));
                } else {
                  if (e.getMaxlastreps() <= (e.getReps() * 0.25)) {
                    e.setReps((e.getReps() * 0.75).toInt());
                  }
                }
              }
            }
          }
          print(((((((("Sets: " + e.getSets().toString()) + " Reps: ") + e.getReps().toString()) + " of ") + e.getName()) + " at ") + e.getWeight().toString()) + " lbs");
        }
      }
    }
  }
  getMusclesData() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString("Muscles");
  }

  void buildUser()
  {
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
    var PossibleExercises = <Exercise>[];
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

    muscles = getMusclesData().split(" ");

    for (Exercise ex in PossibleExercises) {
      if(muscles.contains(ex.getMuscleGroup())) {
        exercises.add(ex);
        }
      }
  }

}