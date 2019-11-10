import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:roar/services/incidents_service.dart';

class AuthorityRoute extends StatefulWidget {
  @override
  _MapState createState() => _MapState();
}


class _MapState extends State<AuthorityRoute> {
  GoogleMapController mapController;
  List<Marker> allMarkers = [];

  final LatLng _center = const LatLng(47.10110364304358, -102.3323937129871);

  @override
  void initState() {
    super.initState();
    final Marker marker = Marker(
      markerId: MarkerId('firstMarker'),
      draggable: false,
      onTap: () {
        print("hello world");
      },
      position: LatLng(47.10110364304358, -102.3323937129871),
      infoWindow: InfoWindow(
        title: "Title",
        snippet: "Content",
      ),
    );

    print("printing marker");
    print(marker);
    allMarkers.add(marker);
  }


  void _onMapCreated(GoogleMapController controller) {

    setState(() {
      mapController = controller;
    });
  }

  @override
  Widget build(BuildContext context) {
    loadIncidents();
    return Scaffold(
      appBar: AppBar(
        title: Text("Tip Metrics"),
      ),
        body: Column(
          children: <Widget> [
            Container(
              child: SizedBox(
                height: 200.0,
                child: GoogleMap(
                  onMapCreated: _onMapCreated,
                  initialCameraPosition: CameraPosition(
                    target: LatLng(47.10110364304358, -102.3323937129871),
                    zoom: 11.0,
                  ),
                  markers: Set.from(allMarkers),
                )
              )
            )
          ]
        )
    );
  }
}
