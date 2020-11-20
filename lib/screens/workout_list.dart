import 'package:WoCo/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:WoCo/widgets/workout_tile.dart';
import 'package:WoCo/provider/workout_provider.dart';
import 'package:provider/provider.dart';

class WorkoutList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final WorkoutProvider workouts = Provider.of(context);

    return Scaffold(
      appBar: AppBar(title: Text('Lista de Exercícios')),
      body: ListView.builder(
        itemCount: workouts.count,
        itemBuilder: (ctx, i) => WorkoutTile(workouts.byIndex(i)),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(AppRoutes.WORKOUT_FORM);
        },
        child: Icon(Icons.add),
        backgroundColor: Color(0XFF1D3075),
      ),
    );
  }
}
