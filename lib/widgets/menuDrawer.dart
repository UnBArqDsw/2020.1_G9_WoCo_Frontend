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
              color: Colors.blue,
            ),
            child: Text('Menu'),
          ),
          ListTile(leading: Icon(Icons.account_circle), title: Text('Perfil')),
          ListTile(leading: Icon(Icons.settings), title: Text('Configurações')),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Sair'),
            onTap: () {
              print('Exiting');
            },
          ),
        ],
      ),
    );
  }
}
