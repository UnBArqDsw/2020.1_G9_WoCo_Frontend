import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      title: 'WoCo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.amber,
          ),
          body: Text('Woco'))));
}
