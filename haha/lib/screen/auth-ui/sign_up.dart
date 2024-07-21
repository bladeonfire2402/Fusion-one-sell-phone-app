import 'package:flutter/material.dart';
import 'package:haha/auth/firebaseopt.dart';
import 'package:haha/screen/auth-ui/sign_in.dart';
import 'package:haha/widgets/Appwidget.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController nameCont = TextEditingController();

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
              "assets/images/haha.png",
              height: 350,
            ),
            Text(
              "Tạo tài khoản",
              textAlign: TextAlign.center,
              style: AppWidget.boldTextFeildStyle(),
            ),
              Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: TextFormField(
                controller: nameCont,
                cursorColor: Colors.blue,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "Nhập tên",
                  prefixIcon: Icon(Icons.lock),
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
                controller: emailCont,
                cursorColor: Colors.blue,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: "Nhập email",
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
            SizedBox(height: 40),
            ElevatedButton(
                onPressed: () {
                  createUserWithEmailAndPassword(
                      emailCont.text, passCont.text,nameCont.text,context);
                },
                child: Text("Đăng Kí")),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Đã có tài khoản ?",
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
                        builder: (context) => SignInScreen(),
                      ),
                    );
                  },
                  child: Text(
                    "Đăng nhập",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Montserrat",
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
