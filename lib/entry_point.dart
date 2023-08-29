import 'dart:math';

import 'package:build_an_animated_app_with_rive_and_flutter_try/Utils/rive_util.dart';
import 'package:build_an_animated_app_with_rive_and_flutter_try/models/rive_assets.dart';
import 'package:build_an_animated_app_with_rive_and_flutter_try/screen/component/bottom_animated_bar.dart';
import 'package:build_an_animated_app_with_rive_and_flutter_try/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:rive/rive.dart';

class Entrypoint extends StatefulWidget {
  const Entrypoint({Key? key}) : super(key: key);

  @override
  State<Entrypoint> createState() => _EntrypointState();
}

class _EntrypointState extends State<Entrypoint> {
  late SMIBool SearchTrigger;
  RiveAsset selectedBottomNav = bottomNav.first;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBody: true,
      body: HomeScreen(),
      bottomNavigationBar: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 24),
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
              color: Colors.black12.withOpacity(.5),
              borderRadius: BorderRadius.all(Radius.circular(24))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ...List.generate(
                  growable: true,
                  bottomNav.length,
                  (index) => GestureDetector(
                        onTap: () {
                          bottomNav[index].input!.change(true);
                          if (bottomNav[index] != selectedBottomNav) {
                            setState(() {
                              selectedBottomNav = bottomNav[index];
                            });
                          }
                          Future.delayed(const Duration(seconds: 1), () {
                            bottomNav[index].input!.change(false);
                          });
                        },
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            AnimContainer(isActive: bottomNav[index]==selectedBottomNav),
                            SizedBox(
                              width: 36,
                              height: 36,
                              /// we can each of them but how
                              /// how to play the animation
                              child: Opacity(
                                opacity: bottomNav[index] == selectedBottomNav
                                    ? 1
                                    : .5,
                                child: RiveAnimation.asset(
                                  bottomNav.first.src,
                                  artboard: bottomNav[index].artboard,
                                  onInit: (artbaoard) {
                                    StateMachineController controller =
                                        RiveUtil.getRiveController(artbaoard,
                                            stateMachinrName:
                                                bottomNav[index].stateMachine);
                                    bottomNav[index].input =
                                        controller.findSMI("active") as SMIBool;
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ))
            ],
          ),
        ),
      ),
    );
  }
}

