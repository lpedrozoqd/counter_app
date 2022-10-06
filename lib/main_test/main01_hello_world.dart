import 'package:flutter/material.dart';

void main_01() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "UIMixWidgets",
    home: MyScaffold(),
  ));
}

class MyScaffold extends StatelessWidget {
  const MyScaffold({key});
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: [
          MyAppBar(
            title: Text(
              'EjT',
              style: Theme.of(context).primaryTextTheme.headline6,
            ),
          ),
          const Expanded(
            child: Center(child: Text("FApp")),
          )
        ],
      ),
    );
  }
}

class MyAppBar extends StatelessWidget {
  const MyAppBar({required this.title, key});
  final Widget title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56.0, //En pixeles lógicos
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      decoration: BoxDecoration(color: Colors.blue[500]),
      //Fila es horizontal, layout lineal
      child: Row(children: [
        const IconButton(
          icon: Icon(Icons.menu),
          tooltip: 'Menú de navegación',
          onPressed: null, //Se deshabilita el botón
        ),
        //Expande su hijo
        //para llenar el espacio disponible
        Expanded(
          child: title,
        ),
        const IconButton(
          icon: Icon(Icons.search),
          tooltip: 'Búsqueda',
          onPressed: null, //Se deshabilita el botón
        ),
      ]),
    );
  }
}
