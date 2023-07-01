import 'package:flutter/material.dart';
import 'package:my_site/view/components/responsive.dart';
import 'package:my_site/view/screens/projects/variants/project_screen_desktop.dart';
import 'package:my_site/view/screens/projects/variants/project_screen_mobile.dart';

class ProjectScreen extends StatelessWidget {
  const ProjectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Responsive(
          desktop: ProjectScreenDesktop(), mobile: ProjectScreenMobile()),
    );
  }
}
