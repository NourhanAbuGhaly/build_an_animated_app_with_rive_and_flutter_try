import 'package:build_an_animated_app_with_rive_and_flutter_try/models/course.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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