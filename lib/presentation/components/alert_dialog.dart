import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomAlertDialog extends StatelessWidget {
  const CustomAlertDialog({
    required this.onPressed,
    required this.content,
    required this.title,
    this.disableButton = false,
    this.isError = false,
    super.key,
  });

  final VoidCallback onPressed;
  final String content;
  final String title;
  final bool disableButton;
  final bool isError;
  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text(
        title,
        style: TextStyle(
          color: isError ? Colors.red : null,
        ),
      ),
      content: Text(
        content,
        style: const TextStyle(
          fontSize: 18,
        ),
      ),
      actions: [
        if (!disableButton) ...dialogButton(context),
      ],
    );
  }

  List<Widget> dialogButton(context) {
    return [
      if (!isError)
        TextButton(
          onPressed: onPressed,
          child: const Text(
            'Yes',
            style: TextStyle(
              fontSize: 17,
            ),
          ),
        ),
      TextButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: Text(
          isError ? 'Ok' : 'No',
          style: const TextStyle(
            fontSize: 17,
          ),
        ),
      )
    ];
  }
}
