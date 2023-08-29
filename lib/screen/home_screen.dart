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
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ...courses
                      .map((course) => Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: CourseCard(courses: course),
                          ))
                      .toList()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CourseCard extends StatelessWidget {
  const CourseCard({
    super.key,
    required this.courses,
  });

  final Courses courses;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 24, horizontal: 16),
      width: 280,
      height: 260,
      decoration: BoxDecoration(
        color: courses.bgcolor,
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  courses.title.toString(),
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Colors.white, fontWeight: FontWeight.w600),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 12,
                    bottom: 8,
                  ),
                  child: Text(
                    courses.description,
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
          SvgPicture.asset(courses.iconSrc)
        ],
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
  Courses(title: "Animation is SWIFTUI"),
  Courses(
      title: " Animation in Flutter",
      iconSrc: "assets/icons/code.svg",
      bgcolor: Color(0xFF80A4FF))
];
List<Courses> recentCourses = [
  Courses(title: "State Machine"),
  Courses(
      title: "Animated Menu",
      bgcolor: Color(0xFF9CC5FF),
      iconSrc: "assets/icons/code.svg"),
  Courses(title: "Flutter with Rive"),
  Courses(
      title: "Animated Menu",
      bgcolor: Color(0xFF9CC5FF),
      iconSrc: "assets/icons/code.svg")
];
