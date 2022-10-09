import 'package:flutter/material.dart';

class CounterScreenV2 extends StatefulWidget {
  const CounterScreenV2({Key? key}) : super(key: key);

  @override
  State<CounterScreenV2> createState() => _CounterScreenV2State();
}

class _CounterScreenV2State extends State<CounterScreenV2> {
  int _counter = 10;

  void increase() {
    _counter++;
    setState(() {});
  }

  void decrease() {
    _counter--;
    setState(() {});
  }

  void reset() {
    _counter = 0;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    const fontSize30 = TextStyle(fontSize: 30);

    return Scaffold(
        appBar: AppBar(
          title: const Text("HM v09101319"),
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
        floatingActionButton: CustomFloatingAction(
          increaseFn: increase,
          decreaseFn: decrease,
          resetFn: reset,
        ));
  }
}

class CustomFloatingAction extends StatelessWidget {
  final Function increaseFn;
  final Function decreaseFn;
  final Function resetFn;

  const CustomFloatingAction({
    Key? key,
    required this.increaseFn,
    required this.decreaseFn,
    required this.resetFn,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      //Este es el espacio entre los widgets del Row
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        FloatingActionButton(
          onPressed: () => increaseFn(),
          child: const Icon(Icons.exposure_plus_1_outlined),
        ),
        //Es como un widget invisible para separara widgets
        const SizedBox(width: 20),
        FloatingActionButton(
          onPressed: () => resetFn(),
          child: const Icon(Icons.exposure_zero_outlined),
        ),
        const SizedBox(width: 20),
        FloatingActionButton(
          onPressed: () => decreaseFn(),
          child: const Icon(Icons.exposure_minus_1_outlined),
        ),
      ],
    );
  }
}
