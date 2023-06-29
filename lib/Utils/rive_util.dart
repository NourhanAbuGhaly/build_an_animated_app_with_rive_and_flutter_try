import 'package:rive/rive.dart';

class RiveUtil {
  static StateMachineController getRiveController(Artboard artboard,
      {stateMachinrName = "State Machine 1"}) {
    StateMachineController? controller =
        StateMachineController.fromArtboard(artboard, stateMachinrName);
    artboard.addController(controller!);
    return controller;
  }
}
