import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter/widgets.dart';


import './challenge_classes.dart';

class Challenge_SQL_Interface
{
  Future<Database> database;
  void Init_SQL_Interface() async
  {
    this.database = openDatabase(
    // Set the path to the database. Note: Using the `join` function from the
    // `path` package is best practice to ensure the path is correctly
    // constructed for each platform.
    join(await getDatabasesPath(), 'challenge_database.db'),
    // When the database is first created, create a table to store dogs.
    onCreate: (db, version) {
      return db.execute(
        "CREATE TABLE challenges(id INTEGER PRIMARY KEY, challengeText TEXT)",
      );
    },
    // Set the version. This executes the onCreate function and provides a
    // path to perform database upgrades and downgrades.
    version: 1,
  );
  return;
  }

  Future<void> insertChallenge(Challenge challenge) async {
    // Get a reference to the database.
    final Database db = await database;

    print("##################     Got Database");
    // Insert the Dog into the correct table. Also specify the
    // `conflictAlgorithm`. In this case, if the same dog is inserted
    // multiple times, it replaces the previous data.
    await db.insert(
      'challenges',
      challenge.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    print("#################    Awaited insert");
  }

   Future<List<Challenge>> challenges() async {
    // Get a reference to the database.
    final Database db = await database;

    // Query the table for all The Dogs.
    final List<Map<String, dynamic>> maps = await db.query('challenges');

    // Convert the List<Map<String, dynamic> into a List<Dog>.
    return List.generate(maps.length, (i) {
      return Challenge(
        id: maps[i]['id'],
        challengeText: maps[i]['challengeText'],
      );
    });
  }

  Future<void> updateChallenge(Challenge challenge) async {
    // Get a reference to the database.
    final db = await database;

    // Update the given Dog.
    await db.update(
      'challenges',
      challenge.toMap(),
      // Ensure that the Dog has a matching id.
      where: "id = ?",
      // Pass the Dog's id as a whereArg to prevent SQL injection.
      whereArgs: [challenge.id],
    );
  }

   Future<void> deleteChallenge(int id) async {
    // Get a reference to the database.
    final db = await database;

    // Remove the Dog from the database.
    await db.delete(
      'challenges',
      // Use a `where` clause to delete a specific dog.
      where: "id = ?",
      // Pass the Dog's id as a whereArg to prevent SQL injection.
      whereArgs: [id],
    );
  }

  Future<Challenge> getChallengeById(int id) async {
  final db = await database;
  List<Map> results = await db.query('challenges',
      where: 'id = ?',
      whereArgs: [id]);

  if (results.length > 0) {
    return new Challenge.fromMap(results.first);
  }

  return null;
}


}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  print(" #########       Launching Main");

  Challenge_SQL_Interface db_interface = new Challenge_SQL_Interface();
  await db_interface.Init_SQL_Interface();


  var clg_call_grandma = Challenge(
    id: 0,
    challengeText: 'Call your Grandma!',
  );

  print(" #########       Inserting");
  // Insert a dog into the database.
  await db_interface.insertChallenge(clg_call_grandma);

  print(" #########       Printing List");
  // Print the list of dogs (only Fido for now).
  print(await db_interface.challenges());

  // Update Fido's age and save it to the database.
  clg_call_grandma = Challenge(
    id: 0,
    challengeText: 'Call her NOW!',
  );
  await db_interface.updateChallenge(clg_call_grandma);

  // Print Fido's updated information.
  print(await db_interface.challenges());

  // query the database for fido's id (0)
  Challenge query = await db_interface.getChallengeById(0) ;
  
  print('Here\'s challenge #0:');
  print(query);
  
  // Delete Fido from the database.
  await db_interface.deleteChallenge(clg_call_grandma.id);

  // Print the list of dogs (empty).
  print(await db_interface.challenges());
  
}





