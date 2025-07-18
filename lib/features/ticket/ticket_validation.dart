import 'package:flutter/material.dart';

class TicketValidationScreen extends StatelessWidget {
  const TicketValidationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Validate Ticket')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {},
          child: const Text('Scan Ticket QR Code'),
        ),
      ),
    );
  }
}
