import 'package:http/http.dart' as http;
import 'dart:convert';

class Todo {
  int userId;
  int id;
  String title;
  bool completed;

  Todo({this.userId, this.id, this.title, this.completed});

  Todo.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    id = json['id'];
    title = json['title'];
    completed = json['completed'];
  }

  Future<List<Todo>> getTodos() async {
    var response = await http.get('https://jsonplaceholder.typicode.com/todos');

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      return (data as List).map((item) => Todo.fromJson(item)).toList();
    } else {
      throw Exception();
    }
  }
}
