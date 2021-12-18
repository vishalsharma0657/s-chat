import 'package:flutter/material.dart';
import 'package:s_chat/Authentication/signin_signup.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 's_chat',
      theme: ThemeData.dark(),
      home: const Scaffold(
        backgroundColor: Color.fromARGB(255, 35, 38, 51),
        body: SignIn(),
      ),
    );
  }
}
