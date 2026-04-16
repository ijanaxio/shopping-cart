// lib/pages/settings_page.dart
import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  final int counter;        // ← Receive from Profile (from Home!)
  final VoidCallback onReset; // ← Receive from Profile (from Home!)

  const SettingsPage({
    super.key,
    required this.counter,
    required this.onReset,
  });

  @override
  Widget build(BuildContext context) {
    print('🟢 SettingsPage rebuilt!');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.settings,
              size: 80,
            ),

            const SizedBox(height: 20),

            Text(
              'Current Points: $counter',
              style: const TextStyle(fontSize: 20),
            ),

            const SizedBox(height: 40),

            ElevatedButton.icon(
              onPressed: () {
                onReset(); // ← Call callback 2 levels deep!

                Navigator.pop(context);
                Navigator.pop(context); // Back to Home
              },
              icon: const Icon(Icons.refresh),
              label: const Text('Reset Points'),

              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
              ),
            ),

            const SizedBox(height: 10),

            const Text(
              '⚠️ This is 2 levels deep from HomePage!',
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}