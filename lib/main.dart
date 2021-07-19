import 'package:flutter/material.dart';
import 'package:submission_flutter_pemula/screen/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tempat Wisata Sukabumi',
      home: SplashScreenHome(),
    );
  }
}