import 'package:flutter/material.dart';
import 'widgets/IncidentList.dart';
import 'background.dart';
import 'title.dart';
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
            padding: EdgeInsets.only(top: 120),
            child: Align(
              alignment: Alignment.center,
              child: Container(
                  width: 400,
                  child: Column (
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("Username",
                          style: TextStyle(color: Colors.white, fontStyle: FontStyle.italic, fontSize: 30)
                      ),
                      Text("HACKS4SNACKS",
                          style: TextStyle(color: Colors.yellow, fontSize: 30)
                      )
                    ]
                  )
              ),
            )
        ),
            Padding(
                padding: EdgeInsets.only(),
                child: Align(
                    alignment: Alignment.center,
                    child: Container(
                        width: 400,
                        child:  Wrap (
                            runSpacing: -60,
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text("Report History",
                                    style: TextStyle(color: Colors.yellow, fontWeight: FontWeight.bold, fontSize: 20)
                                )
                              ),
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: ListItem(),
                              )
                            ]
                        )
                    )
                )
            )
          ],
        )
    );
  }
}