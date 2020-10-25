import 'package:WoCo/models/todo.dart';
import 'package:WoCo/repository/todo/base.dart';
import 'package:WoCo/services/todoApi.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class TodoRepository implements Base {
  @override
  Future<List<Todo>> fetchTodos() async {
    TodoApi api = new TodoApi();

    var response = await http.get(api.baseUrl);

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      return (data as List).map((item) => Todo.fromJson(item)).toList();
    } else {
      throw Exception();
    }
  }
}
