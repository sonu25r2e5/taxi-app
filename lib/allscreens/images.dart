import 'package:flutter/material.dart';

class bgimages extends StatelessWidget {
  const bgimages({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/agriculture.jpg',
      fit: BoxFit.cover,
      color: Colors.black.withOpacity(0.7),
      colorBlendMode: BlendMode.darken,
    );
  }
}
