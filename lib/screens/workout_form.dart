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
  var dropdownValue = 'Dorsais';
  DateTime _dateTime1, _dateTime2;

  final Map<String, String> _formData = {};

  void _loadFormData(Workout workout) {
    if (workout != null) {
      _formData['id'] = workout.id;
      _formData['name'] = workout.title;
      _formData['description'] = workout.description;
    }
  }

  @override
  Widget build(BuildContext context) {
    final Workout workout = ModalRoute.of(context).settings.arguments;
    _loadFormData(workout);
    return Scaffold(
      appBar: AppBar(
        title: Text('Seu Exercício'),
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
                    title: _formData['name'],
                    description: _formData['description'],
                  ),
                );
                Navigator.of(context).pop();
              }
            },
          ),
        ],
      ),
      resizeToAvoidBottomPadding: false,
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Form(
          key: _form,
          child: Column(
            children: <Widget>[
              TextFormField(
                initialValue: _formData['name'],
                decoration: InputDecoration(labelText: 'Nome'),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Digite um nome';
                  }
                  return null;
                },
                onSaved: (value) => _formData['name'] = value,
              ),
              TextFormField(
                initialValue: _formData['description'],
                decoration: InputDecoration(labelText: 'Descrição'),
                onSaved: (value) => _formData['description'] = value,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Grupamento Muscular',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300),
              ),
              DropdownButton<String>(
                  items: ['Peitoral', 'Dorsais', 'Tríceps', "Bíceps", "Pernas"]
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
              SizedBox(
                height: 20,
              ),
              Text(
                'Período',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300),
              ),
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
