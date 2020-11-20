import 'dart:ui';

import 'package:WoCo/models/workout.dart';
import 'package:WoCo/provider/workout_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class WorkoutForm extends StatefulWidget {
  @override
  _WorkoutFormState createState() => _WorkoutFormState();
}

class _WorkoutFormState extends State<WorkoutForm> {
  final _form = GlobalKey<FormState>();
  var dropdownValue = 'superiores';
  DateTime _dateTime1, _dateTime2;

  final Map<String, String> _formData = {};

  void _loadFormData(Workout workout) {
    if (workout != null) {
      _formData['id'] = workout.id;
      _formData['title'] = workout.title;
      _formData['description'] = workout.description;
    }
  }

  @override
  Widget build(BuildContext context) {
    final Workout workout = ModalRoute.of(context).settings.arguments;
    _loadFormData(workout);
    return Scaffold(
      appBar: AppBar(
        title: Text('Seu Treino'),
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
                initialValue: _formData['title'],
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
                initialValue: _formData['description'],
                decoration: InputDecoration(labelText: 'Descrição'),
                onSaved: (value) => _formData['description'] = value,
              ),
              DropdownButton<String>(
                  items: ['superiores', 'inferiores']
                      .map((String dropDownStringItem) {
                    return DropdownMenuItem<String>(
                      value: dropDownStringItem,
                      child: Text(dropDownStringItem),
                    );
                  }).toList(),
                  onChanged: (String novoItemSelecionado) {
                    setState(() {
                      dropdownValue = novoItemSelecionado;
                    });
                  },
                  value: dropdownValue),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(_dateTime1 == null
                          ? ' '
                          : "${DateFormat("d MMMM").format(_dateTime1)}"),
                      RaisedButton(
                        child: Text(
                          'Início',
                          style: TextStyle(color: Colors.white),
                        ),
                        color: Color(0XFF1D3075),
                        onPressed: () {
                          showDatePicker(
                                  context: context,
                                  initialDate: _dateTime1 == null
                                      ? DateTime.now()
                                      : _dateTime1,
                                  firstDate: DateTime(2001),
                                  lastDate: DateTime(2021))
                              .then((date) {
                            setState(() {
                              _dateTime1 = date;
                            });
                          });
                        },
                      )
                    ],
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(_dateTime2 == null
                          ? ' '
                          : " ${DateFormat("d MMMM").format(_dateTime2)}"),
                      RaisedButton(
                        child: Text(
                          'Final',
                          style: TextStyle(color: Colors.white),
                        ),
                        color: Color(0XFF1D3075),
                        onPressed: () {
                          showDatePicker(
                                  context: context,
                                  initialDate: _dateTime2 == null
                                      ? DateTime.now()
                                      : _dateTime2,
                                  firstDate: DateTime(2001),
                                  lastDate: DateTime(2021))
                              .then((date) {
                            setState(() {
                              _dateTime2 = date;
                            });
                          });
                        },
                      )
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
