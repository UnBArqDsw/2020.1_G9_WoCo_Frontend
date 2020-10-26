import 'package:flutter/material.dart';

// Routes
import 'package:WoCo/routes/app_routes.dart';

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  double _height, _width;

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: _height,
          width: _width,
          padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
          child: Column(
            children: <Widget>[
              Image.network(
                  'https://woco-unbarqdsw.netlify.app/base/1.4%20iniciativas%20extras/img/logo_woco_1.png',
                  width: 200),
              SizedBox(
                height: 40,
              ),
              signupBtn(),
              SizedBox(
                height: 20,
              ),
              loginBtn()
            ],
          ),
        ),
      ),
    );
  }

  Widget signupBtn() {
    return RaisedButton.icon(
      onPressed: () {
        Navigator.of(context).pushNamed(AppRoutes.SIGN_UP);
      },
      icon: Icon(Icons.app_registration),
      label:
          Text('Sign Up', style: TextStyle(color: Colors.white, fontSize: 18)),
      color: Colors.lightGreen,
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 35),
    );
  }

  Widget loginBtn() {
    return RaisedButton.icon(
      onPressed: () {
        Navigator.of(context).pushNamed(AppRoutes.LOG_IN);
      },
      icon: Icon(
        Icons.login,
        color: Colors.white,
      ),
      label:
          Text('Log in', style: TextStyle(color: Colors.white, fontSize: 18)),
      color: Color(0XFF1D3075),
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 40),
    );
  }
}
