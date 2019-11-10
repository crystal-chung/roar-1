import 'package:flutter/material.dart';
import 'background.dart';
import 'title.dart';
import 'widgets/CashList.dart';
import 'user.dart';

class CashImage extends StatelessWidget {
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

class TransferButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
        elevation: 5.0,
        borderRadius: BorderRadius.circular(30.0),
        color: Colors.yellow,
        child: MaterialButton(
          minWidth: 325.0,
          padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          onPressed: () {
//            Navigator.push(
//              context,
//              MaterialPageRoute(builder: (context) => UserRoute()),
//            );
          },
          child: Text("Transfer to PayPal Account",
              textAlign: TextAlign.center,
              style: new TextStyle(
                  color: Colors.black,
                  fontSize: 25.0
              )
          ),
        )
    );
  }
}

class ReportHistoryBlock extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget> [
        ListItem(),
      ]
    );
  }
}

class Triple extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Tip(),
        Account(),
        Community()
      ],
    );
  }
}

class Account extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
        children: <Widget>[
          Container(
              height: 100.0,
              width: 100.0,
              child: FlatButton(
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context)=> UserRoute()),
                    );
                  }
              ),
              decoration: new BoxDecoration(
                image: DecorationImage(
                  image: new AssetImage('images/buttons/roar-btn-profile.png'),
                ),
                shape: BoxShape.rectangle,
              )
          ),
          Text(
              'Account',
              textAlign: TextAlign.center,
              style: new TextStyle(
                  color: Colors.white,
                  fontSize: 20.0
              ))
        ]);
  }
}


class CashoutRoute extends StatelessWidget {
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
                  child: Column(
                    children: <Widget>[
                      RoarTitle(),
                    ],
                  )
              )
          ),
          Padding(
              padding: EdgeInsets.only(top: 140.0),
              child: Align(
                  alignment: Alignment.topCenter,
                  child: Column(
                    children: <Widget>[
                      CashImage(),
                    ],
                  )
              )
          ),
          Padding(
              padding: EdgeInsets.only(top: 380.0),
              child: Align(
                  alignment: Alignment.topCenter,
                  child: Column(
                    children: <Widget>[
                      TransferButton(),
                    ],
                  )
              )
          ),
          Padding(
            padding: EdgeInsets.only(left: 40.0),
            child: Wrap (
              runSpacing: -100,
              children: <Widget>[
                SizedBox(
                  height: 15.0,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 470.0),
                  child: ReportHistoryBlock(),
                )
              ]
            )
          ),
          Padding(
              padding: EdgeInsets.only(top: 700.0),
              child: Align(
                  alignment: Alignment.topCenter,
                  child: Column(
                    children: <Widget>[
                      Triple(),
                    ],
                  )
              )
          ),
          Padding(
              padding: EdgeInsets.only(top: 220.0),
              child: Align(
                  alignment: Alignment.topCenter,
                  child: Column(
                      children:<Widget>[
                        Text(
                          '\$17',
                          style: TextStyle(fontSize: 65),
                        )
                      ]
                  )
              )
          ),
        ]
      )
    );
  }
}
