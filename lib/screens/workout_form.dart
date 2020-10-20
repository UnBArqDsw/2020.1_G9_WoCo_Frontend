import 'package:WoCo/models/workout.dart';
import 'package:WoCo/provider/workout_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WorkoutForm extends StatelessWidget {
  final _form = GlobalKey<FormState>();
  final Map<String, String> _formData = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Criação de Treino'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save_alt),
            onPressed: () {
              final isValid = _form.currentState.validate();

              if (isValid) {
                _form.currentState.save();
                Provider.of<WorkoutProvider>(context, listen: false).put(
                  Workout(
                    id: _formData['id'],
                    title: _formData['title'],
                    description: _formData['description'],
                  ),
                );
                Navigator.of(context).pop();
              }
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Form(
          key: _form,
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(labelText: 'Título'),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Digite um título';
                  }
                  return null;
                },
                onSaved: (value) => _formData['title'] = value,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Descrição'),
                onSaved: (value) => _formData['description'] = value,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
