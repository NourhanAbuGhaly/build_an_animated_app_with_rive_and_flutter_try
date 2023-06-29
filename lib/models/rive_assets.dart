
import 'package:rive/rive.dart';

class RiveAsset {
  final String artboard, stateMachine, title, src;
  late SMIBool? input;

  RiveAsset(
      {required this.artboard,
        required this.stateMachine,
        required this.title,
        required this.src});

  set setInput(SMIBool state) {
    input = state;
  }
}

List<RiveAsset> bottomNav = [
  RiveAsset(
    artboard: "CHAT",
    stateMachine: "CHAT_Interactivity",
    title: "Chat",
    src: "assets/RiveAssets/icons.riv",
  ),
  RiveAsset(
    artboard: "SEARCH",
    stateMachine: "SEARCH_Interactivity",
    title: "Search",
    src: "assets/RiveAssets/icons.riv",
  ),
  RiveAsset(
    artboard: "TIMER",
    stateMachine: "TIMER_Interactivity",
    title: "Timer",
    src: "assets/RiveAssets/icons.riv",
  ),
  RiveAsset(
    artboard: "BELL",
    stateMachine: "BELL_Interactivity",
    title: "Notification",
    src: "assets/RiveAssets/icons.riv",
  ),
  RiveAsset(
    artboard: "USER",
    stateMachine: "USER_Interactivity",
    title: "Profile",
    src: "assets/RiveAssets/icons.riv",
  ),
];
