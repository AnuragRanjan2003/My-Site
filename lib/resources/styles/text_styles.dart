import 'package:flutter/cupertino.dart';
import 'package:my_site/resources/colors/colors.dart';

class ProjectTextStyles {
  static const body = TextStyle(color: ProjectColors.lightBlackColor , fontSize: 20 );
  static const subHeader = TextStyle(color: ProjectColors.textColor , fontSize: 30 , fontWeight: FontWeight.w700, overflow: TextOverflow.visible);
  static const header = TextStyle(color: ProjectColors.textColor , fontSize: 30 , fontWeight: FontWeight.w700 , overflow: TextOverflow.visible);
  static const largeHeader = TextStyle(color: ProjectColors.textColor , fontSize: 50 , fontWeight: FontWeight.w700);
  static const item = TextStyle(color: ProjectColors.textColor , fontSize: 15);
  static const highlightedItem = TextStyle(color: ProjectColors.highLightColor , fontSize: 18 , fontWeight: FontWeight.w700);
  static const onItemStyle = TextStyle(color: ProjectColors.backGroundColor , fontSize: 14 , overflow: TextOverflow.visible);
  static const onItemTitle =TextStyle(color: ProjectColors.backGroundColor , fontSize: 18, fontWeight: FontWeight.w500);
  static const subTitle = TextStyle(color: ProjectColors.lightBlackColor , fontSize: 20 , fontWeight: FontWeight.w500);
  static const highLightedTitle = TextStyle(color: ProjectColors.highLightColor , fontSize: 70 , fontWeight: FontWeight.w700);

  static const onDisabledItemStyle = TextStyle(color: ProjectColors.textColor , fontSize: 14 , overflow: TextOverflow.visible);
  static const onDisabledItemTitle =TextStyle(color: ProjectColors.textColor , fontSize: 18, fontWeight: FontWeight.w500);

}