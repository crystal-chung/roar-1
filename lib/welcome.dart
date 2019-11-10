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
    return Container(
        child: ConstrainedBox(
            constraints: BoxConstraints.expand(),
            child: FlatButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ReportRoute()),
                  );
                },
                padding: EdgeInsets.all(0.0),
                child: Image.asset('images/buttons/roar-btn-report.png'))));
  }
}

class Title extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: new BoxDecoration(
        image: DecorationImage(
          image: new AssetImage('images/roar-logo-rev.png'),
        ),
        shape: BoxShape.rectangle,
      ),
      alignment: FractionalOffset(1.0, 0.0),
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
          ReportHome(),
          Title()
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          children: <Widget>[
            RaisedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AuthorityRoute()),
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
