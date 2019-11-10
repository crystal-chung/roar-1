import 'package:flutter/material.dart';
import 'widgets/IncidentList.dart';
import 'background.dart';
import 'title.dart';
import 'login.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;

class UserRoute extends StatelessWidget {


//  Future<String> getFileData(String path) async{
//    var file = new File('../resources/sample_incidents.json');
//    print(file);
//    var contents;
//
////    if (await file.exists())
////    {
////    // Read file
//    contents = await file.readAsString();
//    print("in getFileData");
//    print(contents);
////    }
////    else {
////      print("FILE DID NOT EXIST");
////    }
//  }
//
//  String getStuff() {
//    getFileData('resources/sample_incidents.json').then((s){
//      return s;
//    }
//    );
//  }


  @override
  Widget build(BuildContext context) {

//    String content_TEST = new File('resources/sample_incidents.json').readAsStringSync();
//    print(content_TEST);
//    print("FUCKTHIS");
//    String contents = getStuff();
//    print(contents);
    return Scaffold(
        body: Stack(
          children: <Widget>[
            BackGround(),
            Padding(
              padding: EdgeInsets.only(top: 70.0),
              child: Align(
                  alignment: Alignment.topCenter,
                  child: YourRoar()
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
                            MaterialPageRoute(builder: (context) => LoginRoute()),
                          );
                        },
                        child: new Text(
                            'Log out',
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
            padding: EdgeInsets.only(top: 165),
            child: Align(
              alignment: Alignment.center,
              child: Container(
                  width: 400,
                  child: Column (
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("Username",
                          style: TextStyle(color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic,
                              fontSize: 17)
                      ),
                      Text("HACKS4SNACKS",
                          style: TextStyle(color: Colors.yellow,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic,
                              fontSize: 35)
                      ),
                      Wrap (
                          runSpacing: -60,
                          children: <Widget>[
                            Padding(
                                padding: EdgeInsets.only(top: 13.0),
                                child: Text("Report History",
                                    style: TextStyle(color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FontStyle.italic,
                                        fontSize: 17)
                                )
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 15.0),
                              child: ListItem(),
                            )
                          ]
                      )
                    ]
                  )
              ),
            )
        ),
            Padding(
              padding: EdgeInsets.only(top: 575.0),
              child: Align(
                  alignment: Alignment.topCenter,
                  child: Triple()
              ),
            )
          ],
        )
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
        Balance(),
        Community()
      ],
    );
  }
}

class Tip extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 100.0,
          width: 100.0,
          decoration: new BoxDecoration(
            image: DecorationImage(
              image: new AssetImage('images/buttons/roar-btn-report.png'),
            ),
            shape: BoxShape.rectangle,
          ),
        ),
        Text(
            'Send a Tip',
            textAlign: TextAlign.center,
            style: new TextStyle(
                color: Colors.white,
                fontSize: 20.0
            ))
        ]);
  }
}

class Balance extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
        children: <Widget>[
          Container(
            height: 100.0,
            width: 100.0,
            decoration: new BoxDecoration(
              image: DecorationImage(
                image: new AssetImage('images/buttons/roar-btn-cash.png'),
              ),
              shape: BoxShape.rectangle,
            ),
          ),
          Text(
              'Balance',
              textAlign: TextAlign.center,
              style: new TextStyle(
                  color: Colors.white,
                  fontSize: 20.0
              ))
        ]);
  }
}

class Community extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
        children: <Widget>[
          Container(
            height: 100.0,
            width: 100.0,
            decoration: new BoxDecoration(
              image: DecorationImage(
                image: new AssetImage('images/buttons/roar-btn-community.png'),
              ),
              shape: BoxShape.rectangle,
            ),
          ),
          Text(
              'Community',
              textAlign: TextAlign.center,
              style: new TextStyle(
                  color: Colors.white,
                  fontSize: 20.0
              ))
        ]);
  }
}