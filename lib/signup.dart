import 'package:flutter/material.dart';
import 'title.dart';
import 'background.dart';

//class SignUpRoute extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        title: Text("Login, bitches."),
//      ),
//      body: Center(
//        child: RaisedButton(
//          onPressed: () {
//            Navigator.pop(context);
//          },
//          child: Text('Home'),
//        ),
//      ),
//    );
//  }
//}





class SignUpRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          BackGround(),
          Padding(
              padding: EdgeInsets.only(top: 70.0),
              child: Align(
                  alignment: Alignment.topCenter,
                  child: RoarTitle()
              )
          ),
          RangerLogin()
        ]
      )
    );
  }
}


