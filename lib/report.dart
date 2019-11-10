import 'package:flutter/material.dart';
import 'form.dart';
import 'background.dart';
import 'welcome.dart';

class Title extends StatelessWidget {
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

class ReportRoute extends StatelessWidget {

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
                    child: Title()
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
            Align(
                alignment: Alignment.bottomCenter,
                child: new Container(
                    width: 400,
                    height: 650,
                    child: Align(
                        child: ReportForm()
                    )
                )
            ),
          ],
        ),
      );
  }
}
