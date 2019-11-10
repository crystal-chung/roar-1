import 'package:flutter/material.dart';
import 'report.dart';
import 'background.dart';
import 'login.dart';
import 'signup.dart';
import 'moreinfo.dart';
import 'title.dart';

class ReportHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        new Text(
            'TAP TO REPORT',
            textAlign: TextAlign.center,
            style: new TextStyle(
                color: Colors.white,
                fontSize: 40.0
            )
        ),
        new Container(
          height: 250.0,
          width: 250.0,
          child: FlatButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ReportRoute()),
              );
            },
            child: Image.asset('images/buttons/roar-btn-report.png'),
          ),
        )
      ],
    );
  }
}

class NavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new FlatButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginRoute()),
              );
            },
            child: new Text(
                'Log In',
                style: new TextStyle(color: Colors.white),
            ),
          ),
          new Text(
              ' | ',
              style: new TextStyle(color: Colors.white)
          ),
          new FlatButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SignUpRoute()),
              );
            },
            child: new Text(
              'Sign Up',
              style: new TextStyle(color: Colors.white),
            ),
          ),
          new Text(
              ' | ',
              style: new TextStyle(color: Colors.white)
          ),
          new FlatButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MoreInfoRoute()),
              );
            },
            child: new Text(
              'More Info',
              style: new TextStyle(color: Colors.white),
            ),
          )
        ],
      )
    );
  }
}

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          BackGround(),
          Padding(
            padding: EdgeInsets.only(top: 250.0),
            child: Align(
              alignment: Alignment.center,
              child: ReportHome(),
            ),
          ),
          Padding(
              padding: EdgeInsets.only(top: 70.0),
              child: Align(
                alignment: Alignment.topCenter,
                child: RoarTitle()
              )
            ),
          Padding(
            padding: EdgeInsets.only(bottom: 20.0),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: NavBar(),
            ),
          )
        ],
      )
    );
  }
}
