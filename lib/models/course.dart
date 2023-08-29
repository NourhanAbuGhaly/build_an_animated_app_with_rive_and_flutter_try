
import 'package:flutter/material.dart';

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
