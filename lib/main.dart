import 'package:WoCo/provider/workout_provider.dart';
import 'package:WoCo/routes/app_routes.dart';
import 'package:flutter/material.dart';

// Bloc
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:WoCo/blocs/todoBloc/todo_bloc.dart';
import 'package:WoCo/blocs/authenticationBloc/authentication_bloc.dart';
import 'package:WoCo/blocs/workoutBloc/workout_bloc.dart';

// Screens
import 'package:WoCo/screens/todo.dart';
import 'package:WoCo/screens/signup_screen.dart';
import 'package:WoCo/screens/auth_screen.dart';
import 'package:WoCo/screens/login_screen.dart';
import 'package:WoCo/screens/profile_screen.dart';
import 'package:WoCo/screens/exercise_screen.dart';
import 'package:WoCo/screens/workout_form.dart';
import 'package:WoCo/screens/workout_list.dart';

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
        initialRoute: AppRoutes.AUTH,
        routes: {
          AppRoutes.HOME: (context) => MultiBlocProvider(
                providers: [
                  BlocProvider<TodoBloc>(
                    create: (context) => TodoBloc(),
                  )
                ],
                child: Todo(),
              ),
          AppRoutes.SIGN_UP: (context) => MultiBlocProvider(
                providers: [
                  BlocProvider<AuthenticationBloc>(
                    create: (context) => AuthenticationBloc(),
                  )
                ],
                child: SignUpScreen(),
              ),
          AppRoutes.LOG_IN: (context) => MultiBlocProvider(
                providers: [
                  BlocProvider<AuthenticationBloc>(
                    create: (context) => AuthenticationBloc(),
                  )
                ],
                child: LogInScreen(),
              ),
          AppRoutes.AUTH: (_) => AuthScreen(),
          AppRoutes.WORKOUT_LIST: (_) => WorkoutList(),
          AppRoutes.WORKOUT_FORM: (_) => WorkoutForm(),
          AppRoutes.PROFILE: (_) => ProfileScreen(),
          AppRoutes.EXERCISE: (_) => WorkoutScreen()
        },
      ),
    );
  }
}
// home: BlocProvider(
// create: (BuildContext context) => AlbumBloc(AlbumRepositoryImpl()),
// child: MyHomePage(title: 'Flutter Demo Home Page'),
// )
