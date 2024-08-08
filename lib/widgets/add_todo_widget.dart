import 'package:flutter/material.dart';

class AddTodoWidget extends StatefulWidget {
  const AddTodoWidget(
      {super.key, required this.onSubmit, this.defaultText = ''});

  final void Function(String text) onSubmit;
  final String defaultText;

  @override
  State<AddTodoWidget> createState() => _AddTodoWidgetState();
}

class _AddTodoWidgetState extends State<AddTodoWidget> {
  late final TextEditingController _textEditingController;
  bool _isValidText = true;

  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController(text: widget.defaultText);
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: TextField(
        controller: _textEditingController,
        keyboardType: TextInputType.text,
        autofocus: true,
        textCapitalization: TextCapitalization.sentences,
        textInputAction: TextInputAction.done,
        onSubmitted: (text) => _onTextSubmit(),
        onChanged: (text) {
          if (text.isNotEmpty) {
            setState(() => _isValidText = text.isNotEmpty);
          }
        },
        decoration: InputDecoration(
          labelText: 'Todo Text',
          border: const OutlineInputBorder(),
          errorText: _isValidText ? null : 'Text can not be empty',
        ),
      ),
      trailing: ElevatedButton(
        onPressed: () => _onTextSubmit(),
        child: const Text('Submit'),
      ),
    );
  }

  void _onTextSubmit() {
    if (_textEditingController.text.trim().isEmpty) {
      setState(() => _isValidText = false);
    } else {
      widget.onSubmit(_textEditingController.text);
      _textEditingController.clear();
    }
  }
}
