import 'package:flutter/material.dart';
import 'report.dart';

class ReportHome extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(child: ConstrainedBox(
        constraints: BoxConstraints.expand(),
        child: FlatButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ReportRoute()),
              );
            },
            padding: EdgeInsets.all(0.0),
            child: Image.asset('images/buttons/roar-btn-report.png'))));
  }
}
