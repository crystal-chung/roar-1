import 'package:flutter/material.dart';
import 'widgets/IncidentList.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;

class UserRoute extends StatelessWidget {

  @override
  Widget build(BuildContext context){
    print("FUCKTHIS");
    String contents = new File('resources/sample_incidents.json').readAsStringSync();
    print(contents);
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
            ListItem(["Name", "Name"]),
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
