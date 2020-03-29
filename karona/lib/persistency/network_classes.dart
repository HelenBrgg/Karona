class Network {
  final int id;
  final String ssid;
  final String name;

  Network({this.id, this.ssid, this.name});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'ssid': ssid,
      'name':name,
    };}
	
	factory Network.fromMap(Map<String, dynamic> data) => new Network(
    id: data["id"],
    ssid: data["ssid"],
    name: data["name"],
    );

  // Implement toString to make it easier to see information about
  // each dog when using the print statement.
  @override
  String toString() {
    return 'Network{id: $id, ssid: $ssid, name: $name}';
  }
}