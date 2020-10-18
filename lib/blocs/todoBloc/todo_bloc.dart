import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:WoCo/blocs/todoBloc/todo_event.dart';
import 'package:WoCo/blocs/todoBloc/todo_state.dart';
import 'package:WoCo/models/todo.dart';
import 'package:WoCo/repository/todoRepository.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc() : super(TodoListInitial());

  final TodoRepository todoRepository = new TodoRepository();

  @override
  Stream<TodoState> mapEventToState(
    TodoEvent event,
  ) async* {
    if (event is FetchTodos) {
      print('Here?');
      yield* mapFetchTodosToEvent(event);
    }
  }

  Stream<TodoState> mapFetchTodosToEvent(FetchTodos event) async* {
    try {
      TodoListLoading();
      List<Todo> list = await todoRepository.fetchTodos();

      yield TodoListLoaded(todos: list);
    } catch (e) {
      yield TodoListFailure(message: e.toString());
    }
  }
}
