import 'package:build_an_animated_app_with_rive_and_flutter_try/screen/component/sign_in_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


Future<Object?> customSignDailog(BuildContext context, {required ValueChanged  onClosed}) {
  return showGeneralDialog(
    transitionDuration: Duration(milliseconds: 500),
    barrierDismissible: true,
    barrierLabel: "Sign In",
    transitionBuilder: (_, animation, __, child) {
      Tween<Offset> tween;
      tween = Tween(begin: Offset(0, -1), end: Offset.zero);
      return SlideTransition(
        position: tween.animate(
          CurvedAnimation(parent: animation, curve: Curves.easeInOut),
        ),
        child: child,
      );
    },
    context: context,
    pageBuilder: (context, _, __) => Center(
      child: Container(
        height: 650,
        margin: EdgeInsets.symmetric(horizontal: 6),
        padding: EdgeInsets.symmetric(vertical: 32, horizontal: 24),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(.94),
          borderRadius: BorderRadius.all(
            Radius.circular(40),
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Stack(
            clipBehavior: Clip.none,
            children: [
              Column(
                //  mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Sign in ",
                    style: TextStyle(fontFamily: "Poppins", fontSize: 30),
                  ),
                  const Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Text(
                      "Access to 240+ hours of content. Learn design and code, by building real apps with Flutter and Swift.",
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SignInForm(),
                  Row(
                    children: [
                      Expanded(
                        child: Divider(
                          height: 2,
                          color: Color(0xFFFE0073),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8.0,
                        ),
                        child: Text(
                          "OR",
                          style:
                          TextStyle(fontSize: 16, color: Colors.black26),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          height: 2,
                          color: Color(0xFFFE0073),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Text(
                      "Sign up with Email,Apple or Google ",
                      style: TextStyle(color: Colors.black54),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        padding: EdgeInsets.zero,
                        onPressed: () {},
                        icon: SvgPicture.asset(
                          "assets/icons/email_box.svg",
                          width: 64,
                          height: 64,
                        ),
                      ),
                      IconButton(
                        padding: EdgeInsets.zero,
                        onPressed: () {},
                        icon: SvgPicture.asset(
                          "assets/icons/apple_box.svg",
                          width: 64,
                          height: 64,
                        ),
                      ),
                      IconButton(
                        padding: EdgeInsets.zero,
                        onPressed: () {},
                        icon: SvgPicture.asset(
                          "assets/icons/google_box.svg",
                          width: 64,
                          height: 64,
                        ),
                      ),
                    ],
                  )
                ],
              ),
              Positioned(
                  right: 0,
                  left: 0,
                  bottom: -48,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.close,
                      color: Colors.black,
                    ),
                  ))
            ],
          ),
        ),
      ),
    ),
  ).then(onClosed);
}

