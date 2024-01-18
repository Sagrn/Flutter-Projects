import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/auth/authscreen.dart';

import 'screen/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.light,primaryColor: Colors.green),
      home:const AuthScreen()
    );
  }
}
