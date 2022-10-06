import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main_05(List<String> args) {
  runApp(const MaterialApp(
    home: Scaffold(
      body: Center(
        child: Counter(),
      ),
    ),
  ));
}

class Counter extends StatefulWidget {
  const Counter({key});
  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int _counter = 0;

  void _increment() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(onPressed: _increment, child: const Text('increment')),
        const SizedBox(width: 16),
        Text('Count:  $_counter')
      ],
    );
  }
}
