import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_site/resources/colors/colors.dart';
import 'package:my_site/resources/dims/global_dimensions.dart';
import 'package:my_site/resources/strings/home_screen_strings.dart';
import 'package:my_site/resources/styles/text_styles.dart';
import 'package:my_site/view/components/home/desktop/dialog.dart';

class NavBarDesktop extends StatelessWidget {
  const NavBarDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
          top: 10, bottom: 10, left: GlobalDims.paddingHoriz, right: 40),
      width: MediaQuery.sizeOf(context).width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(HomeScreenStrings.navName,
              style: ProjectTextStyles.highlightedItem),
          Wrap(
            direction: Axis.horizontal,
            spacing: 10,
            alignment: WrapAlignment.spaceBetween,
            children: [
              navItem('home', () {}),
              navItem('blogs', () {}),
              MaterialButton(
                color: ProjectColors.highLightColor,
                onPressed: () {
                  Get.showSnackbar(const GetSnackBar(
                    title: 'Login',
                    message: "Login Clicked",
                    duration: GlobalDims.slideTimeSlow,
                  ));
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                  child: Text(
                    "login",
                    style: ProjectTextStyles.smallHighLightedText,
                  ),
                ),
              ),
              MaterialButton(
                color: ProjectColors.highLightColor,
                onPressed: () {
                  Get.dialog(const SignUpDialog(), );
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                  child: Text(
                    "sign up",
                    style: ProjectTextStyles.smallHighLightedText,
                  ),
                ),
              )
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
              style: ProjectTextStyles.item,
            )));
  }
}
