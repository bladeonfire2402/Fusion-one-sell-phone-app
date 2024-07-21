import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:haha/screen/auth-ui/welcom_screen.dart';
import 'package:haha/utils/app__constant.dart';
import 'package:haha/widgets/Appwidget.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (_) => const WelcomScreen(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              padding: EdgeInsets.all(20),
              child: Image.asset(
                'assets/images/splash.png',
                height: 250,
                width: 250,
              ),
            ),
            const SizedBox(height: 40),
            Text(
              AppConstant.appMainName,
              style: AppWidget.boldTextFeildStyle(),
            ),
            Text("Chọn Pro App sáng tươi lai"),
            Spacer(),
            Text(
              AppConstant.appPoweredBy,
              style: AppWidget.DarklightTextFeildStyle(),
            ),
            const SizedBox(height: 10,)
          ],
        ),
      ),
    );
  }
}
