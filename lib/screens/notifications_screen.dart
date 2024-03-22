import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:practica3/screens/home_screen.dart';
import 'package:practica3/screens/images_screen.dart';
import 'package:practica3/screens/infinite_scroll_screen.dart';
import 'package:practica3/theme/app_theme.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  int navIndex=2;

  openScreen(int index, BuildContext context) {
    MaterialPageRoute ruta=MaterialPageRoute(builder: (context) => const HomeScreen());
    switch(index) {
      case 0:
        ruta=MaterialPageRoute(builder: (context) => const HomeScreen());
      break;
      case 1:
        ruta=MaterialPageRoute(builder: (context) => const InfiniteScrollScreen());
      break;
      case 2:
        ruta=MaterialPageRoute(builder: (context) => const NotificationScreen());
      break;
      case 3:
        ruta=MaterialPageRoute(builder: (context) => const ImagesScreen());
      break;
      case 4:
        SystemChannels.platform.invokeMethod('SystemNavigator.pop');
      break;
    }
    setState(() {
      navIndex=index;
      Navigator.push(context, ruta);
    });    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notificaciones'),
      ),
      body: Text('Pantalla de notificaciones.',style: AppTheme.lightTheme.textTheme.bodySmall,),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: navIndex,
        onTap: (index) => openScreen(index,context),
        unselectedItemColor: AppTheme.secColor,
        selectedItemColor: AppTheme.primColor,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Inicio'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_outlined),
            label: 'Lista'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notificaciones'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.image),
            label: 'Imágenes'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.exit_to_app),
            label: 'Salir'
          ),
        ],
        backgroundColor: Colors.white
      ),
    );
  }
}