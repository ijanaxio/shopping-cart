// lib/pages/counter_display_page.dart
import 'package:flutter/material.dart';

class CounterDisplayPage extends StatelessWidget {
  final int counter; // ← Need counter dari parent!

  const CounterDisplayPage({
    super.key,
    required this.counter,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter Display'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Counter value from HomePage:',
              style: TextStyle(fontSize: 18),
            ),

            const SizedBox(height: 20),

            Text(
              '$counter',
              style: const TextStyle(
                fontSize: 64,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),

            const SizedBox(height: 40),

            const Text(
              '⚠️ But I can\'t increment it here!',
              style: TextStyle(
                fontSize: 16,
                color: Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}