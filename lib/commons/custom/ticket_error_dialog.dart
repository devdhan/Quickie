import 'package:flutter/material.dart';

class TicketErrorDialog extends StatelessWidget {
  final String errorMessage;
  final VoidCallback? onClose;
  const TicketErrorDialog({Key? key, required this.errorMessage, this.onClose}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Ticket Error'),
      content: Text(errorMessage),
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