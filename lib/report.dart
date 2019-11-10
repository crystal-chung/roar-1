import 'package:flutter/material.dart';
import 'form.dart';
import 'background.dart';


class ReportRoute extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
              children: <Widget> [
                BackGround(),
                ReportForm(),
              ]
        )
    );
  }
}
