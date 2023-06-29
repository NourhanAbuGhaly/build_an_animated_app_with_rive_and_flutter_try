import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                "Courses ",
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium!
                    .copyWith(color: Colors.black, fontWeight: FontWeight.w600),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 24, horizontal: 16),
              width: 280,
              height: 260,
              decoration: BoxDecoration(
                color: Color(0xff7553F6),
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Animations in SwiftUI ",
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            top: 12,
                            bottom: 8,
                          ),
                          child: Text(
                            " Build and Animate an ios app from scratch ",
                            style: TextStyle(color: Colors.white70),
                          ),
                        ),
                        Text(
                          "61 SECTIONS - 11 HOURS ",
                          style: TextStyle(color: Colors.white54),
                        ),
                        Spacer(),
                        Row(
                          children: [
                            ...List.generate(
                              3,
                              (index) => Transform.translate(
                                offset: Offset((-10 * index).toDouble(), 0),
                                child: CircleAvatar(
                                    radius: 20,
                                    backgroundImage: AssetImage(
                                        "assets/avaters/Avatar ${index + 1}.jpg")),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  SvgPicture.asset("assets/icons/ios.svg")
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Courses {
  final String title, description, iconSrc;
  final Color bgcolor;

  Courses({
    required this.title,
    this.description = " Build and Animate an ios app from scratch ",
    this.iconSrc = "assets/icons/ios.svg",
    this.bgcolor = Colors.grey

    //  this.bgcolor= Color(0xFF7553F6)
    ,
  });
}

List<Courses> courses = [
  Courses(title: "Animatoin is SWIFTUI"),
  Courses(
      title: " Animatoin in Flutter",
      iconSrc: "assets/icons/code.svg",
      bgcolor: Color(0xFF80A4FF))
];
