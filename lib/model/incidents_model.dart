class Incidents {
  final List<Incident> incidents;

  Incidents({this.incidents});

  factory Incidents.fromJson(List<dynamic> parsedJson) {
    List<Incident> incidentLists = parsedJson.map((i) => Incident.fromJson(i)).toList();

    return new Incidents(
      incidents: incidentLists
    );
  }
}

class Incident {
  final String id;
  final String user;
  final double latitude;
  final double longitude;
  final String species;
  final String action;
  final String severity;
  final String status;
  final String timestamp;

  Incident({
    this.id,
    this.user,
    this.latitude,
    this.longitude,
    this.species,
    this.action,
    this.severity,
    this.status,
    this.timestamp
  });

  factory Incident.fromJson(Map<String, dynamic> json) {
    return new Incident(
      id: json['incident'].toString(),
      user: json['user'].toString(),
      latitude: json['loc_lat'],
      longitude: json['loc_long'],
      species: json['species'],
      action: json['action'],
      severity: json['severity'],
      status: json['status'],
      timestamp: json['timestamp']
    );
  }
}