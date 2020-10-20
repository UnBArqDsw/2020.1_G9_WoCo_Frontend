import 'package:WoCo/provider/workout_provider.dart';
import 'package:WoCo/routes/app_routes.dart';
import 'package:WoCo/screens/workout_list.dart';
import 'package:flutter/material.dart';
import 'package:WoCo/models/workout.dart';

class WorkoutTile extends StatelessWidget {
  final Workout workout;

  const WorkoutTile(this.workout);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.fitness_center),
      title: Text(workout.title),
      subtitle: Text(workout.description),
      trailing: Container(
        width: 100,
        child: Row(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {
                Navigator.of(context).pushNamed(
                  AppRoutes.WORKOUT_FORM,
                  arguments: workout,
                );
              },
            ),
            IconButton(
              icon: Icon(Icons.delete),
              color: Colors.red,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
