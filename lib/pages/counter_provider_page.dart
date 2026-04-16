// lib/pages/counter_provider_page.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/counter_model.dart';

class CounterProviderPage extends StatelessWidget {
  const CounterProviderPage({super.key});

  @override
  Widget build(BuildContext context) {
    print('🔴 CounterProviderPage build'); // We'll see this ONCE

    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter with Provider'),
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

            // Consumer - Only THIS widget rebuilds!
            Consumer<CounterModel>(
              builder: (context, counter, child) {
                print('🟢 Consumer rebuilt!'); // Only this prints on change

                return Text(
                  '${counter.count}',
                  style: const TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                );
              },
            ),

            const SizedBox(height: 40),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Use context.read to trigger action
                    context.read<CounterModel>().increment();
                  },
                  child: const Text('Increment'),
                ),

                const SizedBox(width: 16),

                ElevatedButton(
                  onPressed: () {
                    context.read<CounterModel>().decrement();
                  },
                  child: const Text('Decrement'),
                ),

                const SizedBox(width: 16),

                ElevatedButton(
                  onPressed: () {
                    context.read<CounterModel>().reset();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                  ),
                  child: const Text('Reset'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}