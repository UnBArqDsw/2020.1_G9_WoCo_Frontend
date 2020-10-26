import 'package:WoCo/widgets/error.dart';
import 'package:WoCo/widgets/loading.dart';
import 'package:flutter/material.dart';

// Bloc
import 'package:WoCo/blocs/authenticationBloc/authentication_bloc.dart';
import 'package:WoCo/blocs/authenticationBloc/authentication_event.dart';
import 'package:WoCo/blocs/authenticationBloc/authentication_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Routes
import 'package:WoCo/routes/app_routes.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  double _height, _width;
  TextEditingController _email, _password;

  @override
  void initState() {
    super.initState();
    _email = TextEditingController();
    _password = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
        centerTitle: true,
      ),
      resizeToAvoidBottomPadding: false,
      body: SafeArea(
        child: Container(
          height: _height,
          width: _width,
          child: BlocConsumer<AuthenticationBloc, AuthenticationState>(
            builder: (context, state) {
              if (state is SignUpInitial) {
                return _signUpForm();
              } else if (state is SignUpLoading) {
                return Loading();
              } else if (state is SignUpFailure) {
                return ErrorMessage(message: state.message);
              }
              return Loading();
            },
            listener: (context, state) {
              if (state is SignUpLoaded) {
                Navigator.of(context)
                    .pushNamedAndRemoveUntil(AppRoutes.AUTH, (route) => false);
              }
            },
          ),
        ),
      ),
    );
  }

  Widget _signUpForm() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
      child: Form(
        child: Column(
          children: <Widget>[
            SizedBox(height: 20),
            Image.network(
                'https://woco-unbarqdsw.netlify.app/base/1.4%20iniciativas%20extras/img/logo_woco_1.png',
                width: 100),
            SizedBox(height: 10),
            _emailField(),
            SizedBox(height: 5),
            _passwordField(),
            SizedBox(height: 15),
            _signUpBtn()
          ],
        ),
      ),
    );
  }

  Widget _emailField() {
    return TextField(
        decoration: const InputDecoration(
          icon: Icon(Icons.person),
          hintText: 'Digite seu email',
          labelText: 'Email',
        ),
        controller: _email);
  }

  Widget _passwordField() {
    return TextField(
      decoration: const InputDecoration(
        icon: Icon(Icons.keyboard),
        hintText: 'Digite sua senha',
        labelText: 'Senha',
      ),
      controller: _password,
    );
  }

  Widget _signUpBtn() {
    return RaisedButton(
      child: Text(
        'Registrar',
        style: TextStyle(color: Colors.white),
      ),
      onPressed: () {
        if (_email.text.isNotEmpty && _password.text.isNotEmpty) {
          //authenticationBloc.add(SignUp(email: _email, password: _password));
          context
              .bloc<AuthenticationBloc>()
              .add(SignUp(email: "eve.holt@reqres.in", password: "pistol"));
        }
      },
      color: Colors.blue,
    );
  }
}
