import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'package:roar/model/incidents_model.dart';

Future<String> _loadIncidentsAsset() async {
  return await rootBundle.loadString('assets/sample_incidents.json');
}

Future loadIncidents() async {
  String jsonIncidents = await _loadIncidentsAsset();
  final jsonResponse = json.decode(jsonIncidents);
  Incidents incidents = new Incidents.fromJson(jsonResponse);
  print("printing username");
  print(incidents.username);
}