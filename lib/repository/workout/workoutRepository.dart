import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:WoCo/models/workout.dart';
import 'package:WoCo/repository/workout/base.dart';
import 'package:WoCo/services/workoutApi.dart';

class WorkoutRepository implements Base {
  WorkoutApi api = WorkoutApi();

  @override
  Future<Workout> getWorkout(String id) async {
    try {
      if (id != null) {
        final response = await http.get('${api.baseUrl}/api/workout/$id');
        if (response.statusCode == 200) {
          return Workout.fromJson(json.decode(response.body));
        } else {
          throw Exception('Failed to load workout');
        }
      }
    } catch (error) {
      throw Exception('Failed to load workout ' + error);
    }
    return null;
  }

  Future<List<Workout>> getAllWorkouts() async {
    try {
      final response = await http.get('${api.baseUrl}/api/workouts');
      if (response.statusCode == 200) {
        return (json.decode(response.body) as List)
            .map((i) => Workout.fromJson(i))
            .toList();
      } else {
        throw Exception('Failed to load workout');
      }
    } catch (error) {
      throw Exception('Failed to load workout' + error);
    }
  }

  @override
  Future<Workout> createWorkout(workout) async {
    try {
      if (workout != null) {
        final response = await http.post(
          '${api.baseUrl}/api/workouts',
          headers: {
            'Content-Type': 'application/json',
          },
          body: jsonEncode(<String, String>{
            'name': workout.name,
          }),
        );

        if (response.statusCode == 201) {
          return Workout.fromJson(json.decode(response.body));
        } else {
          throw Exception('Failed to create workout');
        }
      }
    } catch (error) {
      throw Exception('Failed to create workout ' + error);
    }
    return null;
  }

  @override
  Future<Workout> deleteWorkout(String id) async {
    try {
      if (id != null) {
        final response = await http.delete(
          '${api.baseUrl}/api/workout/$id',
          headers: {
            'Content-Type': 'application/json',
          },
        );
        if (response.statusCode == 200) {
          return Workout.fromJson(json.decode(response.body));
        } else {
          throw Exception('Failed to load workout');
        }
      }
    } catch (error) {
      throw Exception('Failed delete workout ' + error);
    }
    return null;
  }

  @override
  Future<Workout> updateWorkout(workout) async {
    try {
      if (workout != null) {
        final response = await http.put(
          '${api.baseUrl}/api/workout/${workout.id}',
          headers: {
            'Content-Type': 'application/json',
          },
          body: jsonEncode(<String, String>{
            'name': workout.name,
          }),
        );
        if (response.statusCode == 200) {
          return Workout.fromJson(json.decode(response.body));
        } else {
          throw Exception('Failed to load workout');
        }
      }
    } catch (error) {
      throw Exception('Failed update workout ' + error);
    }
    return null;
  }
}
