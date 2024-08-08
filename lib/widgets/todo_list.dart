import 'package:flutter/material.dart';
import 'package:todo_list_flutter_basics/utils/utils.dart';
import 'package:todo_list_flutter_basics/widgets/add_todo_widget.dart';
import 'package:todo_list_flutter_basics/widgets/list_view_header.dart';

import '../models/todo.dart';

class TodoList extends StatefulWidget {
  const TodoList({required this.itemList, super.key});

  final List<Todo> itemList;

  @override
  State createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  int _editModeIndex = -1;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.itemList.length + 1,
      itemBuilder: (ctx, index) {
        if (index == 0) {
          return ListViewHeader(onTodoAdd: (text) {
            setState(() {
              widget.itemList.insert(
                  0, Todo(99, widget.itemList.last.id + 1, text, false));
              Utils.showSnackbar(context, 'Todo added successfully!');
            });
          });
        } else {
          var item = widget.itemList[index - 1];

          if (_editModeIndex != index) {
            return ListTile(
              trailing: item.completed
                  ? Icon(Icons.done_all, color: Theme.of(context).primaryColor)
                  : GestureDetector(
                      onTap: () {
                        setState(() {
                          _editModeIndex = index;
                        });
                      },
                      child: const Icon(Icons.edit),
                    ),
              title: Text(item.title),
              subtitle: Text('User: ${item.userId}'),
            );
          } else {
            return AddTodoWidget(
                defaultText: item.title,
                onSubmit: (text) {
                  setState(() {
                    _editModeIndex = -1;
                    item.title = text;
                    Utils.showSnackbar(context, 'Todo edited successfully!');
                  });
                });
          }
        }
      },
    );
  }
}
