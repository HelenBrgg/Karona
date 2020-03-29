import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter/widgets.dart';


import './network_classes.dart';

class Networks_SQL_Interface
{
  Future<Database> database;
  void Init_SQL_Interface() async
  {
    database = openDatabase(
    // Set the path to the database. Note: Using the `join` function from the
    // `path` package is best practice to ensure the path is correctly
    // constructed for each platform.
    join(await getDatabasesPath(), 'networks_database.db'),
    // When the database is first created, create a table to store dogs.
    onCreate: (db, version) {
      return db.execute(
        "CREATE TABLE networks(id INTEGER PRIMARY KEY, ssid TEXT, name TEXT)",
      );
    },
    // Set the version. This executes the onCreate function and provides a
    // path to perform database upgrades and downgrades.
    version: 1,
  );
  return;
  }

  Future<void> insertNetwork(Network network) async {
    // Get a reference to the database.
    final Database db = await database;

    // Insert the Dog into the correct table. Also specify the
    // `conflictAlgorithm`. In this case, if the same dog is inserted
    // multiple times, it replaces the previous data.
    await db.insert(
      'networks',
      network.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

   Future<List<Network>> networks() async {
    // Get a reference to the database.
    final Database db = await database;

    // Query the table for all The Dogs.
    final List<Map<String, dynamic>> maps = await db.query('networks');

    // Convert the List<Map<String, dynamic> into a List<Dog>.
    return List.generate(maps.length, (i) {
      return Network(
        id: maps[i]['id'],
        ssid: maps[i]['ssid'],
        name: maps[i]['name'],
      );
    });
  }

  Future<void> updateNetwork(Network network) async {
    // Get a reference to the database.
    final db = await database;

    // Update the given Dog.
    await db.update(
      'networks',
      network.toMap(),
      // Ensure that the Dog has a matching id.
      where: "id = ?",
      // Pass the Dog's id as a whereArg to prevent SQL injection.
      whereArgs: [network.id],
    );
  }

   Future<void> deleteNetwork(int id) async {
    // Get a reference to the database.
    final db = await database;

    // Remove the Dog from the database.
    await db.delete(
      'networks',
      // Use a `where` clause to delete a specific dog.
      where: "id = ?",
      // Pass the Dog's id as a whereArg to prevent SQL injection.
      whereArgs: [id],
    );
  }

  Future<Network> getNetworkById(int id) async {
  final db = await database;
  List<Map> results = await db.query('networks',
      where: 'id = ?',
      whereArgs: [id]);

  if (results.length > 0) {
    return new Network.fromMap(results.first);
  }
  }

  Future<Network> getNetworkBySSID(String ssid) async {
  final db = await database;
  List<Map> results = await db.query('networks',
      where: 'ssid = ?',
      whereArgs: [ssid]);

  if (results.length > 0) {
    return new Network.fromMap(results.first);
  }
  return null;
}


}



// exemplary code
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Networks_SQL_Interface networks_sql_interface = new Networks_SQL_Interface();
  await networks_sql_interface.Init_SQL_Interface();


  var network_a = Network(
    id: 0,
    ssid: 'XXDA',
    name: 'homebase'
  );

   var network_b = Network(
    id: 1,
    ssid: 'UUPP',
    name: 'my_neighbours'
  );

  // Insert a dog into the database.
  await networks_sql_interface.insertNetwork(network_a);
  await networks_sql_interface.insertNetwork(network_b);

  print("\nListing all Networks in the sql database:");
  // Print the list of dogs (only Fido for now).
  print(await networks_sql_interface.networks());

  // Update Fido's age and save it to the database.
 network_b = Network(
    id: 1,
    ssid: 'PPID',
    name: 'my_flat'
  );
  await networks_sql_interface.updateNetwork(network_b);

  // Print Fido's updated information.
  print(await networks_sql_interface.networks());

  // query the database for fido's id (0)
  Network query = await networks_sql_interface.getNetworkById(0) ;
  
  print('\nHere\'s the Network with ID = 0:');
  print(query);

  query = await networks_sql_interface.getNetworkBySSID('PPID') ;
  
  print('\nHere\'s the Network with SSID = PPID:');
  print(query);
  
  print("\nDeleting Network:  " + network_b.toString());
  // Delete Fido from the database.
  await networks_sql_interface.deleteNetwork(network_b.id);

  print("\nList of Networks Left:");
  // Print the list of dogs (empty).
  print(await networks_sql_interface.networks());
  
}





