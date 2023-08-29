import 'dart:ui';

import 'package:build_an_animated_app_with_rive_and_flutter_try/screen/component/AnimatedBtn.dart';
import 'package:build_an_animated_app_with_rive_and_flutter_try/screen/component/custom_sign_in_dailog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  bool isSignDialogShown = false;
  late RiveAnimationController _btnController;

  @override
  void initState() {
    _btnController = OneShotAnimation("active", autoplay: false);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            width: MediaQuery
                .of(context)
                .size
                .width * 1.7,
            // height: 100,
            bottom: 100,
            left: 100,
            child: Image.asset("assets/Backgrounds/Spline.png"),
          ),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 20, sigmaY: 10),
              //   child: SizedBox(),
            ),
          ),
          const RiveAnimation.asset("assets/RiveAssets/shapes.riv"),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
              child: SizedBox(),
            ),
          ),
          AnimatedPositioned(
            top: isSignDialogShown ? -50 : 0,
            duration: Duration(milliseconds: 350),
            height: MediaQuery
                .of(context)
                .size
                .height,
            width: MediaQuery
                .of(context)
                .size
                .width,
            child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Spacer(),
                      SizedBox(
                        width: 260,
                        child: Column(
                          children: const [
                            Text(
                              "Leran design & code",
                              style: TextStyle(
                                  fontSize: 60,
                                  fontFamily: "Poppins",
                                  height: 1.2),
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            Text(
                              "Don’t skip design. Learn design and code, by building real apps with Flutter and Swift. Complete courses about the best tools.",
                            )
                          ],
                        ),
                      ),
                      Spacer(
                        flex: 2,
                      ),
                      // lets add animated button
                      AnimatedBtn(
                        btnController: _btnController,
                        press: () {
                          _btnController.isActive = true;
                          Future.delayed(Duration(milliseconds: 800), () {
                            setState(() {
                              isSignDialogShown = true;
                            });

                            customSignDailog(context, onClosed: (_) {
                              setState(() {
                                isSignDialogShown = false;
                              });
                            });
                          });
                        },
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 24),
                        child: Text(
                            "Purchase includes access to 30+ courses, 240+ premium tutorials, 120+ hours of videos, source files and certificates."),
                      ),
                    ],
                  ),
                ),
            ),
          )
        ],
      ),
    );
  }
}