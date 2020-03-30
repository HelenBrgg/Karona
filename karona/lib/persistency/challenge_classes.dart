class Challenge {
  final int id;
  final String challengeType;
  final String challengeText;

  Challenge({this.id, this.challengeType, this.challengeText});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'challengeType': challengeType,
      'challengeText': challengeText,
    };}
	
	factory Challenge.fromMap(Map<String, dynamic> data) => new Challenge(
    id: int.parse(data["id"]),
    challengeType: data["challengeType"],
    challengeText: data["challengeText"],
    );

  // Implement toString to make it easier to see information about
  // each dog when using the print statement.
  @override
  String toString() {
    return '\"$challengeText\" (challenge id = $id, $challengeType challenge)';
  }
}