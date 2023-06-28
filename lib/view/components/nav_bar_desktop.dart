import 'package:flutter/material.dart';
import 'package:my_site/resources/colors/colors.dart';
import 'package:my_site/resources/dims/global_dimensions.dart';
import 'package:my_site/resources/strings/home_screen_strings.dart';
import 'package:my_site/resources/styles/text_styles.dart';

class NavBarDesktop extends StatelessWidget {
  const NavBarDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: GlobalDims.paddingHoriz),
      width: MediaQuery.sizeOf(context).width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(HomeScreenStrings.navName , style: ProjectTextStyles.highlightedItem ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              navItem('home', () {}),
              navItem('blogs', () {}),
            ],
          )
        ],
      ),
    );
  }

  Container navItem(String name, void Function() onTap) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
        child: TextButton(
            onPressed: onTap,
            child: Text(
              name,
              style:
                  ProjectTextStyles.item,
            )));
  }
}
