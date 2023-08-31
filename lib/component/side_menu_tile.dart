import 'package:build_an_animated_app_with_rive_and_flutter_try/models/rive_assets.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class SideMenuTile extends StatelessWidget {
  const SideMenuTile({
    super.key, required this.menu, required this.press, required this.riveonInit, required this.isActive,
  });

  final RiveAsset menu;
  final VoidCallback press;
  final ValueChanged<Artboard> riveonInit;
  final bool  isActive;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
     const   Padding(
          padding: const EdgeInsets.only(left: 24.0),
          child: Divider(
            color: Colors.white24,
            height: 1,
          ),
        ),
        ListTile(
          onTap: press,
          leading: SizedBox(
            width: 34,
            height: 34,
            child: RiveAnimation.asset(
              menu.src,
              artboard: menu.artboard,
              onInit: riveonInit,
            ),
          ),
          title: Text(
           menu.title ,
            style: TextStyle(color: Colors.white),
          ),
        )
      ],
    );
  }
}
