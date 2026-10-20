import 'package:flutter/material.dart';
import 'package:movies_app/core/resources/assets_manager.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:   Image.asset(
        ImageAssets.splashLogo,
        fit: BoxFit.cover,
        height: double.infinity,
        width: double.infinity,
      )
    );
  }
}
