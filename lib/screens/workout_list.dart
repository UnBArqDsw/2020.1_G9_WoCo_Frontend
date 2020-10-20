import 'package:WoCo/models/workout.dart';
import 'package:flutter/material.dart';
import 'package:WoCo/widgets/workout_tile.dart';
import 'package:WoCo/provider/workout_provider.dart';
import 'package:provider/provider.dart';

class WorkoutList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final WorkoutProvider workouts = Provider.of(context);

    return Scaffold(
        appBar: AppBar(title: Text('Lista de Treinos'), actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add_circle),
            onPressed: () {},
          ),
        ]),
        body: ListView.builder(
          itemCount: workouts.count,
          itemBuilder: (ctx, i) => WorkoutTile(workouts.byIndex(i)),
        ));
  }
}
