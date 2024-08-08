import 'package:flutter/material.dart';

import 'add_todo_widget.dart';

class ListViewHeader extends StatefulWidget {
  const ListViewHeader({required this.onTodoAdd, super.key});

  final void Function(String text) onTodoAdd;

  @override
  State createState() => _ListViewHeaderState();
}

class _ListViewHeaderState extends State<ListViewHeader> {
  bool _isInAddMode = false;

  @override
  Widget build(BuildContext context) {
    if (_isInAddMode) {
      return AddTodoWidget(onSubmit: (text) {
        setState(() {
          widget.onTodoAdd(text);
          _isInAddMode = false;
        });
      });
    } else {
      return ListTile(
        onTap: () {
          setState(() {
            _isInAddMode = true;
          });
        },
        title: const Center(
          child: Text('Add Todo'),
        ),
      );
    }
  }
}
