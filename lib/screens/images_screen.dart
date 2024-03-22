import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:practica3/screens/home_screen.dart';
import 'package:practica3/screens/infinite_scroll_screen.dart';
import 'package:practica3/screens/notifications_screen.dart';
import 'package:practica3/theme/app_theme.dart';
import 'package:transparent_image/transparent_image.dart';

class ImagesScreen extends StatefulWidget {
  const ImagesScreen({super.key});

  @override
  State<ImagesScreen> createState() => _ImagesScreenState();
}

class _ImagesScreenState extends State<ImagesScreen> {
  int navIndex=3;

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
        title: const Text('Imágenes'),
      ),
      body: ListView(
        children: [
          imageFade(),
          cardImage1(),
          image2()
        ],
      ),
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

  Card cardImage1(){
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32.0)),
      margin: const EdgeInsets.all(16.0),
      elevation: 10,
      child: ClipRRect(
        borderRadius:BorderRadius.circular(12.0),
        child: Column(
          children: [
            const Image(
              image: AssetImage('assets/img/meow.png'),
            ),
            Container(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                'Gato loco',
                style: AppTheme.lightTheme.textTheme.headlineMedium,
              ),
            )
          ],
        ),
      ),
    );
  }

  SizedBox image2(){
    return SizedBox(
      height: 300.0,
      width: 300.0,
      child: Image.network('https://cdn.7tv.app/emote/6234640c5adeefc2383fb53a/4x.webp')
    );
  }

  Stack imageFade() {
    return Stack(
      children: <Widget>[
        const Center(
          child: CircularProgressIndicator(),
        ),
        Center(
          child: FadeInImage.memoryNetwork(
            placeholder: kTransparentImage,
            image: 'https://cdn.7tv.app/emote/6234640c5adeefc2383fb53a/4x.webp',
          ),
        )
      ],
    );
  }
}