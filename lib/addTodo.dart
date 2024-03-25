import "package:flutter/material.dart";

class AddTodo extends StatefulWidget {
  const AddTodo({super.key});

  @override
  State<AddTodo> createState() => _AddTodoState();
}

class _AddTodoState extends State<AddTodo> {
  final todoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Add Todo",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextFormField(
              controller: todoController,
              decoration: const InputDecoration(
                labelText: "Todo",
              ),
            ),
           const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, todoController.text);
              },
              child: const Text("Add Todo"),
            ),
          ],
        ),
      ),
    );
  }
}
