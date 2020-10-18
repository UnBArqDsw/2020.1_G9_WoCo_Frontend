import 'package:WoCo/models/todo.dart';

abstract class Base {
  Future<List<Todo>> fetchTodos();
}
