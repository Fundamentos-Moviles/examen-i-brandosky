import 'package:flutter/material.dart';
import 'package:examen1_rdlb/login.dart';
import 'package:examen1_rdlb/home.dart';
import 'package:examen1_rdlb/more_info.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/home',
      routes: {
        '/': (context) => const Login(),
        '/home': (context) => const Home(),
        //'/more_info': (context) => const MoreInfo(),
      },
    );
  }
}
