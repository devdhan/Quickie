import 'package:flutter/material.dart';

class ServedConfirmationDialog extends StatelessWidget {
  final VoidCallback? onClose;
  const ServedConfirmationDialog({Key? key, this.onClose}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Meal Served'),
      content: const Text('Your meal has been served. Enjoy!'),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
            if (onClose != null) onClose!();
          },
          child: const Text('OK'),
        ),
      ],
    );
  }
}
