

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:haha/utils/app__constant.dart';


class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: AppConstant.SecondaryColor,
          statusBarBrightness: Brightness.light
        ),
        backgroundColor: AppConstant.appMainColor,
        title: Text("Data"),
        centerTitle: true,
      ),

    );
  }
}