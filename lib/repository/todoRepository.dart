import 'package:WoCo/models/todo.dart';

class TodoRepository {
  final Todo todo = new Todo();

  Future<List<Todo>> fetchTodos() async {
    return await todo.getTodos();
  }
}
