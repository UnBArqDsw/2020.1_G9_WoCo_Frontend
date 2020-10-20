import 'package:flutter/material.dart';

class Workout {
  final String id;
  final String title;
  final String description;

  const Workout({
    this.id,
    @required this.title,
    this.description,
  });
}
