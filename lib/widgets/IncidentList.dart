import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';


class ListItem extends StatelessWidget {
  var items = [
    {"date": "21 Jan 2019", "type": "Poaching"},
    {"date": "04 Feb 2019", "type": "Dead Animal"},
    {"date": "01 Mar 2019", "type": "Poaching"},
    {"date": "11 Mar 2019", "type": "Illegal Good Sold"},
    {"date": "30 Apr 2019", "type": "Dead Animal"},
    {"date": "04 May 2019", "type": "Trafficking"}

  ];

  Widget _buildProductItem(BuildContext context, int index) {
    return Container(
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(items[index]["date"] + ": ",
              style: TextStyle(color: Colors.yellow,
                  fontSize: 20.0)),
            Text(items[index]["type"],
              style: TextStyle(color: Colors.white,
                  fontSize: 20.0)),
          ],
        )
      );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemBuilder: _buildProductItem,
      itemCount: this.items.length,
    );
  }
}
