import 'package:flutter/material.dart';
import 'package:my_site/view/components/responsive.dart';
import 'package:my_site/view/screens/home/variants/home_screen_desktop.dart';
import 'package:my_site/view/screens/home/variants/home_screen_mobile.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body:
          Responsive(
              desktop: HomeScreenDesktop(),
              mobile: HomeScreenMobile()),
    );
  }
}
