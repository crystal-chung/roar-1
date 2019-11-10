import 'package:flutter/material.dart';
import 'welcome.dart';

void main() => runApp(RoarApp());

class RoarApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Roar',
      theme: ThemeData(
        fontFamily: 'IBMPlexSans'
      ),
      home: WelcomePage(),
    );
  }
}
