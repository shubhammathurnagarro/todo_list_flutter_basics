import 'package:flutter/material.dart';
import 'package:todo_list_flutter_basics/widgets/check_internet_widget.dart';
import 'package:todo_list_flutter_basics/widgets/todo_list_container.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    const String appName = 'Todo List';

    return MaterialApp(
      title: appName,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text(appName),
          elevation: 3,
          centerTitle: true,
        ),
        body: const CheckInternetWidget(mainWidget: TodoListContainer()),
      ),
    );
  }
}
