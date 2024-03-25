import 'package:flutter/material.dart';
import 'package:todo_app/addTodo.dart';
import 'package:todo_app/login.dart';
import 'package:todo_app/todolist.dart';

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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const Login(),
      initialRoute: '/',
      routes: {
        '/todoList': (context) => const TodoList(),
        '/addTodo': (context) => const AddTodo(),
      },
    );
  }
}
