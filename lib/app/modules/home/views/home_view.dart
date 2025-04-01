import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todol/app/data/models/todo.dart';
import 'package:todol/app/modules/home/controllers/home_controller.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  final controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('home'.tr)),
      body: Obx(() {
        if (controller.todos.isEmpty) {
          return Center(
            child: Text('no_todos'.tr, style: TextStyle(fontSize: 20)),
          );
        }
        return ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: controller.todos.length,
          itemBuilder: (context, index) {
            return TodoItem(
              description: controller.todos[index].description!,
              completed: controller.todos[index].completed!,
              onChanged: (value) {
                controller.todos[index].completed = value;
                controller.saveTodos();

                controller.todos.refresh();
              },
              onDelete: () {
                controller.removeTodo(controller.todos[index]);
                controller.saveTodos();

                controller.todos.refresh();
              },
            );
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddTodoDialog(context),
        child: Icon(Icons.add),
      ),
    );
  }

  void _showAddTodoDialog(BuildContext context) {
    TextEditingController descriptionController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: Text('new_todo'.tr),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 8),
              TextField(controller: descriptionController, autofocus: true),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Get.back();
              },
              child: Text('cancel'.tr),
            ),
            TextButton(
              onPressed: () {
                final description = descriptionController.text.trim();

                if (description.isNotEmpty) {
                  controller.addTodo(
                    Todo(description: description, completed: false),
                  );
                  controller.saveTodos();
                }

                Get.back();
              },
              child: Text('add'.tr),
            ),
          ],
        );
      },
    ).then((_) {
      descriptionController.clear();
    });
  }
}

class TodoItem extends StatelessWidget {
  final String description;
  final bool completed;
  final Function(bool?)? onChanged;
  final VoidCallback? onDelete;

  const TodoItem({
    super.key,
    required this.description,
    this.completed = false,
    this.onChanged,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 0),
      child: ListTile(
        title: Text(
          description,
          style: TextStyle(
            decoration: completed ? TextDecoration.lineThrough : null,
          ),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Checkbox(value: completed, onChanged: onChanged),
            IconButton(
              icon: Icon(Icons.delete, color: Colors.red.shade300),
              onPressed: onDelete,
            ),
          ],
        ),
      ),
    );
  }
}
