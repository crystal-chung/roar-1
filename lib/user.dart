import 'package:flutter/material.dart';
import 'widgets/IncidentList.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;

class UserRoute extends StatelessWidget {
  final String str = "";

  UserRoute(){
    this.str = await getFile();
  }


  Future<String> getFile() async {
    String fuckall = rootBundle.loadString('resources/sample_incidents.json');
    return fuckall;
  }


  @override
  Widget build(BuildContext context){
    print(this.str);
    print("HFOIAHDF:JHSDF:KHSD:FHS:DFHSO:DHFOS:DHF:SHDF");
    var value = await getFile();
    print(value);
//    value.then((val) {
//      print(val);
//    });
//
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
