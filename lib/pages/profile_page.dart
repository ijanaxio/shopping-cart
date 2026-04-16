// lib/pages/profile_page.dart
import 'package:flutter/material.dart';
import 'settings_page.dart';

class ProfilePage extends StatelessWidget {
  final int counter;        // ← Receive from HomePage
  final VoidCallback onReset; // ← Receive callback

  const ProfilePage({
    super.key,
    required this.counter,
    required this.onReset,
  });

  @override
  Widget build(BuildContext context) {
    print(' ProfilePage rebuilt!');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 50,
              child: Icon(
                Icons.person,
                size: 50,
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              'User Profile',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            Text(
              'Points: $counter', // ← Use counter here!
              style: const TextStyle(fontSize: 20),
            ),

            const SizedBox(height: 40),

            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SettingsPage(
                      counter: counter, // ← Pass again!
                      onReset: onReset, // ← Pass again!
                    ),
                  ),
                );
              },
              icon: const Icon(Icons.settings),
              label: const Text('Go to Settings'),
            ),
          ],
        ),
      ),
    );
  }
}