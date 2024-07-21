import 'package:flutter/material.dart';
import 'package:haha/components/bottomnav.dart';
import 'package:haha/widgets/Appwidget.dart';

class EmptyWidgetCart extends StatelessWidget {
  final String imagePath, title, subtitle, buttonText;
  const EmptyWidgetCart({super.key, required this.imagePath, required this.title, required this.subtitle, required this.buttonText});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          Image.asset(
           imagePath,
            height: size.height * 0.5,
            width: double.infinity,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            title,
            style: AppWidget.boldTextFeildStyle(),
          ),
          Text(
            subtitle,
            style: AppWidget.DarklightTextFeildStyle(),
          ),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
              style:
                  ElevatedButton.styleFrom(padding: const EdgeInsets.all(20)),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Bottomnav()));
              },
              child: Text(
                buttonText,
                style: AppWidget.DarklightTextFeildStyle(),
              ))
        ],
      ),
    );
  }
}
