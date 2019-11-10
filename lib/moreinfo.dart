import 'package:flutter/material.dart';
import 'title.dart';
import 'background.dart';
import 'welcome.dart';

class MoreInfoRoute extends StatelessWidget {
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
          UserLogin(),
          Padding(
              padding: EdgeInsets.only(top: 20.0),
              child: Align(
                  alignment: Alignment.topLeft,
                  child: FlatButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => WelcomePage()),
                        );
                      },
                      child: new Text(
                          '< Back',
                          textAlign: TextAlign.left,
                          style: new TextStyle(
                              color: Colors.black,
                              fontSize: 20.0
                          )
                      )
                  )
              )
          ),
        ]
      )
    );
  }
}
