import 'package:flutter/material.dart';

// Bloc
import 'package:WoCo/blocs/todoBloc/todo_bloc.dart';

// Screens
import 'package:WoCo/screens/todo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MaterialApp(
    title: 'WoCo',
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primaryColor: Color(0XFF1D3075),
    ),
    initialRoute: '/todo',
    routes: {
      '/todo': (context) => MultiBlocProvider(
            providers: [
              BlocProvider<TodoBloc>(
                create: (context) => TodoBloc(),
              )
            ],
            child: Todo(),
          )
    },
  ));
}
