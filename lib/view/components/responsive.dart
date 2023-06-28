import 'package:flutter/cupertino.dart';

class Responsive extends StatelessWidget {
  final StatelessWidget desktop;
  final StatelessWidget mobile;

  const Responsive({super.key, required this.desktop, required this.mobile});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 700) {
          return desktop;
        } else {
          return mobile;
        }
      },
    );
  }
}
