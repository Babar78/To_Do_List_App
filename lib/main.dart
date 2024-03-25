import 'package:flutter/material.dart';
import 'package:todo_app/addTodo.dart';
import 'package:todo_app/login.dart';
import 'package:todo_app/todolist.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TODO APP',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: Login(),
      initialRoute: '/',
      routes: {
        '/todoList': (context) => TodoList(),
        '/addTodo': (context) => AddTodo(),
      },
    );
  }
}
