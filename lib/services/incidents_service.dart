import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'package:roar/model/incidents_model.dart';

Future<String> _loadIncidentsAsset() async {
  return await rootBundle.loadString('analytics/mock_data_subset.json');
}

Future<Incidents> loadIncidents() async {
  String jsonIncidents = await _loadIncidentsAsset();
  final jsonResponse = json.decode(jsonIncidents);
  Incidents incidentList = new Incidents.fromJson(jsonResponse);
  return incidentList;
}