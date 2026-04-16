// lib/models/counter_model.dart
import 'package:flutter/foundation.dart';

class CounterModel extends ChangeNotifier {
  // 1. Private state variable
  int _count = 0;

  // 2. Public getter for read access
  int get count => _count;

  // 3. Public methods to modify state

  void increment() {
    _count++; // Modify state
    notifyListeners(); // ← CRUCIAL! Notify all listeners
  }

  void decrement() {
    if (_count > 0) {
      _count--;
      notifyListeners();
    }
  }

  void reset() {
    _count = 0;
    notifyListeners();
  }

  // Optional: method dengan parameter
  void addValue(int value) {
    _count += value;
    notifyListeners();
  }
}