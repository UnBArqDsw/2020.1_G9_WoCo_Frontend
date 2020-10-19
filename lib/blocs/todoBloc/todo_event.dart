import 'package:equatable/equatable.dart';

abstract class TodoEvent extends Equatable {}

class FetchTodos extends TodoEvent {
  @override
  List<Object> get props => null;
}
