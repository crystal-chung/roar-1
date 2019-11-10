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


class RangerLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      //height: 200.0,
      //width: 250.0,
      decoration: new BoxDecoration(
        image: DecorationImage(
          image: new AssetImage('images/ranger_meme.jpg'),
          fit: BoxFit.fill),
        shape: BoxShape.rectangle,
      ),
    );
  }
}


class UserLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('images/user_meme.jpg'),
                    fit: BoxFit.fill))));
  }
}

