import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'package:roar/model/species_model.dart';

Future<String> _loadSpeciesAsset() async {
  return await rootBundle.loadString('analytics/species.json');
}

Future<Species> loadSpecies() async {
  String jsonSpecies = await _loadSpeciesAsset();
  final jsonResponse = json.decode(jsonSpecies);
  Species speciesList = new Species.fromJson(jsonResponse);
  return speciesList;
}