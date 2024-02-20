import 'package:flutter/material.dart';
import 'package:practica3/theme/app_theme.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Componentes de Flutter'),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text('Entradas',
            style: AppTheme.lightTheme.textTheme.headlineLarge),
            subtitle: Text('Introduciendo valores',
            style: AppTheme.lightTheme.textTheme.bodySmall),
            leading: const Icon(Icons.input_rounded),
            trailing: const Icon(Icons.keyboard_arrow_right),
          ),
          const Divider(),
          ListTile(
            title: Text('ListView.builder',
            style: AppTheme.lightTheme.textTheme.headlineLarge,),
            subtitle: Text('Lista con scroll infinito',
            style: AppTheme.lightTheme.textTheme.bodySmall,),
            leading: const Icon(Icons.list_alt_rounded),
            trailing: const Icon(Icons.keyboard_arrow_right),
          ),
          const Divider(),
          ListTile(
            title: Text('Notificaciones',
            style: AppTheme.lightTheme.textTheme.headlineLarge,),
            subtitle: Text('Mostrar una notificación',
            style: AppTheme.lightTheme.textTheme.bodySmall,),
            leading: const Icon(Icons.notifications_outlined),
            trailing: const Icon(Icons.keyboard_arrow_right),
          ),
        ],
      )
    );
  }
}