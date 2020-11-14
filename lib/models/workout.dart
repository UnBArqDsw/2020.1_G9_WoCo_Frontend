import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';

class Workout extends Equatable {
  final String id;
  final String title;
  final String description;

  const Workout({
    this.id,
    @required this.title,
    this.description,
  });

  factory Workout.fromJson(Map<String, dynamic> json) {
    return Workout(
      id: json['id'],
      title: json['title'],
      description: json['description'],
    );
  }

  @override
  List<Object> get props => [
        id,
        title,
        description,
      ];
}
