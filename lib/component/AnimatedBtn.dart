import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
class AnimatedBtn extends StatelessWidget {
  const AnimatedBtn({
    super.key,
    required RiveAnimationController btnController, required this.press,
  }) : _btnController = btnController;

  final RiveAnimationController _btnController;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: SizedBox(
          width: 260,
          height: 64,
          child: Stack(
            children: [
              RiveAnimation.asset(
                "assets/RiveAssets/button.riv",
                controllers: [_btnController],
              ),
              Positioned.fill(
                  top: 8,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const[
                      Icon(CupertinoIcons.arrow_right),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        "Start the course",
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ],
                  ))
            ],
          )),
    );
  }
}
