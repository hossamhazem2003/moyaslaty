import 'package:flutter/material.dart';

import '../core/sizes.dart';

Widget backGroungImage(BuildContext context) {
  return Image.asset(
    "assets/images/bg.jpeg",
    height: Sizes.height(context),
    width: Sizes.width(context),
    fit: BoxFit.fill,
  );
}

/// show adaptive dialog with title and message
class Dialogs {
  static Future showAdaptiveDialogReuse(
  BuildContext context,
  String title,
  String message,
) {
  return showAdaptiveDialog(
    context: context,
    builder: (BuildContext context) => AlertDialog.adaptive(
      title: Text(title, style: const TextStyle(color: Colors.red),),
      content: SingleChildScrollView(
        child: Text(message),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('OK'),
        ),
      ],
    ),
  );
}
}
