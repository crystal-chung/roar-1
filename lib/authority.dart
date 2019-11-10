import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:roar/services/incidents_service.dart';
import 'package:roar/model/incidents_model.dart';

class AuthorityRoute extends StatefulWidget {
  @override
  _MapState createState() => _MapState();
}


class _MapState extends State<AuthorityRoute> {
  GoogleMapController mapController;
  List<Marker> allMarkers = [];
  bool isLoading = false;
  final LatLng _center = const LatLng(27.794011624164927, -104.11718075676261);

  @override
  void initState() {
    fetchIncidents();
    super.initState();
  }

  void fetchIncidents() async {
    setState(() {
      this.isLoading = true;
    });

    Incidents incidentList = await loadIncidents();

    if(mounted) {
      setState(() {
        this.isLoading = false;
        if(incidentList.incidents.length > 0) {
          for (var incident in incidentList.incidents) {
            final Marker marker = Marker(
                markerId: MarkerId(incident.user),
                draggable: false,
//                onTap:() {
//                  print("hello world");
//                },
                position: LatLng(incident.latitude, incident.longitude),
                icon: BitmapDescriptor.fromAsset('images/assets/roar-map-marker.png',),
                infoWindow: InfoWindow(
                  title: "Species: " + incident.species,
                  snippet: "Severity: " + incident.severity,
                )
            );
            print(marker);
            allMarkers.add(marker);
          }
        }
      });
    }
  }

  void _onMapCreated(GoogleMapController controller) {
    setState(() {
      mapController = controller;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget bodyChild;
    String title;

    if (isLoading) {
      title = "Loading";
      bodyChild = Center(
        child: CircularProgressIndicator(
          value: null,
        ),
      );
    } else {
      bodyChild = GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: _center,
          zoom: 5.0,
        ),
        markers: Set.from(allMarkers),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Map View"),
      ),
        body: bodyChild
    );
  }
}
