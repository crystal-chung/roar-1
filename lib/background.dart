import 'package:flutter/material.dart';


class BackGround extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('images/roar-bg.png'),
                    fit: BoxFit.fill))));
  }
}
