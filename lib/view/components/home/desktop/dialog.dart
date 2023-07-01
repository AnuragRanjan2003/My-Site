import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_site/controller/component_controller/auth_controller.dart';
import 'package:my_site/resources/colors/colors.dart';
import 'package:my_site/resources/dims/global_dimensions.dart';
import 'package:my_site/resources/images/images.dart';
import 'package:my_site/resources/styles/text_styles.dart';

import '../../../../model/user.dart';

class CustomDialog extends StatelessWidget {
  final String title;
  final ImageProvider image;
  final String buttonText;
  final bool login;

  const CustomDialog(
      {super.key,
      required this.title,
      required this.image,
      required this.buttonText,
      required this.login});

  @override
  Widget build(BuildContext context) {
    AuthController authController = Get.find();
    return Dialog(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Container(
            constraints: BoxConstraints.loose(const Size(1100, 700)),
            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
            width: MediaQuery.sizeOf(context).width * 0.8,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: Colors.white),
            child: Row(
              children: [
                Expanded(
                    child: ImageArea(
                  image: image,
                )),
                Obx(() => Expanded(
                    child: setArea(
                        authController.loading.value,
                        TextArea(
                          title: title,
                          buttonText: buttonText,
                          login: login,
                        ),
                        const LoadingArea(message: "Please wait ..."),
                        authController.user.value)))
              ],
            )));
  }

  Widget setArea(bool val, TextArea text, LoadingArea loading, User? user) {
    if (user != null) {
      return const Done();
    } else if (val == true) {
      return const LoadingArea(message: "Please Wait .. ,");
    } else {
      return text;
    }
  }
}

class ImageArea extends StatelessWidget {
  final ImageProvider image;

  const ImageArea({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomLeft: Radius.circular(20)),
              color: ProjectColors.highLightColor),
        ),
        Center(
            child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: Image(image: image)))
      ],
    );
  }
}

class TextArea extends StatelessWidget {
  final String title;
  final String buttonText;
  final bool login;

  const TextArea(
      {super.key,
      required this.title,
      required this.buttonText,
      required this.login});

  @override
  Widget build(BuildContext context) {
    AuthController authController = Get.find();
    TextEditingController emailController = TextEditingController();
    TextEditingController passController = TextEditingController();

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            title,
            textAlign: TextAlign.center,
            style: ProjectTextStyles.dialogHeader,
          ),
          const SizedBox(
            height: 70,
          ),
          Container(
            constraints: BoxConstraints.loose(
                const Size(GlobalDims.dialogElementWidth, 150)),
            child: Obx(() => TextField(
                  onChanged: (s) {
                    if (authController.emailError.isNotEmpty)
                      authController.emailError.value = "";
                  },
                  textAlign: TextAlign.center,
                  style: ProjectTextStyles.item,
                  autocorrect: true,
                  controller: emailController,
                  maxLines: 1,
                  decoration: InputDecoration(
                      labelText: "Email",
                      errorText: authController.hasEmailError()
                          ? authController.emailError.value
                          : null,
                      errorStyle: authController.hasEmailError()
                          ? ProjectTextStyles.errorStyle
                          : null,
                      border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)))),
                )),
          ),
          const SizedBox(
            height: 40,
          ),
          Container(
            constraints: BoxConstraints.loose(
                const Size(GlobalDims.dialogElementWidth, 150)),
            child: Obx(() => TextField(
                  textAlign: TextAlign.center,
                  style: ProjectTextStyles.item,
                  onChanged: (s) => {
                    if (authController.passError.value.isNotEmpty)
                      authController.passError.value = ""
                  },
                  controller: passController,
                  autocorrect: true,
                  maxLines: 1,
                  obscureText: true,
                  decoration: InputDecoration(
                      labelText: "Password",
                      errorText: authController.hasPassError()
                          ? authController.passError.value
                          : null,
                      errorStyle: authController.hasPassError()
                          ? ProjectTextStyles.errorStyle
                          : null,
                      border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)))),
                )),
          ),
          const SizedBox(
            height: 50,
          ),
          Container(
              constraints: BoxConstraints.loose(
                  const Size(GlobalDims.dialogElementWidth, 100)),
              child: MaterialButton(
                color: ProjectColors.highLightColor,
                onPressed: () {
                  if (emailController.text.isEmpty) {
                    authController.setEmailError();
                    return;
                  } else if (passController.text.isEmpty) {
                    authController.setPassError();
                    return;
                  }
                  authController.clearErrors();

                  if (login) {
                    debugPrint(
                        "email : ${emailController.value.text}, pass : ${passController.value.text}");
                    authController.loginUser(
                        emailController.value.text, passController.value.text);
                  } else {
                    debugPrint(
                        "email : ${emailController.value.text}, pass : ${passController.value.text}");
                    authController.signUpUser(
                        emailController.value.text, passController.value.text);
                  }
                },
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Text(
                    buttonText,
                    style: ProjectTextStyles.onItemTitle,
                  ),
                ),
              )),
          const SizedBox(
            height: 30,
          ),
          Container(
            constraints: BoxConstraints.loose(
                const Size(GlobalDims.dialogElementWidth, 100)),
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                  side: const BorderSide(
                      color: ProjectColors.highLightColor, width: 1.5),
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5)))),
              onPressed: () {
                Navigator.of(Get.overlayContext!).pop();
                authController.clearErrors();
              },
              child: const Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  "close",
                  style: ProjectTextStyles.onItemTitleWhite,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class LoadingArea extends StatelessWidget {
  final String message;

  const LoadingArea({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            const Flexible(
              flex: 5,
              fit: FlexFit.loose,
              child: AspectRatio(
                aspectRatio: 1 / 1,
                child: Center(
                  child: SizedBox(
                    width: 80,
                    height: 80,
                    child: CircularProgressIndicator(
                        color: ProjectColors.highLightColor, strokeWidth: 8),
                  ),
                ),
              ),
            ),
            Flexible(
              fit: FlexFit.tight,
              flex: 2,
              child: Text(
                message,
                style: ProjectTextStyles.body,
              ),
            )
          ],
        ));
  }
}

class Done extends StatelessWidget {

  const Done({super.key});

  @override
  Widget build(BuildContext context) {
    AuthController controller = Get.find();
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40,vertical: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Image(
            image: ProjectAssetImages.doneImage,
            height: 250,
            width: 250,
          ),
          const SizedBox(height: 30,),
          Container(
            constraints: BoxConstraints.loose(
                const Size(GlobalDims.dialogElementWidth, 100)),
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                  side: const BorderSide(
                      color: ProjectColors.highLightColor, width: 1.5),
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5)))),
              onPressed: () {
                Navigator.of(Get.overlayContext!).pop();
                controller.clearErrors();
              },
              child: const Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  "close",
                  style: ProjectTextStyles.onItemTitleWhite,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
