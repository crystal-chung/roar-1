import 'package:flutter/material.dart';
import 'form.dart';

class ReportRoute extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget> [
                ReportForm(),
              ]
          )
        )
    );
  }
}
