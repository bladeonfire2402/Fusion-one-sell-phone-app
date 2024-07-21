import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:haha/auth/firebaseopt.dart';
import 'package:haha/components/bottomnav.dart';
import 'package:haha/screen/auth-ui/sign_up.dart';
import 'package:haha/widgets/Appwidget.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController emailCont = TextEditingController();
  TextEditingController passCont = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.asset(
              "assets/images/login.png",
              height: 350,
            ),
            Text(
              "Đăng nhập",
              textAlign: TextAlign.center,
              style: AppWidget.boldTextFeildStyle(),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: TextFormField(
                controller: emailCont,
                cursorColor: Colors.blue,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: "Nhập emails",
                  prefixIcon: Icon(Icons.email),
                  contentPadding: EdgeInsets.all(8.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: TextFormField(
                controller: passCont,
                cursorColor: Colors.blue,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "Nhập mật khẩu",
                  prefixIcon: Icon(Icons.lock),
                  contentPadding: EdgeInsets.all(8.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            SizedBox(height: 85),
            ElevatedButton(
                onPressed: () {
                  signInWithEmailAndPassword(emailCont.text, passCont.text,context);
                },
                child: Text("Đăng nhập")),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Chưa có tài khoản ?",
                  style: AppWidget.smlightTextFeildStyle(),
                ),
                const SizedBox(
                  width: 5,
                ),
                GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignUpScreen()));
                    },
                    child: Text(
                      "Đăng kí",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Montserrat"),
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
