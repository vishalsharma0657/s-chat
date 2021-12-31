import 'package:flutter/material.dart';
import 'package:s_chat/Authentication/signin_signup.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:authentication_provider/authentication_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
