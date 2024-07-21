import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:haha/components/Mybox.dart";
import "package:haha/components/bottomnav.dart";
import "package:haha/components/buttonsettings.dart";
import "package:haha/provider/theme_provider.dart";
import "package:haha/screen/auth-ui/profile.dart";
import "package:provider/provider.dart";

class SettingPages extends StatefulWidget {
  const SettingPages({Key? key}) : super(key: key);

  @override
  _SettingPagesState createState() => _SettingPagesState();
}

class _SettingPagesState extends State<SettingPages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Container(
          padding: EdgeInsets.only(left: 25, bottom: 10, top: 10),
          child: GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Bottomnav()));
            },
            child: Align(
                alignment: Alignment.centerLeft,
                child: Icon(Icons.arrow_back_ios)),
          ),
        ),
        Container(
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary,
              borderRadius: BorderRadius.circular(15)),
          margin: EdgeInsets.only(left: 25, top: 10, right: 25),
          padding: EdgeInsets.all(25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //"Dark Mode"
              Text(
                "Chế độ bóng đêm",
                style: TextStyle(
                  fontFamily: "Montserrat",
                  fontWeight: FontWeight.normal,
                  fontSize: 22,
                ),
              ),
              //switch
              Mybox(
                  child: Buttonsettings(
                    color: Theme.of(context).colorScheme.secondary,
                    onTap: () {
                      Provider.of<ThemeProvider>(context, listen: false)
                          .toggleTheme();
                    },
                  ),
                  color: Theme.of(context).colorScheme.primary)
            ],
          ),
        ),
      ]),
    );
  }
}
