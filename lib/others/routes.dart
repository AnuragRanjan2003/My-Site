import 'package:get/get_navigation/get_navigation.dart';
import 'package:my_site/view/screens/home/home_screen.dart';

class Routes {
  static const String homeScreen = "/home_screen";
}

class AppRoutes {
  static get appRoutes => [
    GetPage(name: Routes.homeScreen, page: () => const HomeScreen(),)
  ];
}