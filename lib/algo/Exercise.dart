class Exercise
{
  int sets = 0;
  int reps = 0;
  String exerciseName = "";
  String muscleGroup = "";
  int maxlastreps = 0;

  /*Exercise(String name, String muscle, int userReps, int userSets)
  {
    exerciseName = name;
    muscleGroup = muscle;
    sets = userSets;
    reps = userReps;
    maxlastreps = 0;
  }*/

  Exercise(String name, String muscle)
  {
    exerciseName = name;
    muscleGroup = muscle;
    sets = 0;
    reps = 0;
    maxlastreps = 0;
  }

  int getMaxlastreps()
  {
    return maxlastreps;
  }

  void setMaxlastreps(int maxreps)
  {
    maxlastreps = maxreps;
  }

  String getMuscleGroup()
  {
    return muscleGroup;
  }

  String getName()
  {
    return exerciseName;
  }

  String toString()
  {
    return (getName() + " ") + getMuscleGroup();
  }

  int getSets()
  {
    return sets;
  }

  void setSets(int sets)
  {
    this.sets = sets;
  }

  int getReps()
  {
    return reps;
  }

  void setReps(int reps)
  {
    this.reps = reps;
  }
}