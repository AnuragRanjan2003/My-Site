import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_site/controller/component_controller/auth_controller.dart';
import 'package:my_site/resources/colors/colors.dart';
import 'package:my_site/resources/dims/global_dimensions.dart';
import 'package:my_site/resources/images/images.dart';
import 'package:my_site/resources/strings/home_screen_strings.dart';
import 'package:my_site/resources/styles/text_styles.dart';
import 'package:my_site/view/components/home/desktop/dialog.dart';

import '../../others/routes.dart';

class NavBarDesktop extends StatelessWidget {
  const NavBarDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    AuthController authController = Get.put(AuthController());
    return Container(
      color: Colors.white,
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
              Obx(() => Visibility(
                  visible: authController.userIsAdmin(),
                  child: navItem('admin', () {}))),
              navItem('home', () => Get.toNamed(Routes.homeScreen)),
              navItem('blogs', () => Get.toNamed(Routes.blogScreen)),
              Obx(() => Visibility(
                    visible: !authController.userExists(),
                    child: MaterialButton(
                      color: ProjectColors.highLightColor,
                      onPressed: () {
                        Get.dialog(
                            const CustomDialog(
                              title: "Hello Again!",
                              image: ProjectAssetImages.logIn,
                              buttonText: "Log in",
                              login: true,
                            ),
                            barrierDismissible: false);
                      },
                      child: const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                        child: Text(
                          "login",
                          style: ProjectTextStyles.smallHighLightedText,
                        ),
                      ),
                    ),
                  )),
              Obx(() => Visibility(
                    visible: !authController.userExists(),
                    child: MaterialButton(
                      color: ProjectColors.highLightColor,
                      onPressed: () {
                        Get.dialog(
                            const CustomDialog(
                              title: "Create an Account",
                              image: ProjectAssetImages.signUp,
                              buttonText: "Create an account",
                              login: false,
                            ),
                            barrierDismissible: false);
                      },
                      child: const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                        child: Text(
                          "sign up",
                          style: ProjectTextStyles.smallHighLightedText,
                        ),
                      ),
                    ),
                  )),
              Obx(() => Visibility(
                    visible: authController.userExists(),
                    child: MaterialButton(
                      color: ProjectColors.highLightColor,
                      onPressed: () {
                        authController.logOut();
                      },
                      child: const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                        child: Text(
                          "log out",
                          style: ProjectTextStyles.smallHighLightedText,
                        ),
                      ),
                    ),
                  )),
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
