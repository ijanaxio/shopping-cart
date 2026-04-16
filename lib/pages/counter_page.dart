// lib/pages/counter_page.dart
import 'package:flutter/material.dart';
import 'counter_display_page.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  // Ephemeral state - local to this widget
  int _counter = 0;

  void _increment() {
    setState(() {
      _counter++; // Modify state
    }); // Trigger rebuild
  }

  void _reset() {
    setState(() {
      _counter = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    print('CounterPage rebuilt!'); // Debug print

    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter with setState'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'You have pushed the button this many times:',
              style: TextStyle(fontSize: 16),
            ),

            const SizedBox(height: 20),

            Text(
              '$_counter',
              style: const TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),

            const SizedBox(height: 40),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: _increment,
                  child: const Text('Increment'),
                ),

                const SizedBox(width: 16),

                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CounterDisplayPage(
                          counter: _counter, // ← Pass counter value
                        ),
                      ),
                    );
                  },
                  icon: const Icon(Icons.arrow_forward),
                  label: const Text('View Counter'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}