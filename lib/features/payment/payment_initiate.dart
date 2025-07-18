import 'package:flutter/material.dart';

class PaymentInitiateScreen extends StatelessWidget {
  final VoidCallback? onProceed;
  const PaymentInitiateScreen({Key? key, this.onProceed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Initiate Payment')),
      body: Center(
        child: ElevatedButton(
          onPressed: onProceed,
          child: const Text('Proceed to Payment'),
        ),
      ),
    );
  }
}
