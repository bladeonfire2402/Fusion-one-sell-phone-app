import "package:flutter/material.dart";

import "package:flutter/material.dart";

class Buttonsettings extends StatelessWidget {
  final Color? color;
  final void Function()? onTap;
  const Buttonsettings({super.key,required this.color,required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.all(5),
        child: const Center(
          child: Text("Bật ngay",style: TextStyle(
            fontFamily: "Montserrat"
          ),)
          ,),
      ),
    );
  }
}
