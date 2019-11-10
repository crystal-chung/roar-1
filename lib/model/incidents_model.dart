class Incidents {
  final String username;
  final String community;

  Incidents({
    this.username,
    this.community
  });

  factory Incidents.fromJson(Map<String, dynamic> parsedJson) {
//    var streetsFromJson  = parsedJson['username'];
//    //print(streetsFromJson.runtimeType);
//    // List<String> streetsList = new List<String>.from(streetsFromJson);
//    List<String> streetsList = streetsFromJson.cast<String>();

    return new Incidents(
      username:  parsedJson['user_name'],
      community:  parsedJson['community'],
    );
  }

}