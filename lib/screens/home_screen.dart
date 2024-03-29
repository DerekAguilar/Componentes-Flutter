import 'package:flutter/material.dart';
import 'package:practica3/screens/images_screen.dart';
import 'package:practica3/screens/infinite_scroll_screen.dart';
import 'package:practica3/screens/inputs_screen.dart';
import 'package:practica3/screens/notifications_screen.dart';
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
            leading: IconTheme(
              data: AppTheme.lightTheme.iconTheme, 
              child: const Icon(Icons.input_rounded)
            ),
            trailing: trailingArrow(),
            onTap:() {
              final ruta1=MaterialPageRoute(builder: (context) {
                return const InputsScreen();
              });
              Navigator.push(context, ruta1);
            },
          ),
          const Divider(),
          ListTile(
            title: Text('ListView.builder',
            style: AppTheme.lightTheme.textTheme.headlineLarge,),
            subtitle: Text('Lista con scroll infinito',
            style: AppTheme.lightTheme.textTheme.bodySmall,),
            leading: IconTheme(
              data: AppTheme.lightTheme.iconTheme, 
              child: const Icon(Icons.list_alt_rounded)
            ),
            trailing: trailingArrow(),
            onTap:() {
              final ruta2=MaterialPageRoute(builder: (context) {
                return const InfiniteScrollScreen();
              });
              Navigator.push(context, ruta2);
            },
          ),
          const Divider(),
          ListTile(
            title: Text('Notificaciones',
            style: AppTheme.lightTheme.textTheme.headlineLarge,),
            subtitle: Text('Mostrar una notificación',
            style: AppTheme.lightTheme.textTheme.bodySmall,),
            leading: IconTheme(
              data: AppTheme.lightTheme.iconTheme, 
              child: const Icon(Icons.notifications_outlined)
            ),
            trailing: trailingArrow(),
            onTap:() {
              final ruta3=MaterialPageRoute(builder: (context) {
                return const NotificationScreen();
              });
              Navigator.push(context, ruta3);
            },
          ),
          const Divider(),
          ListTile(
            title: Text('Imágenes',
            style: AppTheme.lightTheme.textTheme.headlineLarge,),
            subtitle: Text('Mostrar fotos',
            style: AppTheme.lightTheme.textTheme.bodySmall,),
            leading: IconTheme(
              data: AppTheme.lightTheme.iconTheme, 
              child: const Icon(Icons.image_outlined)
            ),
            trailing: trailingArrow(),
            onTap:() {
              final ruta4=MaterialPageRoute(builder: (context) {
                return const ImagesScreen();
              });
              Navigator.push(context, ruta4);
            },
          ),
        ],
      )
    );
  }

  IconTheme trailingArrow() {
    return IconTheme(
            data: AppTheme.lightTheme.iconTheme, 
            child: const Icon(Icons.keyboard_arrow_right)
          );
  }
}