import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_site/resources/colors/colors.dart';
import 'package:my_site/view/components/gradient_text.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => Container(
        color: ProjectColors.onBackGroundColor,
        height: 70,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        width: constraints.maxWidth,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Expanded(
                flex: 3,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex:1,
                      child: CircleAvatar(
                        radius: 21,
                        backgroundColor: ProjectColors.disabledColor,
                        child: CircleAvatar(
                          radius: 20,
                          backgroundColor: ProjectColors.onBackGroundColor,
                          child: FaIcon(
                            FontAwesomeIcons.envelope,
                            color: ProjectColors.disabledColor,
                            size: 17,
                          ),
                        ),
                      ),
                    ),
                    Expanded(flex:5,child: GradientText("anuragranjan1261official@gmail.com", style: TextStyle(fontSize: 13,overflow: TextOverflow.ellipsis))),
                  ],
                )),
            const Spacer(
              flex: 8,
            ),
            Expanded(
              flex: 4,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: const FaIcon(
                        FontAwesomeIcons.github,
                        color: ProjectColors.textColor,
                      )),
                  IconButton(
                      onPressed: () {},
                      icon: const FaIcon(
                        FontAwesomeIcons.linkedin,
                        color: ProjectColors.textColor,
                      )),
                  IconButton(
                      onPressed: () {},
                      icon: const FaIcon(
                        FontAwesomeIcons.solidEnvelope,
                        color: ProjectColors.textColor,
                      )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
