import 'package:flutter/material.dart';
import 'package:practica3/theme/app_theme.dart';

class InputsScreen extends StatefulWidget {
  const InputsScreen({super.key});

  @override
  State<InputsScreen> createState() => _InputsScreenState();
}

class _InputsScreenState extends State<InputsScreen> {
  bool switchFlag=false; // controla el widget switch
  double sliderValue=0.0;
  int radioSelected=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Entradas'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            nameInput(),
            switchInput(),
            sliderInput(),
            radioInput(),
            const ElevatedButton(
              onPressed: null,
              child: Text('Guardar'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Inicio'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.data_exploration),
            label: 'Datos'
          )
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
              value: 1,
              groupValue: radioSelected,
              onChanged: (value) {
                setState(() {
                  radioSelected=value!;
                  print('Botón radio "$value" elegido');
                });
              }
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
              value: 2,
              groupValue: radioSelected,
              onChanged: (value) {
                setState(() {
                  radioSelected=value!;
                  print('Botón radio "$value" elegido');
                });
              },
            ),
          ),
        ),
      ],
    );
  }
}