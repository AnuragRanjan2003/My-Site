import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_site/controller/component_controller/auth_controller.dart';
import 'package:my_site/resources/colors/colors.dart';
import 'package:my_site/resources/dims/global_dimensions.dart';
import 'package:my_site/resources/styles/text_styles.dart';

class CustomDialog extends StatelessWidget {
  final String title;
  final ImageProvider image;
  final String buttonText;
  final bool allowAdmin;

  const CustomDialog(
      {super.key,
      required this.title,
      required this.image,
      required this.buttonText,
      required this.allowAdmin});

  @override
  Widget build(BuildContext context) {
    Get.put(AuthController());
    return Dialog(
        insetAnimationCurve: Curves.easeInCubic,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Container(
            constraints: BoxConstraints.loose(Size(1100, 700)),
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
                Expanded(
                    child: TextArea(
                  title: title,
                  buttonText: buttonText,
                  allowAdmin: allowAdmin,
                ))
              ],
            )));
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
  final bool allowAdmin;

  const TextArea(
      {super.key,
      required this.title,
      required this.buttonText,
      required this.allowAdmin});

  @override
  Widget build(BuildContext context) {
    AuthController controller = Get.find();
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
                const Size(GlobalDims.dialogElementWidth, 70)),
            child: const TextField(
              textAlign: TextAlign.center,
              style: ProjectTextStyles.item,
              autocorrect: true,
              maxLines: 1,
              decoration: InputDecoration(
                  labelText: "Email",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)))),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Container(
            constraints: BoxConstraints.loose(
                const Size(GlobalDims.dialogElementWidth, 100)),
            child: const TextField(
              textAlign: TextAlign.center,
              style: ProjectTextStyles.item,
              autocorrect: true,
              maxLines: 1,
              obscureText: true,
              decoration: InputDecoration(
                  labelText: "Password",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)))),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Visibility(
            visible: allowAdmin,
            child: Obx(() => Row(
                  children: [
                    Checkbox(
                        value: controller.admin.value,
                        onChanged: (value) => controller.toggleAdmin()),
                    const Text(
                      "log in as admin",
                      style: ProjectTextStyles.item,
                    )
                  ],
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
                onPressed: () {},
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Text(
                    buttonText,
                    style: ProjectTextStyles.onItemTitle,
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
