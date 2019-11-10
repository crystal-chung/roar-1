import 'package:flutter/material.dart';

class RoarTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.0,
      width: 250.0,
      decoration: new BoxDecoration(
        image: DecorationImage(
          image: new AssetImage('images/roar-logo-white.png'),
        ),
        shape: BoxShape.rectangle,
      ),
    );
  }
}

class YourRoar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.0,
      width: 250.0,
      decoration: new BoxDecoration(
        image: DecorationImage(
          image: new AssetImage('images/headings/your-roars.png'),
        ),
        shape: BoxShape.rectangle,
      ),
    );
  }
}
