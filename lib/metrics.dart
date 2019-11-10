import 'dart:async';

import 'package:flutter/material.dart';
import 'background.dart';
import 'title.dart';
import 'report.dart';
import 'moreinfo.dart';
import 'usertype.dart';
import 'package:roar/model/species_model.dart';
import 'package:roar/services/species_service.dart';


class SpeciesDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
//    var series = [
//      new charts.Series(
//        id: 'Clicks',
//        domainFn: (ClicksPerYear clickData, _) => clickData.year,
//        measureFn: (ClicksPerYear clickData, _) => clickData.clicks,
//        colorFn: (ClicksPerYear clickData, _) => clickData.color,
//        data: data,
//      ),
//    ];



    return Column(
      children: <Widget>[
        new Text(
            'TAP TO REPORT',
            textAlign: TextAlign.center,
            style: new TextStyle(
                color: Colors.white,
                fontSize: 40.0
            )
        ),
//        new Container(
//          height: 250.0,
//          width: 250.0,
//          child: FlatButton(
//            onPressed: () {
//              Navigator.push(
//                context,
//                MaterialPageRoute(builder: (context) => ReportRoute()),
//              );
//            },
//            child: Image.asset('images/buttons/roar-btn-report.png'),
//          ),
//        )
      ],
    );
  }
}


class MetricsRoute extends StatefulWidget {
  @override
  _MetricsState createState() => _MetricsState();
}

class _MetricsState extends State<MetricsRoute> {
  bool isLoading = false;

  @override
  void initState() {
    fetchSpecies();
    super.initState();
  }

  void fetchSpecies() async {
    setState(() {
      this.isLoading = true;
    });

    Species speciesList = await loadSpecies();

    if (mounted) {
      setState(() {
        this.isLoading = false;
      });
    }
  }


    @override
    Widget build(BuildContext context) {
      Widget bodyChild;

      if (isLoading) {
        bodyChild = Center(
          child: CircularProgressIndicator(
            value: null,
          ),
        );
      } else {
        bodyChild = Stack(
          children: <Widget>[
            BackGround(),
            Padding(
              padding: EdgeInsets.only(top: 100.0),
              child: Align(
                alignment: Alignment.center,
                child: SpeciesDashboard(),
              ),
            ),
            Padding(
                padding: EdgeInsets.only(top: 70.0),
                child: Align(
                    alignment: Alignment.topCenter,
                    child: RoarTitle()
                )
            ),
          ],
        );
      }

      return Scaffold(
          appBar: AppBar(
            title: Text("Full Report"),
          ),
          body: bodyChild
      );
    }
  }

