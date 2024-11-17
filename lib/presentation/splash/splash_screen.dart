import 'dart:async';

import 'package:flutter/material.dart';
import 'package:weather_now/presentation/resources/assets_manager.dart';
import 'package:weather_now/presentation/resources/color_manager.dart';

import '../resources/constants_manager.dart';
import '../resources/routes_manager.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startDelay();
  }

  _startDelay() {
    _timer = Timer(const Duration(seconds: AppConstants.splashScreenDelay),
        _goToNextScreen);
  }

  void _goToNextScreen() {
    Navigator.pushReplacementNamed(context, Routes.onboardingRoute);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
      body: Center(
        child: Image.asset(ImageAssets.splashScreenImage),
      ),
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
