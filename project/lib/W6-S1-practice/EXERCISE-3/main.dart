import 'package:flutter/material.dart';
import 'package:practice/W6-S1-practice/EXERCISE-3/screen/welcome.dart';
import 'package:practice/W6-S1-practice/EXERCISE-3/screen/temperature.dart';

class TemperatureApp extends StatefulWidget {
  const TemperatureApp({super.key});

  @override
  State<TemperatureApp> createState() {
    return _TemperatureAppState();
  }
}

class _TemperatureAppState extends State<TemperatureApp> {
  // Tracks the current screen
  bool isWelcomeScreen = true;

  // Function to switch screens
  void switchScreen() {
    setState(() {
      isWelcomeScreen = !isWelcomeScreen;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
         body: 
         Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xff16C062),
                Color(0xff00BCDC),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: isWelcomeScreen
            ?Welcome(onStartPressed: switchScreen)
            :Temperature(),
    ));
  }
}

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: TemperatureApp(),
  ));
}
