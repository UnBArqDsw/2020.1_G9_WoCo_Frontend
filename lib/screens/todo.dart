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
      body: SingleChildScrollView(
        child: Container(
            color: Colors.lightBlue,
            height: height,
            child: BlocBuilder<TodoBloc, TodoState>(
              builder: (context, state) {
                if (state is TodoListLoading) {
                  return Loading();
                } else if (state is TodoListLoaded) {
                  print(state.todos);
                  return buildList();
                } else if (state is TodoListFailure) {
                  print(state.message);
                  return ErrorMessage(message: state.message);
                }
                return Text('None');
              },
            )),
      ),
    );
  }

  Widget buildList() {
    return Text('Lista');
  }
}
