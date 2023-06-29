import 'package:flutter/material.dart';
class AnimContainer extends StatelessWidget {
  const AnimContainer({
    super.key,
    required this.isActive,
  });

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      margin: EdgeInsets.only(bottom: 2),
      width:isActive
          ? 23
          : 0,
      height: 12,
      decoration: BoxDecoration(
          color: Color(0xFF81B4FF),
          borderRadius:
          BorderRadius.all(Radius.circular(12))),
      duration: Duration(milliseconds: 200),
    );
  }
}