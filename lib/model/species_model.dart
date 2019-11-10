class Species {
  final String tiger;
  final String elephant;
  final String gorilla;
  final String pangolin;
  final String rhino;
  final String parrot;
  final String turtle;
  final String other;

  Species({
    this.tiger,
    this.elephant,
    this.gorilla,
    this.pangolin,
    this.rhino,
    this.parrot,
    this.turtle,
    this.other,
  });

  factory Species.fromJson(Map<String, dynamic> parsedJson) {
    return Species(
        tiger: parsedJson['tiger'],
        elephant : parsedJson['elephant'],
        gorilla : parsedJson ['gorilla'],
        pangolin: parsedJson['pangolin'],
        rhino : parsedJson['rhino'],
        parrot : parsedJson ['parrot'],
        turtle: parsedJson['sea turtle'],
        other : parsedJson['other'],
    );
  }
}