import 'package:flutter/material.dart';

// Bloc
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:WoCo/blocs/todoBloc/todo_bloc.dart';
import 'package:WoCo/blocs/todoBloc/todo_event.dart';
import 'package:WoCo/blocs/todoBloc/todo_state.dart';

// Widgets
import 'package:WoCo/widgets/menuDrawer.dart';
import 'package:WoCo/widgets/loading.dart';
import 'package:WoCo/widgets/error.dart';

import 'package:WoCo/models/todo.dart';

class Todo extends StatefulWidget {
  @override
  _TodoState createState() => _TodoState();
}

class _TodoState extends State<Todo> {
  double height, width;

  TodoBloc todoBloc;

  @override
  void initState() {
    super.initState();
    todoBloc = BlocProvider.of<TodoBloc>(context);
    todoBloc.add(FetchTodos());
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return Scaffold(
      drawer: MenuDrawer(),
      appBar: AppBar(
        backgroundColor: Color(0XFF1D3075),
        title: Text('WoCo'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
            color: Color(0XFF492f98),
            height: height,
            width: width,
            child: BlocBuilder<TodoBloc, TodoState>(
              builder: (context, state) {
                if (state is TodoListLoading) {
                  return Loading();
                } else if (state is TodoListLoaded) {
                  return buildList(state.todos);
                } else if (state is TodoListFailure) {
                  return ErrorMessage(message: state.message);
                }
                return Loading();
              },
            )),
      ),
    );
  }

  Widget buildList(dynamic todos) {
    return ListView.builder(
      itemCount: todos.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(
            todos[index].title,
            style: TextStyle(color: Colors.white, fontSize: 15),
          ),
        );
      },
    );
  }
}
