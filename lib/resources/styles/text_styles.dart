import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_site/resources/colors/colors.dart';

class ProjectTextStyles {
  static const body = TextStyle(color: ProjectColors.lightBlackColor , fontSize: 20 , overflow: TextOverflow.ellipsis,);
  static const bodyDark = TextStyle(color: ProjectColors.textColor , fontSize: 20 , overflow: TextOverflow.ellipsis,);
  static const subHeader = TextStyle(color: ProjectColors.textColor , fontSize: 30 , fontWeight: FontWeight.w700, overflow: TextOverflow.visible);
  static const header = TextStyle(color: ProjectColors.textColor , fontSize: 30 , fontWeight: FontWeight.w700 , overflow: TextOverflow.visible);
  static const largeHeader = TextStyle(color: ProjectColors.textColor , fontSize: 50 , fontWeight: FontWeight.w700);
  static const item = TextStyle(color: ProjectColors.textColor , fontSize: 17);
  static const date = TextStyle(color: ProjectColors.lightBlackColor , fontSize: 17, fontWeight: FontWeight.w300);
  static const highlightedItem = TextStyle(color: ProjectColors.highLightColor , fontSize: 28 , fontWeight: FontWeight.w700);
  static const highlightedButtonText = TextStyle(color: ProjectColors.highLightColor , fontSize: 18 , fontWeight: FontWeight.w700);
  static const onItemStyle = TextStyle(color: ProjectColors.backGroundColor , fontSize: 16 , overflow: TextOverflow.ellipsis);
  static const onItemTitle =TextStyle(color: ProjectColors.backGroundColor , fontSize: 18, fontWeight: FontWeight.w500);
  static const subTitle = TextStyle(color: ProjectColors.lightBlackColor , fontSize: 20 , fontWeight: FontWeight.w500);
  static const highLightedTitle = TextStyle(color: ProjectColors.highLightColor , fontSize: 70 , fontWeight: FontWeight.w700);

  static const onDisabledItemStyle = TextStyle(color: ProjectColors.textColor , fontSize: 14 , overflow: TextOverflow.ellipsis);
  static const onDisabledItemTitle =TextStyle(color: ProjectColors.textColor , fontSize: 18, fontWeight: FontWeight.w500);

  static const smallHighLightedText =TextStyle(color: ProjectColors.backGroundColor , fontSize: 14, fontWeight: FontWeight.w500);
  static const highLightedText = TextStyle(color: ProjectColors.highLightColor, fontSize: 17);
  static const dialogHeader = TextStyle(color: ProjectColors.textColor , fontSize: 32 , fontWeight: FontWeight.w700);
  static const onItemTitleWhite =TextStyle(color: ProjectColors.highLightColor , fontSize: 18, fontWeight: FontWeight.w500);

  static const errorStyle = TextStyle(color: Colors.red , fontSize: 14);


  final animatedTexts = [TypewriterAnimatedText("APIs", textStyle: highlightedItem),TypewriterAnimatedText("Native Android",textStyle: highlightedItem), TypewriterAnimatedText("MultiPlatform",textStyle: highlightedItem)];
}