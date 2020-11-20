import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';

class Workout extends Equatable {
  final String id;
  final String name;
  final String description;

  const Workout({
    this.id,
    @required this.name,
    this.description,
  });

  factory Workout.fromJson(Map<String, dynamic> json) {
    return Workout(
      id: json['id'],
      name: json['name'],
      description: json['description'],
    );
  }

  @override
  List<Object> get props => [
        id,
        name,
        description,
      ];
}
