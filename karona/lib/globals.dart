
import './challenge_manager.dart';
import './persistency/challenge_classes.dart';
import "wifi/wifiObserver.dart";

ChallengeManager chalMan;
Stream<List<Challenge>> activeChallengesStream;
WifiObserver wifiObserver;
