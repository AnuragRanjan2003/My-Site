import 'package:flutter/material.dart';
import 'package:my_site/resources/colors/colors.dart';
import 'package:my_site/view/components/nav_bar_desktop.dart';

class ProjectScreenDesktop extends StatelessWidget {
  const ProjectScreenDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: ProjectColors.backGroundColor,
      appBar: PreferredSize(preferredSize: Size.fromHeight(120), child: NavBarDesktop()),
    );
  }
}
