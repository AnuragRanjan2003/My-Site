import 'package:flutter/material.dart';
import 'package:my_site/view/components/responsive.dart';
import 'package:my_site/view/screens/blog/variants/blog_screen_desktop.dart';
import 'package:my_site/view/screens/blog/variants/blog_screen_mobile.dart';

class BlogScreen extends StatelessWidget {
  const BlogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Responsive(desktop: BlogScreenDesktop(), mobile: BlogScreenMobile()),
    );
  }
}
