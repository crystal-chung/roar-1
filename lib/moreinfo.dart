import 'package:flutter/material.dart';
import 'title.dart';
import 'background.dart';
import 'welcome.dart';

class UserMeme extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: new BoxDecoration(
        image: DecorationImage(
          image: new AssetImage('images/user_meme.jpg'),
        ),
        shape: BoxShape.rectangle,
      ),
    );
  }
}

class MoreInfoRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          BackGround(),
          UserMeme(),
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
                              color: Colors.white,
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
