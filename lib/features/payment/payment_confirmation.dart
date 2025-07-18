import 'package:flutter/material.dart';

class PaymentConfirmationScreen extends StatefulWidget {
  final VoidCallback? onConfirmed;
  const PaymentConfirmationScreen({Key? key, this.onConfirmed})
    : super(key: key);

  @override
  State<PaymentConfirmationScreen> createState() =>
      _PaymentConfirmationScreenState();
}

class _PaymentConfirmationScreenState extends State<PaymentConfirmationScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      if (widget.onConfirmed != null) widget.onConfirmed!();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Payment Confirmation')),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            SizedBox(height: 16),
            Text('Verifying payment and creating ticket...'),
          ],
        ),
      ),
    );
  }
}
