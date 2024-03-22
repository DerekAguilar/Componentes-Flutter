import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:practica3/models/data.dart';
import 'package:practica3/screens/data_screen.dart';
import 'package:practica3/screens/home_screen.dart';
import 'package:practica3/screens/images_screen.dart';
import 'package:practica3/screens/infinite_scroll_screen.dart';
import 'package:practica3/screens/notifications_screen.dart';
import 'package:practica3/theme/app_theme.dart';

class InputsScreen extends StatefulWidget {
  const InputsScreen({super.key});

  @override
  State<InputsScreen> createState() => _InputsScreenState();
}

class _InputsScreenState extends State<InputsScreen> {
  String? name;
  bool switchFlag=false; // controla el widget switch
  double sliderValue=0.0;
  String? radioSelected;
  var isChecked=[false,false,false];
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
        title: const Text('Entradas'),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                nameInput(),
                switchInput(),
                sliderInput(),
                radioInput(),
                Text(
                  '¿Qué usas para ejecutar tus apps?',
                  style: AppTheme.lightTheme.textTheme.headlineLarge,
                ),
                checkboxInput(),
                ElevatedButton(
                  onPressed: () {
                    Data data=Data(
                      nm: name!,
                      likes: switchFlag,
                      rating: sliderValue.round(),
                      lang: radioSelected!,
                      wb: isChecked[0],
                      emu: isChecked[1],
                      phn: isChecked[2]
                    );
                    final ruta5=MaterialPageRoute(builder: (context) {
                      return DataScreen(info: data);
                    });
                    Navigator.push(context, ruta5);
                  },
                  child: const Text('Guardar'),
                ),
              ],
            ),
          ),
        ]
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

  TextField nameInput() {
    return TextField(
          style: AppTheme.lightTheme.textTheme.headlineMedium,
          decoration: InputDecoration(
            border: const UnderlineInputBorder(),
            labelText: 'Escribe tu nombre:',
            labelStyle: AppTheme.lightTheme.textTheme.headlineLarge,
          ),
          onChanged: (text) => name=text,
        );
  }

  Row switchInput(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Text(
          '¿Te gusta Flutter?',
          style: AppTheme.lightTheme.textTheme.headlineLarge,
        ),
        Switch(
          value: switchFlag, 
          onChanged: (value) {
            setState(() {
              switchFlag=value;
            });
          },
          activeTrackColor: AppTheme.primColor,
          activeColor: AppTheme.bgColorLight,
          inactiveThumbColor: AppTheme.primColor,
          inactiveTrackColor: AppTheme.bgColorLight,
        )
      ],
    );
  }

  Column sliderInput(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          '¿Qué tanto te gusta Flutter?',
          style: AppTheme.lightTheme.textTheme.headlineLarge,
        ),
        Slider(
          min:0.0,
          max:10.0,
          divisions: 10,
          value: sliderValue,
          onChanged: (value) {
            setState(() {
              sliderValue=value;
            });
          },
          thumbColor: AppTheme.primColor,
          activeColor: AppTheme.darkPrimColor,
          inactiveColor: const Color.fromARGB(255, 182, 178, 178),
          label: '${sliderValue.round()}',
        ),
      ],
    );  
  }

  // Botón de opciones (deben estar dentro de ListTile para funcionar)
  Column radioInput(){
    return Column(
      children: [
        Text(
          '¿Qué prefieres para desarrollo móvil?',
          style: AppTheme.lightTheme.textTheme.headlineLarge,
        ),
        ListTile(
          title: Text(
            'Kotlin',
            style: AppTheme.lightTheme.textTheme.bodySmall,
          ),
          leading: Transform.scale(
            scale: 1.5,
            child: Radio(
              value: 'Kotlin',
              groupValue: radioSelected,
              onChanged: (value) {
                setState(() {
                  radioSelected=value!;
                });
              },
              activeColor: AppTheme.primColor,
              focusColor: AppTheme.primColor,
              overlayColor: const MaterialStatePropertyAll(Color.fromARGB(111, 175, 140, 128)),
            ),
          ),
        ),
        ListTile(
          title: Text(
            'Flutter',
            style: AppTheme.lightTheme.textTheme.bodySmall,
          ),
          leading: Transform.scale(
            scale:1.5,
            child: Radio(
              value: 'Flutter',
              groupValue: radioSelected,
              onChanged: (value) {
                setState(() {
                  radioSelected=value!;
                });
              },
              activeColor: AppTheme.primColor,
              focusColor: AppTheme.primColor,
              overlayColor: const MaterialStatePropertyAll(Color.fromARGB(111, 175, 140, 128)),
            ),
          ),
        ),
      ],
    );
  }

  Row checkboxInput(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          'Navegador',
          style: AppTheme.lightTheme.textTheme.bodySmall,
        ),
        Transform.scale(
          scale:1.5,
          child: Checkbox(
            value: isChecked[0],
            onChanged: (value) {
              setState(() {
                isChecked[0]=value!;
              });
            },
            activeColor: AppTheme.primColor,
          ),
        ),
        Text(
          'Emulador',
          style: AppTheme.lightTheme.textTheme.bodySmall,
        ),
        Transform.scale(
          scale:1.5,
          child: Checkbox(
            value: isChecked[1],
            onChanged: (value) {
              setState(() {
                isChecked[1]=value!;
              });
            },
            activeColor: AppTheme.primColor,
          ),
        ),
        Text(
          'Celular',
          style: AppTheme.lightTheme.textTheme.bodySmall,
        ),
        Transform.scale(
          scale:1.5,
          child: Checkbox(
            value: isChecked[2],
            onChanged: (value) {
              setState(() {
                isChecked[2]=value!;
              });
            },
            activeColor: AppTheme.primColor,
          ),
        )
      ],
    );
  }
}