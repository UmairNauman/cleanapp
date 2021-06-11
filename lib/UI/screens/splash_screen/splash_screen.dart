import 'dart:async';
import 'package:cleanapp/UI/screens/onboarding/onboarding.dart';
import 'package:cleanapp/core/constants/colors.dart';
import 'package:cleanapp/core/constants/screen_util.dart';
import 'package:cleanapp/core/constants/strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 3), () {
      Get.off(Onboarding());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: baseColor,
      body: Center(
        child: Image.asset(
          '$image/logo.png',
          height: 190.h,
          width: 184.w,
        ),
      ),
    );
  }
}
