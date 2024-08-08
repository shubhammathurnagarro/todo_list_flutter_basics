import 'package:flutter/material.dart';
import 'package:todo_list_flutter_basics/utils/utils.dart';
import 'package:todo_list_flutter_basics/widgets/error_message_widget.dart';
import 'package:todo_list_flutter_basics/widgets/loader_widget.dart';

class CheckInternetWidget extends StatefulWidget {
  const CheckInternetWidget({required this.mainWidget, super.key});

  final Widget mainWidget;

  @override
  State createState() => _CheckInternetWidgetState();
}

class _CheckInternetWidgetState extends State<CheckInternetWidget> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Utils.checkInternetConnectivity(),
      builder: (ctx, isConnected) {
        if (isConnected.connectionState == ConnectionState.waiting) {
          return const LoaderWidget();
        } else if (isConnected.data == true) {
          return widget.mainWidget;
        } else {
          return ErrorMessageWidget(onRetry: () {
            setState(() {});
          });
        }
      },
    );
  }
}
