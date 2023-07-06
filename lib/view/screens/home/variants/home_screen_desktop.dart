import 'package:flutter/material.dart';
import 'package:my_site/resources/colors/colors.dart';
import 'package:my_site/view/components/home/desktop/featured_section.dart';
import 'package:my_site/view/components/home/desktop/footer_desktop.dart';
import 'package:my_site/view/components/home/desktop/home_image.dart';
import 'package:my_site/view/components/home/desktop/projects_info.dart';
import 'package:my_site/view/components/home/desktop/tech_stack_bar.dart';
import 'package:my_site/view/components/home/desktop/nav_bar_desktop.dart';

class HomeScreenDesktop extends StatelessWidget {
  const HomeScreenDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(120), child: NavBarDesktop()),
        backgroundColor: ProjectColors.backGroundColor,
        body: SafeArea(
            child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              HomeImage(),
              SizedBox(
                height: 20,
              ),
              TechStackBar(),
              SizedBox(
                height: 50,
              ),
              ProjectsInfo(),
              SizedBox(
                height: 60,
              ),
              FeaturedSection(),
              SizedBox(
                height: 30,
              ),
              Footer()
            ],
          ),
        )));
  }
}
