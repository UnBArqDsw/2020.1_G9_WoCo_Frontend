import 'dart:math';

import 'package:WoCo/data/dummy_workouts.dart';
import 'package:WoCo/models/workout.dart';
import 'package:flutter/material.dart';

class WorkoutProvider with ChangeNotifier {
  //Observer Pattern
  final Map<String, Workout> _items = {...DUMMY_WORKOUTS};

  List<Workout> get all {
    return [..._items.values];
  }

  int get count {
    return _items.length;
  }

  Workout byIndex(int i) {
    return _items.values.elementAt(i);
  }

  void put(Workout workout) {
    if (workout == null) {
      return;
    }

    if (workout.id != null &&
        workout.id.trim().isNotEmpty &&
        _items.containsKey(workout.id)) {
      _items.update(workout.id, (_) => workout);
    } else {
      final id = Random().nextDouble().toString();
      _items.putIfAbsent(
        id,
        () => Workout(
          id: id,
          title: workout.title,
          description: workout.description,
        ),
      );
    }
    notifyListeners();
  }

  void remove(Workout workout) {
    if (workout != null && workout.id != null) {
      _items.remove(workout.id);
      notifyListeners();
    }
  }
}
