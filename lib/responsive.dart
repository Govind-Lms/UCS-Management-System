import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  final Widget desktopScreen;
  final Widget mobileScreen;

  const Responsive(
      {super.key, required this.desktopScreen, required this.mobileScreen});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth > 950) {
      return desktopScreen;
    }
    if (screenWidth < 500) {
      return mobileScreen;
    }
    return mobileScreen;
  }
}
