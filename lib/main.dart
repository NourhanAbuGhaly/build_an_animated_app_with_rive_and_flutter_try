import 'package:build_an_animated_app_with_rive_and_flutter_try/screen/home_screen.dart';
import 'package:build_an_animated_app_with_rive_and_flutter_try/screen/onBoarding/on_boarding_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          fontFamily: "Intel",
          inputDecorationTheme:const InputDecorationTheme(
            fillColor: Colors.white,
            filled: true,
            errorStyle: TextStyle(height: 0),
            border: defaultInputBorder,
            enabledBorder: defaultInputBorder,
            focusedBorder: defaultInputBorder,
            errorBorder: defaultInputBorder,
          )
        )
      ,
      home: OnBoardingScreen(),
    );
  }
}

const defaultInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(16),
    ),
    borderSide: BorderSide(
      color: Color(0xffDEE3F2),
      width: 1,
    ));
