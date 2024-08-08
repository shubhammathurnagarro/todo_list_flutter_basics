import 'package:flutter/material.dart';

import '../repository/todo_repository.dart';
import 'error_message_widget.dart';
import 'loader_widget.dart';
import 'todo_list.dart';

class TodoListContainer extends StatefulWidget {
  const TodoListContainer({super.key});

  @override
  State createState() => _TodoListContainerState();
}

class _TodoListContainerState extends State<TodoListContainer> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: TodoRepository.getTodoList(),
      builder: (ctx, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const LoaderWidget();
        } else if (snapshot.hasData) {
          return TodoList(itemList: snapshot.data!);
        } else {
          return ErrorMessageWidget(onRetry: () {
            setState(() {});
          });
        }
      },
    );
  }
}
