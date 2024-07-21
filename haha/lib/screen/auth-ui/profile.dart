import 'package:flutter/material.dart';
import 'package:haha/screen/auth-ui/setting_pages.dart';
import 'package:haha/screen/auth-ui/sign_up.dart';
import 'package:haha/screen/auth-ui/wishlist.dart';
import 'package:haha/widgets/Appwidget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Center(
              child: Column(
                children: [
                  ClipOval(
                      child: Image.asset(
                    'assets/images/person.png',
                    width: 100,
                    height: 100,
                  )),
                  Text(
                    "Mr Bruh",
                    style: AppWidget.boldTextFeildStyle(),
                  ),
                  Text("Khách hàng thân thiết"),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                margin: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.black12,
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 20, top: 10, bottom: 10, right: 10),
                      child: GestureDetector(
                        onTap: () {},
                        child: Row(
                          children: [
                            Image.asset(
                              'assets/images/person.png',
                              width: 30,
                              height: 30,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Chỉnh sửa",
                                  style: AppWidget.BlackStyle(),
                                ),
                                Text(
                                  "Thay đổi chỉnh sửa trang cá nhân",
                                  style: AppWidget.smlightTextFeildStyle(),
                                )
                              ],
                            ),
                            Spacer(),
                            Icon(
                              Icons.arrow_right_sharp,
                              size: 40,
                            )
                          ],
                        ),
                      ),
                    ),
                    Divider(
                      thickness: 0.5,
                      color: Colors.grey,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 20, top: 10, bottom: 10, right: 10),
                      child: GestureDetector(
                        onTap: () {},
                        child: Row(
                          children: [
                            Image.asset(
                              'assets/images/person.png',
                              width: 30,
                              height: 30,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Riêng tư",
                                  style: AppWidget.BlackStyle(),
                                ),
                                Text(
                                  "Thay đổi quyền cài đặt riêng tư",
                                  style: AppWidget.smlightTextFeildStyle(),
                                )
                              ],
                            ),
                            Spacer(),
                            Icon(
                              Icons.arrow_right_sharp,
                              size: 40,
                            )
                          ],
                        ),
                      ),
                    ),
                    Divider(
                      thickness: 0.5,
                      color: Colors.grey,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 20, top: 10, bottom: 10, right: 10),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SettingPages()));
                        },
                        child: Row(
                          children: [
                            Image.asset(
                              'assets/images/person.png',
                              width: 30,
                              height: 30,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Cài đặt",
                                  style: AppWidget.BlackStyle(),
                                ),
                                Text(
                                  "Tùy chỉnh cài đặt cho thiết bị",
                                  style: AppWidget.smlightTextFeildStyle(),
                                )
                              ],
                            ),
                            Spacer(),
                            Icon(
                              Icons.arrow_right_sharp,
                              size: 40,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                )),
            Container(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              margin: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.black12,
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 20, top: 10, bottom: 10, right: 10),
                    child: GestureDetector(
                      onTap: () {},
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/images/person.png',
                            width: 30,
                            height: 30,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Xem gần đây",
                                style: AppWidget.BlackStyle(),
                              ),
                              Text(
                                "Các sản phẩm đã xem",
                                style: AppWidget.smlightTextFeildStyle(),
                              )
                            ],
                          ),
                          Spacer(),
                          Icon(
                            Icons.arrow_right_sharp,
                            size: 40,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              margin: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.black12,
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 20, top: 10, bottom: 10, right: 10),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => WishlistScreen()));
                      },
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/images/person.png',
                            width: 30,
                            height: 30,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Xem danh sách yêu thích",
                                style: AppWidget.BlackStyle(),
                              ),
                              Text(
                                "Các sản phẩm yêu thích của bạn",
                                style: AppWidget.smlightTextFeildStyle(),
                              )
                            ],
                          ),
                          Spacer(),
                          Icon(
                            Icons.arrow_right_sharp,
                            size: 40,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SignUpScreen()));
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Đăng xuất",
                    style: AppWidget.DarklightTextFeildStyle(),
                  ),
                )),
            const SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
