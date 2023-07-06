import 'dart:math';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_site/resources/colors/colors.dart';
import 'package:my_site/resources/dims/global_dimensions.dart';
import 'package:my_site/resources/images/images.dart';
import 'package:my_site/resources/strings/home_screen_strings.dart';
import 'package:my_site/resources/styles/text_styles.dart';

class HomeImage extends StatelessWidget {
  const HomeImage({super.key});

  @override
  Widget build(BuildContext context) {
    double wt = MediaQuery.sizeOf(context).width;
    double ht = min(wt * 9 / 16, 550);
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      child: Stack(
        children: [
          Image(
            image: ProjectAssetImages.bodyBackground,
            fit: BoxFit.fill,
            width: MediaQuery.sizeOf(context).width,
            height: ht,
          ),
          Positioned(
            top: 0,
            left: GlobalDims.paddingHoriz,
            child: SizedBox(
              height: ht,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    HomeScreenStrings.introHead,
                    style: ProjectTextStyles.largeHeader,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(HomeScreenStrings.introBody, style: ProjectTextStyles.body,),
                  const SizedBox(height: 10,),
                  AnimatedTextKit(
                    animatedTexts: ProjectTextStyles().animatedTexts,
                  repeatForever: true,),
                  const SizedBox(
                    height: 30,
                  ),
                  MaterialButton(
                    onPressed: () {},
                    shape: GlobalDims.roundButton,
                    color: ProjectColors.onBackGroundColor,
                    child: Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 15),
                        child: const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              HomeScreenStrings.buttonText,
                              style: ProjectTextStyles.onItemStyle,
                            ),
                            SizedBox(width: 10,),
                            FaIcon(FontAwesomeIcons.arrowUpRightFromSquare,color: ProjectColors.textColor,size: 15,)
                          ],
                        )),
                  )
                ],
              ),
            ),
          ),

        ],
      ),
    );
  }
}


