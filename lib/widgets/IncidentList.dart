import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';


class ListItem extends StatelessWidget {
  var items = [{"date": "1", "type": "bad"}, {"date": "3", "type": "good"}];

  Widget _buildProductItem(BuildContext context, int index) {
    print("INDEX");
    print(index);
    return Card(
      child: Row(
        children: <Widget>[
          Text(items[index]["date"]),
          Text(items[index]["type"])
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    print("ITEM LENGTH");
    print(this.items.length);
    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemBuilder: _buildProductItem,
      itemCount: this.items.length,
    );
  }
}
