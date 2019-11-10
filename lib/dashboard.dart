import 'package:flutter/material.dart';
import 'background.dart';
import 'footer.dart';
import 'title.dart';
import 'report.dart';
import 'authority.dart';
import 'metrics.dart';
import 'login_ranger.dart';

class DashboardReport extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final fullReportButton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Colors.yellow,
      child: MaterialButton(
        minWidth: 325.0,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AuthorityRoute()),
          );
        },
        child: Text("View Full Report",
            textAlign: TextAlign.center,
            style: new TextStyle(
                color: Colors.black,
                fontSize: 20.0
            )
        ),
      )
    );

    return Column(
      children: <Widget>[
        new Container(
          width: 180.0,
          height: 180.0,
          decoration: new BoxDecoration(
            image: DecorationImage(
              image: new AssetImage('images/assets/roar-circle-bg.png'),
            ),
            shape: BoxShape.rectangle,
          ),
        ),
        SizedBox(
          height: 25.0,
        ),
        Text("TOTAL TIPS & REPORTS",
            textAlign: TextAlign.center,
            style: new TextStyle(
                color: Colors.yellow,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
                fontSize: 28.0
            )
        ),
        SizedBox(
          height: 25.0,
        ),
        fullReportButton,
      ],
    );
  }
}

class MapViewFooter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        new Container(
          height: 200.0,
          width: 200.0,
          decoration: new BoxDecoration(
            image: DecorationImage(
              image: new AssetImage('images/assets/roar-map-view.png'),
            ),
            shape: BoxShape.rectangle,
          ),
        ),
        new FlatButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AuthorityRoute()),
            );
          },
          child: new Text(
              'MAP VIEW',
              textAlign: TextAlign.center,
              style: new TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                  fontSize: 30.0
              )
        )
       )
      ],
    );
  }
}

class DashboardRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          BackGround(),
          Padding(
            padding: EdgeInsets.only(top: 200.0),
            child: Align(
              alignment: Alignment.center,
              child: DashboardReport(),
            ),
          ),
          Padding(
              padding: EdgeInsets.only(top: 20.0),
              child: Align(
                  alignment: Alignment.topLeft,
                  child: FlatButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginRangerRounte()),
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
              padding: EdgeInsets.only(top: 70.0),
              child: Align(
                alignment: Alignment.topCenter,
                child: RangerRoarTitle()
              )
            ),

          Padding(
              padding: EdgeInsets.only(top: 150.0),
              child: Align(
                alignment: Alignment.topCenter,
                child: Text(
                    'Ranger Dashboard',
                    textAlign: TextAlign.center,
                    style: new TextStyle(
                        color: Colors.white,
                        fontStyle: FontStyle.italic,
                        fontSize: 17.0
                    )
                )
              )
          ),
          Padding(
            padding: EdgeInsets.only(top: 540.0),
            child: Align(
              alignment: Alignment.topCenter,
              child: MapViewFooter()
            ),
          ),
          Padding(
              padding: EdgeInsets.only(top: 240.0),
              child: Align(
                  alignment: Alignment.topCenter,
                  child: Column(
                      children:<Widget>[
                        Text(
                          855.toString(),
                          style: TextStyle(fontSize: 80),
                        )
                      ]
                  )
              )
          ),
        ],
      )
    );
  }
}
