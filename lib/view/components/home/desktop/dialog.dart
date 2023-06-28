import 'package:flutter/material.dart';
import 'package:my_site/resources/colors/colors.dart';
import 'package:my_site/resources/dims/global_dimensions.dart';
import 'package:my_site/resources/styles/text_styles.dart';

class SignUpDialog extends StatelessWidget {
  const SignUpDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetAnimationCurve: Curves.easeInCubic,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: Container(
          constraints: BoxConstraints.loose(Size(800,700)),
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 70),
          width: MediaQuery.sizeOf(context).width * 0.5,
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              color: Colors.white),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                "Create an account",
                textAlign: TextAlign.center,
                style: ProjectTextStyles.header,
              ),
              SizedBox(height: 100,),
              Container(
                constraints: BoxConstraints.loose(const Size(GlobalDims.dialogElementWidth, 100)),
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
              const SizedBox(height: 30,),
              Container(
                constraints: BoxConstraints.loose(const Size(GlobalDims.dialogElementWidth, 100)),
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
              SizedBox(height: 30,),
              Container(
                constraints: BoxConstraints.loose(const Size(GlobalDims.dialogElementWidth, 100)),
                child: MaterialButton(
                  color: ProjectColors.highLightColor,
                  onPressed: () {},
                  child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                    child: Text("Create an Account" , style: ProjectTextStyles.onItemTitle,),
                  ),
                )
              )
            ],
          )),
    );
  }
}
