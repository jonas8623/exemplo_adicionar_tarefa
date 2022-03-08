import 'package:exemplo_tarefas/pages/pages.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter List',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: const HomePage(title: 'Tarefas'),
    );
  }
}


