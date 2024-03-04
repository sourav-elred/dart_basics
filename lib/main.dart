import 'package:dart_basics/utlis/string_extensions.dart';
import 'package:dart_basics/viewModels/counter_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CounterViewModel(),
      child: const MaterialApp(
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final counterProvider = Provider.of<CounterViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Counter: ${counterProvider.counter}',
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                counterProvider.increment();
              },
              child: const Text('Increment'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                counterProvider.incrementWithStream();
              },
              child: const Text('Increment with Stream'),
            ),
            const SizedBox(height: 20),
            StreamBuilder<int>(
              stream: counterProvider.counterStream,
              builder: (context, snapshot) {
                return Text(
                  'Counter from Stream: ${snapshot.data ?? 0}',
                  style: const TextStyle(fontSize: 16),
                );
              },
            ),
            const SizedBox(height: 20),
            Text(
              'flutter extension'.capitalize(),
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
