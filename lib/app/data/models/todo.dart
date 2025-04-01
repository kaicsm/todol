class Todo {
  int? id;
  String? description;
  bool? completed;

  Todo({this.id, this.description, this.completed});

  Todo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    description = json['description'];
    completed = json['completed'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['description'] = description;
    data['completed'] = completed;
    return data;
  }
}
