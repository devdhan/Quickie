import 'package:flutter/material.dart';

class TicketQRDisplayScreen extends StatelessWidget {
  final VoidCallback? onCheckStatus;
  final VoidCallback? onValidate;
  const TicketQRDisplayScreen({Key? key, this.onCheckStatus, this.onValidate})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Your Ticket')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 200,
              height: 200,
              color: Colors.grey[300],
              child: const Center(child: Text('QR Code Placeholder')),
            ),
            const SizedBox(height: 16),
            const Text('Show this QR code at the counter.'),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: onCheckStatus,
              child: const Text('Check Status'),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: onValidate,
              child: const Text('Validate Ticket'),
            ),
          ],
        ),
      ),
    );
  }
}
