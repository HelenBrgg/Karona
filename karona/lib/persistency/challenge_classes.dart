class Challenge {
  final int id;
  final String challengeText;

  Challenge({this.id, this.challengeText});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'challengeText': challengeText,
    };}
	
	factory Challenge.fromMap(Map<String, dynamic> data) => new Challenge(
    id: data["id"],
    challengeText: data["challengeText"],
    );

  // Implement toString to make it easier to see information about
  // each dog when using the print statement.
  @override
  String toString() {
    return 'Dog{id: $id, challengeText: $challengeText}';
  }
}