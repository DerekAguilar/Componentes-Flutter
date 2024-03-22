import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:practica3/models/data.dart';
import 'package:practica3/screens/home_screen.dart';
import 'package:practica3/screens/images_screen.dart';
import 'package:practica3/screens/infinite_scroll_screen.dart';
import 'package:practica3/screens/notifications_screen.dart';
import 'package:practica3/theme/app_theme.dart';

class DataScreen extends StatefulWidget {
  final Data info;
  const DataScreen({super.key,required this.info});

  @override
  State<DataScreen> createState() => _DataScreenState();
}

class _DataScreenState extends State<DataScreen> {
  int navIndex=0;

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
        title: const Text('Datos'),
      ),
      body: Column(
        children: [
          infoCard(),
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

  Padding infoCard() {
    return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      const Icon(Icons.person),
                      Text(
                        widget.info.name!,
                        style: AppTheme.lightTheme.textTheme.headlineLarge,
                      )
                    ],
                  ),
                  const Divider(),
                  dataRow('Le gusta Flutter: ',ynText(comparedVal: widget.info.likesFlutter!)),
                  dataRow('Calificación a Flutter: ', widget.info.flutterRating.toString()),
                  dataRow('Framework preferido: ', widget.info.mobDevLanguage!),
                  
                  ListBody(
                    children: [
                      Text(
                        'Modo de ejecución de apps: ',
                        style: AppTheme.lightTheme.textTheme.headlineMedium,
                        textAlign: TextAlign.left,
                      ),
                      Column(children: [
                        Row(children: [
                          Text(
                            '~Web: ',
                            style: AppTheme.lightTheme.textTheme.headlineMedium,
                          ),
                          Text(
                            ynText(comparedVal: widget.info.web!),
                            style: AppTheme.lightTheme.textTheme.bodySmall,
                          ),
                        ]),
                        Row(children: [
                          Text(
                            '~Emulador: ',
                            style: AppTheme.lightTheme.textTheme.headlineMedium,
                          ),
                          Text(
                            ynText(comparedVal: widget.info.emulator!),
                            style: AppTheme.lightTheme.textTheme.bodySmall,
                          ),
                        ]),
                        Row(children: [
                          Text(
                            '~Celular: ',
                            style: AppTheme.lightTheme.textTheme.headlineMedium,
                          ),
                          Text(
                            ynText(comparedVal: widget.info.phone!),
                            style: AppTheme.lightTheme.textTheme.bodySmall,
                          )
                        ])
                      ],)
                    ],
                  )
                ],
              ),
            ),
          ),
        );
  }

  Row dataRow(String question, String answer) {
    return Row(
      children: [
        Text(
          question,
          style: AppTheme.lightTheme.textTheme.headlineMedium,
        ),
        Text(
          answer,
          style: AppTheme.lightTheme.textTheme.bodySmall,
        )
      ],
    );
  }

  String ynText({required bool comparedVal}) {
    if (comparedVal) {
      return 'Sí';
    } else {
      return 'No';
    }
  }
}