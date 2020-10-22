import 'package:WoCo/provider/workout_provider.dart';
import 'package:WoCo/routes/app_routes.dart';
import 'package:WoCo/screens/workout_form.dart';
import 'package:WoCo/screens/workout_list.dart';
import 'package:flutter/material.dart';

// Bloc
import 'package:WoCo/blocs/todoBloc/todo_bloc.dart';

// Screens
import 'package:WoCo/screens/todo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => WorkoutProvider(),
      child: MaterialApp(
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
              ),
          AppRoutes.WORKOUT_LIST: (_) => WorkoutList(),
          AppRoutes.WORKOUT_FORM: (_) => WorkoutForm()
        },
      ),
    );
  }
}
