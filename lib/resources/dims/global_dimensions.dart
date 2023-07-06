import 'package:flutter/cupertino.dart';
import 'package:my_site/resources/colors/colors.dart';

class GlobalDims {
  static const paddingHoriz = 70.00;
  static const slideTimeSlow = Duration(seconds: 5);
  static const slideTimeFast = Duration(seconds: 2);
  static const linkIconSize = 40.00;
  static const dialogElementWidth = 400.00;
  static const dialogDelay = Duration(seconds: 2);
  static const boxCornerRadius = BorderRadius.all(Radius.circular(5));

  static const roundContainer = BoxDecoration(color: ProjectColors.onBackGroundColor , borderRadius: boxCornerRadius );
  static const roundButton  = RoundedRectangleBorder(side: BorderSide(color: ProjectColors.disabledColor, width: 0.5),borderRadius: GlobalDims.boxCornerRadius);

}
