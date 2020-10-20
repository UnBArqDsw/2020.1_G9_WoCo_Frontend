import 'package:WoCo/routes/app_routes.dart';
import 'package:WoCo/screens/workout_list.dart';
import 'package:flutter/material.dart';

class MenuDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Color(0XFF1D3075),
            ),
            child: profile(),
          ),
          ListTile(
            leading: Icon(Icons.play_circle_fill),
            title: Text('Treinos'),
            onTap: () {
              Navigator.of(context).pushNamed(AppRoutes.WORKOUT_LIST);
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Configurações'),
            onTap: () {
              print('Move to Configurações');
            },
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Sair'),
            onTap: () {
              print('Move to Exiting');
            },
          ),
        ],
      ),
    );
  }

  Widget profile() {
    return Row(
      children: <Widget>[
        CircleAvatar(
          backgroundImage: NetworkImage(
            'https://avatars1.githubusercontent.com/u/48650663?s=460&u=c6cb8b2012062fa39969aaae8baefae6bbbdd2b0&v=4',
          ),
          backgroundColor: Colors.transparent,
          radius: 40.0,
        ),
        SizedBox(
          width: 10,
        ),
        Flexible(
          child: Text(
            'Bem vindo, \nBruno Henrique',
            style: TextStyle(color: Colors.white, fontSize: 15),
          ),
        )
      ],
    );
  }
}
