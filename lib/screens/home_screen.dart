import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Componentes de Flutter'),
      ),
      body: ListView(
        children: const <Widget>[
          ListTile(
            title: Text('Una Vida Fragmentada'),
            subtitle: Text('Autor: Matt Dymerski'),
            leading: Icon(Icons.menu_book),
            trailing: Icon(Icons.keyboard_arrow_right),
          ),
          Divider(),
          ListTile(
            title: Text('El Portal en el Bosque'),
            subtitle: Text('Autor: Matt Dymerski'),
            leading: Icon(Icons.book_outlined),
            trailing: Icon(Icons.keyboard_arrow_right),
          ),
          Divider(),
          ListTile(
            title: Text('La Luna en Llamas'),
            subtitle: Text('Autor: Matt Dymerski'),
            leading: Icon(Icons.book_sharp),
            trailing: Icon(Icons.keyboard_arrow_right),
          ),
        ],
      )
    );
  }
}