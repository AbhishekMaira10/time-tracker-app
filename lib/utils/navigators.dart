import 'package:flutter/material.dart';
import 'package:time_tracker_flutter_course/app/landing_page.dart';

class MyNavigator {
  static void goToHome(BuildContext context) {
        Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (BuildContext context) => LandingPage()
      )
    );
  }
}
