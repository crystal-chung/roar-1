import 'package:flutter/material.dart';
import 'widgets/IncidentList.dart';
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
      appBar: AppBar(
        title: Text("User, bitches."),
      ),
      body: Container(
        child: Column(
          children: <Widget> [
            RaisedButton(
              onPressed: (){
              },
              child: Text('Report Incident')
            ),
            ListItem(),
            RaisedButton(
                onPressed: (){
                },
                child: Text('Community Analytics')
            ),
          ]
        ),
      ),
    );
  }
}
