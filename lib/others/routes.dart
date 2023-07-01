import 'package:flutter/animation.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:my_site/view/screens/home/home_screen.dart';
import 'package:my_site/view/screens/projects/project_screen.dart';

import '../view/screens/blog/blog_screen.dart';

class Routes {
  static const String homeScreen = "/";
  static const String blogScreen = "/blog_screen";
  static const String projectScreen = "/project_screen";
}

class AppRoutes {
  static get appRoutes => [
        GetPage(
            name: Routes.homeScreen,
            page: () => const HomeScreen(),
            curve: Curves.elasticInOut),
        GetPage(
            name: Routes.blogScreen,
            page: () => const BlogScreen(),
            curve: Curves.elasticInOut),
        GetPage(
            name: Routes.projectScreen,
            page: () => const ProjectScreen(),
            curve: Curves.bounceInOut)
      ];
}
