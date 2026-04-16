// lib/pages/home_page.dart
import 'package:flutter/material.dart';
import 'profile_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _counter = 0;

  void _increment() {
    setState(() => _counter++);
  }

  void _reset() {
    setState(() => _counter = 0);
  }

  @override
  Widget build(BuildContext context) {
    print('🔴 HomePage rebuilt!');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          // Badge showing counter
          Center(
            child: Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: const BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
                child: Text(
                  '$_counter',
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Counter: $_counter',
              style: const TextStyle(fontSize: 32),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: _increment,
              child: const Text('Increment'),
            ),

            const SizedBox(height: 40),

            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProfilePage(
                      counter: _counter, // ← Pass counter
                      onReset: _reset,   // ← Pass callback
                    ),
                  ),
                );
              },
              icon: const Icon(Icons.person),
              label: const Text('Go to Profile'),
            ),
          ],
        ),
      ),
    );
  }
}