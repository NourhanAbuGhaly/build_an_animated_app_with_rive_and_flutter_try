// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:rive/rive.dart';
//
// class SignInForm extends StatefulWidget {
//   const SignInForm({
//     super.key,
//   });
//
//   @override
//   State<SignInForm> createState() => _SignInFormState();
// }
//
// class _SignInFormState extends State<SignInForm> {
//   GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//   bool isShowLoading = false;
//   bool isSConfftt = false;
//
//   late SMITrigger check;
//   late SMITrigger error;
//   late SMITrigger reset;
//   late SMITrigger confftii;
//
//   StateMachineController getRiveController(Artboard artboard) {
//     StateMachineController? controller =
//         StateMachineController.fromArtboard(artboard, "State Machine 1");
//     artboard.addController(controller!);
//     return controller;
//   }
//
//   void signIn(BuildContext context) {
//     setState(() {
//       isSConfftt = true;
//       isShowLoading = true;
//     });
//     Future.delayed(Duration(seconds: 2), () {
//       if (_formKey.currentState!.validate()) {
//         check.fire();
//         Future.delayed(Duration(seconds: 2), () {
//           setState(() {
//             isShowLoading = false;
//           });
//
//           confftii.fire();
//         });
//       } else {
//         error.fire();
//         Future.delayed(Duration(seconds: 3), () {
//           setState(() {
//             isShowLoading = false;
//           });
//         });
//       }
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         Form(
//           key: _formKey,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 "Email",
//                 style: TextStyle(color: Colors.black54),
//               ),
//               Container(
//                 //padding: const EdgeInsets.only( bottom: 16),
//                 child: TextFormField(
//                   validator: (value) {
//                     if (value!.isEmpty) {
//                       return "";
//                     }
//                     return null;
//                   },
//                 //  onSaved: (email) {},
//                   decoration: InputDecoration(
//                       prefix: Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 8.0),
//                     child: SvgPicture.asset("assets/icons/email.svg"),
//                   )),
//                 ),
//               ),
//               Text(
//                 "Password",
//                 style: TextStyle(color: Colors.black54),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(top: 8.0, bottom: 18.0),
//                 child: TextFormField(
//                   validator: (value) {
//                     if (value!.isEmpty) {
//                       return "";
//                     }
//                     return null;
//                   },
//                 //  onSaved: (password) {},
//                   obscureText: true,
//                   decoration: InputDecoration(
//                       prefix: Container(
//                     padding: EdgeInsets.symmetric(horizontal: 8.0),
//                     child: SvgPicture.asset("assets/icons/password.svg"),
//                   )),
//                 ),
//               ),
//               Padding(
//                 padding: EdgeInsets.only(top: 8, bottom: 16),
//                 child: ElevatedButton.icon(
//                   onPressed: () {
//                     signIn(context);
//                   },
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Color(0xFFF77D8E),
//                     minimumSize: Size(double.infinity, 56),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.only(
//                         topLeft: Radius.circular(10),
//                         topRight: Radius.circular(25),
//                         bottomLeft: Radius.circular(25),
//                         bottomRight: Radius.circular(25),
//                       ),
//                     ),
//                   ),
//                   icon: Icon(
//                     CupertinoIcons.arrow_right,
//                     color: Color(0xFFFE0037),
//                   ),
//                   label: Text("Sign In"),
//                 ),
//               ),
//             ],
//           ),
//         ),
//         isShowLoading
//             ? CustomPositioned(
//                 child: RiveAnimation.asset(
//                   "assets/RiveAssets/check.riv",
//                   fit: BoxFit.cover,
//                   onInit: (artboard) {
//                     StateMachineController controller =
//                         getRiveController(artboard);
//                     check = controller.findInput("Check") as SMITrigger;
//                     error = controller.findInput("Error") as SMITrigger;
//                     reset = controller.findInput("Reset") as SMITrigger;
//                   },
//                 ),
//               )
//             : SizedBox(),
//         isSConfftt
//             ? Transform.scale(
//                 scale: 7,
//                 child: CupertinoFormRow(
//                     child: RiveAnimation.asset(
//                   "assets/RiveAssets/confetti.riv",
//                       fit: BoxFit.cover,
//                   onInit: (artboard) {
//                     StateMachineController controller =
//                         getRiveController(artboard);
//                        // artboard.addController(controller!);
//                       confftii = controller.findInput<bool>("Trigger explosion") as SMITrigger;
//                   },
//                 )),
//               )
//             : SizedBox(),
//       ],
//     );
//   }
// }
//
// class CustomPositioned extends StatelessWidget {
//   const CustomPositioned({Key? key, required this.child, this.size = 100})
//       : super(key: key);
//   final Widget child;
//   final double size;
//
//   @override
//   Widget build(BuildContext context) {
//     return Positioned.fill(
//       child: Column(
//         children: [
//           Spacer(),
//           SizedBox(
//             width: size,
//             height: size,
//             child: Positioned.fill(child: child),
//           ),
//           Spacer(
//             flex: 2,
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:build_an_animated_app_with_rive_and_flutter_try/Utils/rive_util.dart';
import 'package:build_an_animated_app_with_rive_and_flutter_try/entry_point.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rive/rive.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({
    Key? key,
  }) : super(key: key);

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isShowLoading = false;
  bool isShowConfetti = false;
  late SMITrigger error;
  late SMITrigger success;
  late SMITrigger reset;

  late SMITrigger confetti;

  void _onCheckRiveInit(Artboard artboard) {
    StateMachineController? controller = RiveUtil.getRiveController(artboard);

    artboard.addController(controller!);
    error = controller.findInput<bool>('Error') as SMITrigger;
    success = controller.findInput<bool>('Check') as SMITrigger;
    reset = controller.findInput<bool>('Reset') as SMITrigger;
  }

  void _onConfettiRiveInit(Artboard artboard) {
    StateMachineController? controller = RiveUtil.getRiveController(artboard);

    confetti = controller.findInput<bool>("Trigger explosion") as SMITrigger;
  }

  void singIn(BuildContext context) {
    // confetti.fire();
    setState(() {
      isShowConfetti = true;
      isShowLoading = true;
    });
    Future.delayed(
      const Duration(seconds: 1),
      () {
        if (_formKey.currentState!.validate()) {
          success.fire();
          Future.delayed(
            const Duration(seconds: 2),
            () {
              setState(() {
                isShowLoading = false;
              });
              confetti.fire();
              // Navigate & hide confetti
              Future.delayed(const Duration(seconds: 1), () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Entrypoint()));
              });
            },
          );
        } else {
          error.fire();
          Future.delayed(
            const Duration(seconds: 2),
            () {
              setState(() {
                isShowLoading = false;
              });
              reset.fire();
            },
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Email",
                style: TextStyle(
                  color: Colors.black54,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 16),
                child: TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    prefixIcon: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: SvgPicture.asset("assets/icons/email.svg"),
                    ),
                  ),
                ),
              ),
              const Text(
                "Password",
                style: TextStyle(
                  color: Colors.black54,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 16),
                child: TextFormField(
                  obscureText: true,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    prefixIcon: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: SvgPicture.asset("assets/icons/password.svg"),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 24),
                child: ElevatedButton.icon(
                  onPressed: () {
                    singIn(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFF77D8E),
                    minimumSize: const Size(double.infinity, 56),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(25),
                        bottomRight: Radius.circular(25),
                        bottomLeft: Radius.circular(25),
                      ),
                    ),
                  ),
                  icon: const Icon(
                    CupertinoIcons.arrow_right,
                    color: Color(0xFFFE0037),
                  ),
                  label: const Text("Sign In"),
                ),
              ),
            ],
          ),
        ),
        isShowLoading
            ? CustomPositioned(
                child: RiveAnimation.asset(
                  'assets/RiveAssets/check.riv',
                  fit: BoxFit.cover,
                  onInit: _onCheckRiveInit,
                ),
              )
            : const SizedBox(),
        isShowConfetti
            ? CustomPositioned(
                scale: 6,
                child: RiveAnimation.asset(
                  "assets/RiveAssets/confetti.riv",
                  onInit: _onConfettiRiveInit,
                  fit: BoxFit.cover,
                ),
              )
            : const SizedBox(),
      ],
    );
  }
}

class CustomPositioned extends StatelessWidget {
  const CustomPositioned({super.key, this.scale = 1, required this.child});

  final double scale;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Column(
        children: [
          const Spacer(),
          SizedBox(
            height: 100,
            width: 100,
            child: Transform.scale(
              scale: scale,
              child: child,
            ),
          ),
          const Spacer(flex: 2),
        ],
      ),
    );
  }
}
