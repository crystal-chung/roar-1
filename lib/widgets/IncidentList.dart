import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';


class ListItem extends StatelessWidget {
  final List<String> items;
  ListItem(this.items);

  Widget _buildProductItem(BuildContext context, int index) {
    return Card(
      child: Column(
        children: <Widget>[
          Text("hi"),
          Text(items[index])
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    print(this.items.length);
    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemBuilder: _buildProductItem,
      itemCount: this.items.length,
    );
  }
}
