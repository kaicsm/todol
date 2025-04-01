import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:todol/app/data/models/todo.dart';

class HomeController extends GetxController {
  var todos = List<Todo>.empty().obs;
  final storage = GetStorage();

  HomeController() {
    var storedTodos = loadTodos();
    if (storedTodos.isNotEmpty) {
      todos.assignAll(storedTodos);
    }
  }

  void addTodo(Todo todo) {
    todos.add(todo);
  }

  void removeTodo(Todo todo) {
    todos.remove(todo);
  }

  void clearTodos() {
    todos.clear();
  }

  void saveTodos() {
    List<Map<String, dynamic>> todosJson = todos.map((todo) => todo.toJson()).toList();
    storage.write('todos', todosJson);
  }

  List<Todo> loadTodos() {
    List<dynamic>? storedTodos = storage.read('todos');
    if (storedTodos == null) return [];

    return storedTodos.map((todo) => Todo.fromJson(todo)).toList();
  }
}
