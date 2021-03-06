import 'package:shared_preferences/shared_preferences.dart';

import 'Barbell.dart';
import 'Bodyweight.dart';
import 'Dumbbell.dart';
import 'Exercise.dart';

class User
{
  var muscles = <String>[];
  var exercises = <Exercise>[];
  bool rotation = false;
  int mpw = 0;
  int lastmusclegroup = 0;
  List<String> musclesToday = <String>[];

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
    print("thing: " + lastmusclegroup.toString());
    print("Muslces : " + muscles.toString());
    if (lastmusclegroup > (muscles.length - mpw)) {
      groups.addAll(muscles.sublist(lastmusclegroup, muscles.length));
      groups.addAll(muscles.sublist(0, muscles.length - lastmusclegroup));
    } else {
      groups.addAll(muscles.sublist(lastmusclegroup, mpw + lastmusclegroup));
    }
    print("groups: " + groups.length.toString());
    lastmusclegroup = ((lastmusclegroup + mpw) % muscles.length);
    return groups;
  }

  List<Exercise> baseWorkout()
  {
    List<Exercise> exercisesToday = <Exercise>[];
    List<String> baseMuscles = muscles.sublist(0,mpw);
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
      if (baseMuscles.contains(e.getMuscleGroup())) {
        exercisesToday.add(e);
      }
    }
    return exercisesToday;

  }


  List<Exercise> workoutUpdate() {
    List<Exercise> exercisesToday = <Exercise>[];
    musclesToday = getNextMuscles();
    print("Muscles today: " + musclesToday.toString());
    for (Exercise e in getExercises()) {
      if (musclesToday.contains(e.getMuscleGroup())) {
        if (e is Bodyweight) {
          if (e.getMaxlastreps() > e.getReps()) {
            e.setReps(((e.getMaxlastreps() + e.getReps()) * 0.5).toInt());
          }
          if (((e.getReps() * 3) ~/ 4) > e.getMaxlastreps()) {
            e.setReps(e.getReps() - 1);
          } else {
            if (e.getMaxlastreps() <= (e.getReps() * 0.25)) {
              e.setReps((e.getReps() * 0.75).toInt());
            }
          }
        }
        if (e is Dumbbell) {
          if ((e.getSets() == 5) && (e.getReps() >= 10)) {
            if ((e.getMaxlastreps() > 12) && (e.getMaxlastreps() < 20)) {
              e.updateWeightsoft();
              e.setSets(3);
              e.setReps(8);
            }
            else if (e.getMaxlastreps() >= 20) {
              e.updateWeighthard();
            }
          }
          else if ((e.getReps() < e.getMaxlastreps()) && (e.getReps() < 10)) {
            e.setReps(e.getReps() + 1);
          }
          else if ((e.getReps() < e.getMaxlastreps()) && (e.getReps() >= 10)) {
            e.setSets(e.getSets() + 1);
            e.setReps(e.getReps()-4);
          }
          else if(e.getMaxlastreps() == 0) {
            e.setWeight((e.getWeight() - 5));
          }
          else if (e.getMaxlastreps() <= (e.getReps() * 0.25)) {
            e.setReps((e.getReps() * 0.75).toInt());
          }
        }
        if (e is Barbell) {
          if ((e.getSets() == 5) && (e.getReps() >= 8)) {
            if ((e.getMaxlastreps() >= 8) && (e.getMaxlastreps() < 20)) {
              e.updateWeightsoft();

            }
            else if (e.getMaxlastreps() >= 20) {
                e.updateWeighthard();
            }

            e.setSets(3);
            e.setReps(5);
          }
          else if ((e.getReps() < e.getMaxlastreps()) && (e.getReps() < 8)) {
              e.setReps(e.getReps() + 1);
          }
          else if ((e.getReps() >= 8) && (e.getReps() < e.getMaxlastreps())) {
                e.setSets(e.getSets() + 1);
                e.setReps(e.getReps()-2);
          }
          else if(e.getMaxlastreps() == 0) {
            e.setWeight((e.getWeight() - 10));
          }
          else if (e.getMaxlastreps() <= (e.getReps() * 0.25)) {
            e.setReps((e.getReps() * 0.75).toInt());
          }
        }
        exercisesToday.add(e);
      }
    }
    print("exercises today: " + exercisesToday.length.toString());
    return exercisesToday;
  }
  Future<String> getMusclesData() async {
    final prefs = await SharedPreferences.getInstance();
    String val = prefs.getString("Muscles") ?? "";
    return val;
  }

  Future<void> buildUser() async {
    Dumbbell flyes = new Dumbbell("Flyes", "Chest");
    Barbell benchPress = new Barbell("Bench Press", "Chest");
    Dumbbell pullover = new Dumbbell("Pullover", "Chest");
    Barbell deadlift = new Barbell("Deadlift", "Back");
    Dumbbell dbrows = new Dumbbell("Rows", "Back");
    Bodyweight pullups = new Bodyweight("Pullups", "Back");
    Barbell skullcrushers = new Barbell("Skull Crushers", "Triceps");
    Bodyweight dips = new Bodyweight("Dips", "Triceps");
    Dumbbell tricepextensions = new Dumbbell(
        "Overhead Tricep Extensions", "Triceps");
    Dumbbell bicepcurls = new Dumbbell("Bicep Curls", "Biceps");
    Dumbbell inclinecurls = new Dumbbell("Incline Curls", "Biceps");
    Dumbbell preachercurls = new Dumbbell("Preacher Curls", "Biceps");
    Dumbbell lateralraises = new Dumbbell("Lateral Raises", "Shoulders");
    Dumbbell shoulderpress = new Dumbbell("Shoulder Press", "Shoulders");
    Dumbbell inclinebenchpress = new Dumbbell(
        "Incline Bench Press", "Shoulders");
    Barbell backsquat = new Barbell("Back Squat", "Legs");
    Bodyweight boxjumps = new Bodyweight("Box Jumps", "Legs");
    Bodyweight splitsquats = new Bodyweight("Split Squats", "Legs");

    exercises.add(flyes);
    exercises.add(benchPress);
    exercises.add(pullover);
    exercises.add(deadlift);
    exercises.add(dbrows);
    exercises.add(pullups);
    exercises.add(skullcrushers);
    exercises.add(dips);
    exercises.add(tricepextensions);
    exercises.add(bicepcurls);
    exercises.add(inclinecurls);
    exercises.add(preachercurls);
    exercises.add(lateralraises);
    exercises.add(shoulderpress);
    exercises.add(inclinebenchpress);
    exercises.add(backsquat);
    exercises.add(boxjumps);
    exercises.add(splitsquats);

    muscles = (await getMusclesData()).split(" ");
    print("check data retrieve" + muscles.toString());
  }
}