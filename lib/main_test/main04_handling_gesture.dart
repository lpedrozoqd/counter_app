import 'package:flutter/material.dart';

void main_04() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Using Material Comps",
    home: Scaffold(body: Center(child: MyButton())),
  ));
}

class MyButton extends StatelessWidget {
  const MyButton({key});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("My button was tapped");
      },
      child: Container(
        height: 50.0,
        padding: const EdgeInsets.all(8.0),
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
            color: Colors.lightGreen[500]),
        child: const Center(
          child: Text('Engage'),
        ),
      ),
    );
  }
}
