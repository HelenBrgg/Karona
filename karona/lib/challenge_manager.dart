import './notifications/local_notications_interface.dart';
import './persistency/challenge_classes.dart';
import './persistency/challenge_sql_interface.dart';

import 'dart:math';

import 'package:flutter/widgets.dart';
import './persistency/challenge_classes.dart';
import 'package:connectivity/connectivity.dart'; 

import 'dart:async';


class ChallengeManager
{
  NotificationManagerInterface notificationManagerInterface = new NotificationManagerInterface();
  Challenge_SQL_Interface challengeSqlInterface = new Challenge_SQL_Interface();

  List<Challenge> activeChallenges = List<Challenge>();
  List<Challenge> allChallenges = List<Challenge>();

  final StreamController<List<Challenge>> _streamControllerActiveChallenges = new StreamController<List<Challenge>>.broadcast();
  Stream<List<Challenge>> _streamActiveChallenges;

  final Connectivity _connectivity = Connectivity();


  ChallengeManager(){
     _streamActiveChallenges = _streamControllerActiveChallenges.stream;
    }

  Stream<List<Challenge>> getStreamActiveChallenges()
  {
    return _streamActiveChallenges;
  }

  Future<void> initChallengeManager() async
  {
    await notificationManagerInterface.init_notification_functionality();
    await challengeSqlInterface.Init_SQL_Interface();
  }

  Future<void> generatePseudoChallenges()
  async
  {
    var clg_call_grandma = Challenge(
    id: 0,
    challengeText: 'Call your Grandma!',
    );

    var clg_call_grandpa = Challenge(
    id: 1,
    challengeText: 'Call your Grandpa!',
    );

    var clg_call_mother = Challenge(
    id: 2,
    challengeText: 'Call your Mother!',
    );   

    var clg_call_father = Challenge(
    id: 3,
    challengeText: 'Call your Father!',
    );  

    var clg_go_to_bathroom = Challenge(
    id: 4,
    challengeText: 'Jump to the Bathroom! (*assuming you have one. In case of a missing bathroom: Go get a bathroom.)',
    );  

    await challengeSqlInterface.insertChallenge(clg_call_grandma);
    await challengeSqlInterface.insertChallenge(clg_call_grandpa);
    await challengeSqlInterface.insertChallenge(clg_call_mother);
    await challengeSqlInterface.insertChallenge(clg_call_father);
    await challengeSqlInterface.insertChallenge(clg_go_to_bathroom);
  }
  
  Future<void> activateRandomChallenge(String type)
  async
  {
    print("\n>>>>>>>>> Activating random challenge.");

    List<String> challengeTypes = await challengeSqlInterface.challengeTypes();
    List<Challenge> allFittingChallenges = [];
    List<Challenge> allFittingActiveChallenges = [];
    if (challengeTypes.contains(type))
    {
        var intermedAllFittingChallenges= await challengeSqlInterface.challenges();
        var intermedAllFittingActiveChallenges = activeChallenges;

        var intA = intermedAllFittingChallenges.where((element) => element.challengeType == type);
        allFittingChallenges = new List<Challenge>.from(intA);
        var intB = intermedAllFittingActiveChallenges.where((element) => element.challengeType == type);
        allFittingActiveChallenges =  new List<Challenge>.from(intB);

        print("\nBuilt fitting lists");
    }
    else
    {
        allFittingChallenges= await challengeSqlInterface.challenges();
        allFittingActiveChallenges = activeChallenges;
    }



    print("\nAll fitting challenges = ");
    for(var i=0;i<allFittingChallenges.length;i++){
        print(allFittingChallenges[i]); 
    }

    // generate a new challenge only if there are non-active challenges left
    if(allFittingActiveChallenges.length<allFittingChallenges.length)
    {
    // find a new, random challenge that is not part of the currently active challenges
    var rng = new Random();
    bool is_new_number = true;
    int random_challenge_index;
    Challenge randomChallenge;
    do {
        is_new_number = true;

        //draw a new, random challenge
        random_challenge_index = rng.nextInt(allFittingChallenges.length);
        randomChallenge = allFittingChallenges[random_challenge_index];
        
        // iterate over all active challenges and check that the challenge is not already active
        if(allFittingActiveChallenges.contains(randomChallenge))
        {
          is_new_number = false;
        }
    } while (is_new_number == false);

    // add the new challenge to the active challenges
    activeChallenges.add(randomChallenge);
    print("\nNew challenge = " + randomChallenge.toString());
    print("\nAll active challenges = ");
    for(var i=0;i<activeChallenges.length;i++){
        print(activeChallenges[i]); 
    }
    }
    else
    {
      print("\n### All available challenges are already active!");
    }

    _streamControllerActiveChallenges.add(activeChallenges);
  }

  void deactivateChallenge(Challenge challenge)
  {
    activeChallenges.remove(challenge);
    _streamControllerActiveChallenges.add(activeChallenges);
  }

  void activateChallenge(Challenge challenge)
  {
    activeChallenges.add(challenge);
    _streamControllerActiveChallenges.add(activeChallenges);
  }
}

void main() async 
{
  WidgetsFlutterBinding.ensureInitialized();
  ChallengeManager chalMan = new ChallengeManager();
  await chalMan.initChallengeManager();
  await chalMan.generatePseudoChallenges();
  await chalMan.activateRandomChallenge("none");
  await chalMan.activateRandomChallenge("none");
  await chalMan.activateRandomChallenge("none");
  List <Challenge> active_challenges_for_Helen = chalMan.activeChallenges;

  print("\nAll active challenges for Helen = ");
  for(var i=0;i<active_challenges_for_Helen.length;i++){
      print(active_challenges_for_Helen[i]); 
  }

  // get 2nd challenge
  Challenge challengeToRemove = active_challenges_for_Helen[1];
  print("\nRemoving Challenge " + challengeToRemove.toString());
  chalMan.deactivateChallenge(challengeToRemove);
  
  print("\nAll active challenges for Helen (post removal) = ");
  for(var i=0;i<active_challenges_for_Helen.length;i++){
      print(active_challenges_for_Helen[i]); 
  }

  }