import 'package:flutter/material.dart';
import 'signup.dart';
import 'moreinfo.dart';
import 'usertype.dart';

class Footer extends StatelessWidget {
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
                  MaterialPageRoute(builder: (context) => UserTypeRoute()),
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
