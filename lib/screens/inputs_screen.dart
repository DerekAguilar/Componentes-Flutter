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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Entradas'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            'Entradas',
            style: AppTheme.lightTheme.textTheme.headlineLarge
          ),
          nameInput(),
          switchInput(),
          sliderInput(),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: null,
                child: Text('Regresar'),
              ),
              ElevatedButton(
                onPressed: null,
                child: Text('Ventana de datos'),
              ),
            ],
          )
        ],
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
}