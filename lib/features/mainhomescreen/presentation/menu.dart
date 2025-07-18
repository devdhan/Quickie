import 'package:flutter/material.dart';

class MenuScreen extends StatelessWidget {
  final String mealName;
  final VoidCallback? onBuyTicket;
  const MenuScreen({Key? key, required this.mealName, this.onBuyTicket})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Menu')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Meal: $mealName'),
            const SizedBox(height: 16),
            const Text('Menu items will be displayed here.'),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: onBuyTicket,
              child: const Text('Buy Ticket'),
            ),
          ],
        ),
      ),
    );
  }
}
