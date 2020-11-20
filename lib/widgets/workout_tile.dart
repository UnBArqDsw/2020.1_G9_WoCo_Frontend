import 'package:WoCo/provider/workout_provider.dart';
import 'package:WoCo/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:WoCo/models/workout.dart';
import 'package:provider/provider.dart';

class WorkoutTile extends StatelessWidget {
  final Workout workout;

  const WorkoutTile(this.workout);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Column(
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.fitness_center),
              title: Text(workout.name),
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
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (ctx) => AlertDialog(
                            title: Text('Excluir Exercício'),
                            content: Text(
                                'Tem certeza que deseja excluir seu exercício?'),
                            actions: <Widget>[
                              FlatButton(
                                child: Text('Não'),
                                onPressed: () =>
                                    Navigator.of(context).pop(false),
                              ),
                              FlatButton(
                                child: Text('Sim'),
                                onPressed: () =>
                                    Navigator.of(context).pop(true),
                              ),
                            ],
                          ),
                        ).then(
                          (confirmed) {
                            if (confirmed) {
                              Provider.of<WorkoutProvider>(context,
                                      listen: false)
                                  .remove(workout);
                            }
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
