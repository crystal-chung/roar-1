import 'package:flutter/material.dart';
import 'user.dart';
import 'authority.dart';
import 'community.dart';
import 'report.dart';

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

class ReportHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        new Text(
            'TAP TO REPORT',
            textAlign: TextAlign.center,
            style: new TextStyle(
                fontFamily: 'IBMPlexSans',
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

class Title extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.0,
      width: 250.0,
      decoration: new BoxDecoration(
        image: DecorationImage(
          image: new AssetImage('images/roar-logo-rev.png'),
        ),
        shape: BoxShape.rectangle,
      ),
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
              padding: EdgeInsets.only(top: 20.0),
              child: Align(
                alignment: Alignment.topCenter,
                child: Title()
              )
            )
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          children: <Widget>[
            RaisedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ReportRoute()),
                );
              },
              child: Text('Report'),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AuthorityRoute()),
                );
              },
              child: Text('Authority'),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => UserRoute()),
                );
              },
              child: Text('User'),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CommunityRoute()),
                );
              },
              child: Text('Community'),
            )
          ],
        ),
      ),
    );
  }
}
