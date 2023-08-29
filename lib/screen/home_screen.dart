import 'package:build_an_animated_app_with_rive_and_flutter_try/models/course.dart';
import 'package:build_an_animated_app_with_rive_and_flutter_try/screen/component/course_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  "Courses ",
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      color: Colors.black, fontWeight: FontWeight.w600),
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
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  "Recent",
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .copyWith(fontWeight: FontWeight.w600),
                ),
              ),
              ...recentCourses
                  .map((courses) => Padding(
                        padding: const EdgeInsets.only(
                            right: 20, left: 20, bottom: 20),
                        child: SecondaryCourseCard(
                          courses: courses,
                        ),
                      ))
                  .toList()
            ],
          ),
        ),
      ),
    );
  }
}

class SecondaryCourseCard extends StatelessWidget {
  const SecondaryCourseCard({
    super.key,
    required this.courses,
  });

  final Courses courses;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      decoration: BoxDecoration(
          color: courses.bgcolor,
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: Row(
        children: [
          Expanded(
              child: Column(
            children: [
              Text(
                courses.title,
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .copyWith(color: Colors.white, fontWeight: FontWeight.w600),
              ),
              Text("watch video - 15 mins",
                  style: TextStyle(color: Colors.white60, fontSize: 16))
            ],
          )),
          SizedBox(
            child: VerticalDivider(
              color: Colors.white70,
            ),
          ),
          SizedBox(
            width: 8,
          ),
          SvgPicture.asset(courses.iconSrc)
        ],
      ),
    );
  }
}
