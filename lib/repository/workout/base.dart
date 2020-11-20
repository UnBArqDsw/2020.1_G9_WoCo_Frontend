import 'package:WoCo/models/workout.dart';

abstract class Base {
  Future<Workout> getWorkout(String id);
  Future<List<Workout>> getAllWorkouts();
  Future<Workout> createWorkout(workout);
  Future<Workout> deleteWorkout(String id);
  Future<Workout> updateWorkout(workout);
}
