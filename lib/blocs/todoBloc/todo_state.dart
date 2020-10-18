import 'package:WoCo/models/todo.dart';
import 'package:equatable/equatable.dart';

abstract class TodoState extends Equatable {}

class TodoListInitial extends TodoState {
  @override
  List<Object> get props => null;
}

class TodoListLoading extends TodoState {
  @override
  List<Object> get props => null;
}

class TodoListLoaded extends TodoState {
  final List<Todo> todos;

  TodoListLoaded({this.todos});

  @override
  List<Object> get props => null;
}

class TodoListFailure extends TodoState {
  final String message;

  TodoListFailure({this.message});

  @override
  List<Object> get props => null;
}
