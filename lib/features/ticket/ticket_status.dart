import 'package:flutter/material.dart';

class TicketStatusScreen extends StatelessWidget {
  const TicketStatusScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Ticket Status')),
      body: const Center(child: Text('Your ticket status will be shown here.')),
    );
  }
}
