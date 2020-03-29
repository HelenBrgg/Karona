import './notifications/local_notications_interface.dart';
import './persistency/challenge_classes.dart';
import './persistency/challenge_sql_interface.dart';

import 'dart:math';

import 'package:flutter/widgets.dart';

class ChallengeManager
{
  NotificationManagerInterface notificationManagerInterface = new NotificationManagerInterface();
  Challenge_SQL_Interface challengeSqlInterface = new Challenge_SQL_Interface();

  List<Challenge> activeChallenges = List<Challenge>();

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
  
  Future<void> activateRandomChallenge()
  async
  {
    print("\n>>>>>>>>> Activating random challenge.");

    // load all challenges
    List<Challenge> allChallenges = await challengeSqlInterface.challenges();

    print("\nAll challenges = ");
    for(var i=0;i<allChallenges.length;i++){
        print(allChallenges[i]); 
    }

    // find a new, random challenge that is not part of the currently active challenges
    var rng = new Random();
    bool is_new_number = true;
    int random_challenge_id;
    do {
        random_challenge_id = rng.nextInt(allChallenges.length);
        is_new_number = true;
        // iterate over all active challenges and check that the challenge is not already active
        for(var i=0;i<activeChallenges.length;i++){
          if(activeChallenges[i].id == random_challenge_id)
          {
            is_new_number = false;
          }
        }
    } while (is_new_number == false);

    // draw the random challenge with the new, unique id
    Challenge random_challenge = await challengeSqlInterface.getChallengeById(random_challenge_id);
    activeChallenges.add(random_challenge);
    print("\nNew challenge = " + random_challenge.toString());
    print("\nAll active challenges = ");
    for(var i=0;i<activeChallenges.length;i++){
        print(activeChallenges[i]); 
    }
  }

  void deactivateChallenge(Challenge challenge)
  {
    activeChallenges.remove(challenge);
  }
}

void main() async 
{
  WidgetsFlutterBinding.ensureInitialized();
  ChallengeManager chalMan = new ChallengeManager();
  await chalMan.initChallengeManager();
  await chalMan.generatePseudoChallenges();
  await chalMan.activateRandomChallenge();
  await chalMan.activateRandomChallenge();
  await chalMan.activateRandomChallenge();
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