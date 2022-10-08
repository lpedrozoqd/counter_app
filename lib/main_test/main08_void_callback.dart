import 'package:flutter/material.dart';

void main_08(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Using VoidCallback",
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const ParentWidgetPage(title: "Using VoidCallback"),
    );
  }
}

class ParentWidgetPage extends StatefulWidget {
  const ParentWidgetPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<ParentWidgetPage> createState() => _ParentWidgetPageState();
}

class _ParentWidgetPageState extends State<ParentWidgetPage> {
  int _counter = 0;

  void _voidCallback() {
    setState(() {
      _counter++;
    });
  }

  void _functionCallback(int i) {
    setState(() {
      _counter += i;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)), //El 'title' del widget parent
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('You have pushed the button this many times: '),
          Text(
            '$_counter',
            style: Theme.of(context).textTheme.headline4,
          )
        ],
      )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          VoidChildWidgetPage(voidCallback: _voidCallback),
          FunctionChildWidgetPage(
            functionCallback: _functionCallback,
          )
        ]),
      ),
    );
  }
}

class VoidChildWidgetPage extends StatelessWidget {
  final VoidCallback voidCallback;
  const VoidChildWidgetPage({Key? key, required this.voidCallback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () => voidCallback(), child: const Text('Void callback'));
  }
}

class FunctionChildWidgetPage extends StatelessWidget {
  final Function(int) functionCallback;
  const FunctionChildWidgetPage({Key? key, required this.functionCallback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => functionCallback(5),
      child: const Text('Fx Callback'),
    );
  }
}
