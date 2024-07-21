import 'package:flutter/material.dart';
import 'package:haha/widgets/Appwidget.dart';


class Categoriestile extends StatelessWidget {
  String categoriesName;
  String image;
  Categoriestile({super.key, required this.image,required this.categoriesName});

  @override
  Widget build(BuildContext context) {
  
    return Container(
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.only(top: 10,bottom: 10),
      decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(10)),
      height: 80,
      width: 80,
      child: Column(
        children: [
          Image.asset(
            image,
            height: 50,
            fit: BoxFit.fill,
            width: 50,
          ),
          const SizedBox(height: 5,),
          Text(
            categoriesName,
            style: AppWidget.smlightTextFeildStyle(),
          )
        ],
      ),
    );
  }
}
