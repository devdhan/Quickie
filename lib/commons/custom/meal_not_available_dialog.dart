import 'package:flutter/material.dart';

class MealNotAvailableDialog extends StatelessWidget {
  final VoidCallback? onClose;
  const MealNotAvailableDialog({Key? key, this.onClose}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Meal Not Available'),
      content: const Text(
        'Sorry, the selected meal is not available at this time.',
      ),
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
