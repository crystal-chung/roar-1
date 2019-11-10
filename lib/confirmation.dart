import 'package:flutter/material.dart';
import 'title.dart';
import 'background.dart';
import 'footer.dart';
import 'package:uuid/uuid.dart';
import 'dart:math';

final uuid = new Uuid();
final id = uuid.v1();

Random r = Random.secure();
final money = r.nextInt(20);

class ThankYouBlock extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
        width: 400,
        child: Column(
          children: <Widget>[
          Text(
            'Thank you for your report.\n\n'
            'Your report ID is ' + id + '.\n'
            'You have earned \$' + money.toString() + '.\n\n'
            'To claim your reward link your bank account.',
            style: TextStyle(color: Colors.white, fontStyle: FontStyle.italic),
            textAlign: TextAlign.center,
          )
        ]
      )
    );
  }
}

class ConfirmationImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250.0,
      width: 350.0,
      decoration: new BoxDecoration(
        image: DecorationImage(
          image: new AssetImage('images/assets/roar-dollar-lg.png'),
        ),
        shape: BoxShape.rectangle,
      ),
    );
  }
}

class ConfirmationRoute extends StatelessWidget {

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
                    child: Column(
                      children: <Widget>[
                        RoarTitle(),
                      ],
                    )
                )
            ),
            Padding(
                padding: EdgeInsets.only(top: 180.0),
                child: Align(
                    alignment: Alignment.topCenter,
                    child: Column(
                      children: <Widget>[
                        ConfirmationImage(),
                      ],
                    )
                )
            ),
            Padding(
              padding: EdgeInsets.only(top: 430.0),
              child: Align(
                alignment: Alignment.topCenter,
                child: ThankYouBlock(),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 20.0),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Footer(),
              ),
            ),
            Padding(
                padding: EdgeInsets.only(top: 250.0),
                child: Align(
                    alignment: Alignment.topCenter,
                    child: Column(
                        children:<Widget>[
                          Text(
                            money.toString(),
                            style: TextStyle(fontSize: 80),
                          )
                        ]
                    )
                )
            ),
          ],
        ),

    );
  }
}


