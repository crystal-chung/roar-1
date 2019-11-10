import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:roar/background.dart';
import 'package:roar/login_ranger.dart';
import 'login.dart';
import 'package:roar/user.dart';
import 'title.dart';
import 'welcome.dart';

class UserTypes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Column(
              children: <Widget>[
                new Container(
                  height: 200.0,
                  width: 200.0,
                  child: FlatButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginRoute()),
                      );
                    },
                    child: Image.asset('images/buttons/roar-btn-report.png'),
                  ),
                ),
                new Text(
                    'User',
                    textAlign: TextAlign.center,
                    style: new TextStyle(
                        color: Colors.white,
                        fontSize: 30.0
                    )
                )
              ],
            ),
            Column(
              children: <Widget>[
                new Container(
                  height: 200.0,
                  width: 200.0,
                  child: FlatButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginRangerRounte()),
                      );
                    },
                    child: Image.asset('images/buttons/roar-btn-report.png'),
                  ),
                ),
                new Text(
                    'Ranger',
                    textAlign: TextAlign.center,
                    style: new TextStyle(
                        color: Colors.white,
                        fontSize: 30.0
                    )
                )
              ],
            )
          ]
      )
    );
  }
}

class UserTypeRoute extends StatelessWidget {
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
                          'Home',
                          textAlign: TextAlign.left,
                          style: new TextStyle(
                              color: Colors.white,
                              fontSize: 20.0
                          )
                      )
                  )
              )
          ),
          Padding(
              padding: EdgeInsets.only(top: 250.0),
              child: Align(
                  alignment: Alignment.topCenter,
                  child: UserTypes()
              )
          )
        ],
      )
    );
  }
}