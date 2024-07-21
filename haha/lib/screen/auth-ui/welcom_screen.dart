import 'package:flutter/material.dart';
import 'package:haha/screen/auth-ui/sign_up.dart';
import 'package:haha/utils/app__constant.dart';
import 'package:haha/widgets/Appwidget.dart';

class WelcomScreen extends StatelessWidget {
  const WelcomScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: AppConstant.appMainColor,
        title: Text(
          "Welcome to my app",
          style: AppWidget.BoldlightTextFeildStyle(),
        ),
      ),
      body: Container(
        color: Colors.amberAccent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Center(
              child: Container(
                child: Image.asset(
                  "assets/images/login.png",
                  height: 250,
                  width: 250,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Mua sắm vui vẻ",
              style: AppWidget.DarklightTextFeildStyle(),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              child: Column(
                children: [
                  Container(
                    width: 320,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 10),
                    decoration: BoxDecoration(
                        color: AppConstant.SecondaryColor,
                        borderRadius: BorderRadius.circular(10)),
                    child: TextButton.icon(
                        onPressed: () {},
                        icon: Icon(
                          Icons.email,
                          color: const Color.fromARGB(153, 250, 250, 250),
                        ),
                        label: Text(
                          "Đăng nhập bằng email",
                          style: TextStyle(
                              color: AppConstant.appTextColor,
                              fontFamily: "Montserrat",
                              fontWeight: FontWeight.bold,
                              fontSize: 14),
                        )),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                    
                    },
                    child: Container(
                      width: 320,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 10),
                      decoration: BoxDecoration(
                          color: AppConstant.SecondaryColor,
                          borderRadius: BorderRadius.circular(10)),
                      child: TextButton.icon(
                          onPressed: () {},
                          icon: Icon(
                            Icons.account_box,
                            color: const Color.fromARGB(153, 250, 250, 250),
                          ),
                          label: GestureDetector(
                            onTap: (){
                                Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignUpScreen()));
                            },
                            child: Text(
                              "Đăng nhập bằng tài khoản",
                              style: TextStyle(
                                  color: AppConstant.appTextColor,
                                  fontFamily: "Montserrat",
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14),
                            ),
                          )),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
