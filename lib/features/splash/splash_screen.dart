import 'package:flutter/material.dart';
import 'package:movies_app/core/resources/assets_manager.dart';
import 'package:movies_app/core/routes_manager/routes.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3),(){
      Navigator.pushNamed(context, Routes.home);
    });
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
