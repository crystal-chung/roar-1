import 'package:flutter/material.dart';
import 'form.dart';
import 'background.dart';

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
              children: <Widget> [
                BackGround(),
                Padding(
                  padding: EdgeInsets.only(top: 70.0),
                  child: Align(
                      alignment: Alignment.topCenter,
                      child: Title()
                  )
                ),
                Padding(
                    padding: EdgeInsets.only(top: 50.0),
                    child: Align(
                        alignment: Alignment.topCenter,
                        child: ReportForm()
                    )
                )
              ]
        )
    );
  }
}
