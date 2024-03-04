import 'dart:async';

import 'package:flutter/material.dart';

class CounterViewModel with ChangeNotifier {
  // Singleton instance
  static final CounterViewModel _instance = CounterViewModel._internal();

  factory CounterViewModel() {
    return _instance;
  }

  CounterViewModel._internal();

  // Mixin - IncrementingMixin
  int _counter = 0;

  int get counter => _counter;

  void increment() {
    _counter++;
    notifyListeners();
  }

  // Stream and StreamController
  final _counterStreamController = StreamController<int>.broadcast();

  Stream<int> get counterStream => _counterStreamController.stream;

  void incrementWithStream() {
    _counter++;
    _counterStreamController.sink.add(_counter);
  }

  // Dispose of the StreamController when no longer needed
  @override
  void dispose() {
    super.dispose();
    _counterStreamController.close();
  }
}
