import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'authform.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Authentication"),elevation: 10,),
      body: const AuthForm(),
    );
  }
}
