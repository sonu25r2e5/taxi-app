import 'package:ClimateChange/allscreens/registrationscreen/resscreen.dart';
import 'package:flutter/material.dart';

class Registration extends StatelessWidget {
  static const String idScreen = "registerd";
  const Registration({super.key, required String title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: resscreen(),
    );
  }
}
