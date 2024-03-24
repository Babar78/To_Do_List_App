import "package:flutter/material.dart";

class TodoList extends StatefulWidget {
  const TodoList({super.key});

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  List todos = <Task>[];

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)!.settings.arguments as Map;
    final username = arguments["username"];
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final task = Navigator.pushNamed(context, '/addTodo');
          task.then((value) {
            if (value == null) {
              return;
            }
            setState(() {
              todos.add(Task(name: value.toString(), isCompleted: false));
            });
          });
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Text(
          "Welcome $username",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView.builder(
          itemCount: todos.length,
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                color: Colors.black12,
                border: Border.all(color: Colors.black),
                borderRadius: const BorderRadius.all(
                  Radius.circular(8),
                ),
              ),
              margin: const EdgeInsets.only(top: 8.0),
              child: ListTile(
                leading: Checkbox(
                  onChanged: (value) {
                    setState(() {
                      todos[index].isCompleted = value!;
                    });
                  },
                  value: todos[index].isCompleted,
                ),
                trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text("Delete Todo"),
                              content: Text(
                                  "Are you sure you want to delete this todo?"),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text("Cancel"),
                                ),
                                // show bottom sheet after deleting
                                TextButton(
                                  onPressed: () {
                                    setState(() {
                                      todos.removeAt(index);
                                    });
                                    Navigator.pop(context);
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content: Text("Todo deleted"),
                                          duration: Duration(seconds: 5)),
                                    );
                                  },
                                  child: Text("Delete"),
                                ),
                              ],
                            );
                          });
                    }),
                title: Text(
                  todos[index].name,
                  style: todos[index].isCompleted
                      ? const TextStyle(decoration: TextDecoration.lineThrough)
                      : null,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class Task {
  String name;
  bool isCompleted;

  Task({required this.name, required this.isCompleted});
}
