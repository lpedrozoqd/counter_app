import 'package:flutter/material.dart';

class CounterScreenV1 extends StatefulWidget {
  const CounterScreenV1({Key? key}) : super(key: key);

  @override
  State<CounterScreenV1> createState() => _CounterScreenV1State();
}

class _CounterScreenV1State extends State<CounterScreenV1> {
  int _counter = 10;

  @override
  Widget build(BuildContext context) {
    const fontSize30 = TextStyle(fontSize: 30);

    return Scaffold(
        appBar: AppBar(
          title: const Text("HM v07102041"),
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
        floatingActionButton: const CustomFloatingAction());
  }
}

class CustomFloatingAction extends StatelessWidget {
  const CustomFloatingAction({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      //Este es el espacio entre los widgets del Row
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: const [
        FloatingActionButton(
          onPressed: null,
          child: Icon(Icons.exposure_plus_1_outlined),
        ),
        //Es como un widget invisible para separara widgets
        SizedBox(width: 20),
        FloatingActionButton(
          onPressed: null,
          child: Icon(Icons.exposure_zero_outlined),
        ),
        SizedBox(width: 20),
        FloatingActionButton(
          onPressed: null,
          child: Icon(Icons.exposure_minus_1_outlined),
        ),
      ],
    );
  }
}
