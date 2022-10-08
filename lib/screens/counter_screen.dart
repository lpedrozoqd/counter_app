import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({Key? key}) : super(key: key);

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int _counter = 10;

  @override
  Widget build(BuildContext context) {
    const fontSize30 = TextStyle(fontSize: 30);

    return Scaffold(
        appBar: AppBar(
          title: const Text("HM v07102004"),
          elevation: 10.0,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text('Número de clicks', style: fontSize30),
              Text('$_counter', style: fontSize30),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Row(
          //Este es el espacio entre los widgets del Row
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            FloatingActionButton(
              onPressed: () => setState(() => _counter++),
              child: const Icon(Icons.exposure_plus_1_outlined),
            ),
            //Es como un widget invisible para separara widgets
            const SizedBox(width: 20),
            FloatingActionButton(
              onPressed: () => setState(() => _counter = 0),
              child: const Icon(Icons.exposure_zero_outlined),
            ),
            const SizedBox(width: 20),
            FloatingActionButton(
              onPressed: () => setState(() => _counter--),
              child: const Icon(Icons.exposure_minus_1_outlined),
            ),
          ],
        ));
  }
}
