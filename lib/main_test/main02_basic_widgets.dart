import 'package:flutter/material.dart';

void main_02() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Using Material Comps",
    home: HomeUI(),
  ));
}

class HomeUI extends StatelessWidget {
  const HomeUI({key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: const IconButton(
              icon: Icon(Icons.menu),
              tooltip: 'Navigation menu',
              onPressed: null),
          title: const Text("Hola Comps"),
          actions: const [
            IconButton(
                icon: Icon(Icons.search), tooltip: 'Search', onPressed: null)
          ],
        ),
        body: Center(child: Text("Hola!")),
        floatingActionButton: const FloatingActionButton(
          tooltip: 'Add',
          onPressed: null,
          child: Icon(Icons.add),
        ));
  }
}
