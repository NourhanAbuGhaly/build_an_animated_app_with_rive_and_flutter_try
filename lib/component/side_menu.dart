import 'package:build_an_animated_app_with_rive_and_flutter_try/component/info_card.dart';
import 'package:build_an_animated_app_with_rive_and_flutter_try/component/side_menu_tile.dart';
import 'package:build_an_animated_app_with_rive_and_flutter_try/models/rive_assets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({super.key});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 288,
        height: double.infinity,
        color: Color(0xff17203A),
        child: SafeArea(
          child: Column(
            children: [
              InfoCard(
                name: "Abu Anwar",
                profession: "YouTuber",
              )

              /// here the icon is rive assets because it's animate assets

              ,
              Padding(
                padding: const EdgeInsets.only(left: 24.0),
                child: Text(
                  "Brower",
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: Colors.white70),
                ),
              ),
              ...sideMenus.map(
                (menu) => SideMenuTile(
                  menu: menu,
                  isActive: false,
                  press: () {},
                  riveonInit: (artboard) {},
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
