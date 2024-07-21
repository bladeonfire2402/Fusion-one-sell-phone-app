import 'package:flutter/material.dart';
import 'package:haha/screen/admin-panel/edit_upload_product.dart';
import 'package:haha/widgets/Appwidget.dart'; // Make sure the import path is correct

class AdminPanelMain extends StatefulWidget {
  const AdminPanelMain({super.key});

  @override
  State<AdminPanelMain> createState() => _AdminPanelMainState();
}

class _AdminPanelMainState extends State<AdminPanelMain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Align(
          alignment: Alignment.center,
          child: Text(
            'Admin Panel',
            style: TextStyle(fontSize: 20, color: Colors.blue),
          ),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            // Tạo sản phẩm mới container
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => EditUploadProduct()));
              },
              child: Container(
                margin: const EdgeInsets.only(top: 20),
                padding: const EdgeInsets.all(10),
                width: MediaQuery.of(context).size.width *
                    0.8, // Adjust width to avoid overflow
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Text(
                      "Tạo sản phẩm mới",
                      style: AppWidget.DarklightTextFeildStyle(),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey[
                            200], // Added a background color to the circle
                      ),
                      child: Icon(Icons.add, size: 30),
                    ),
                  ],
                ),
              ),
            ),
            // Inspect all product
            Container(
              margin: const EdgeInsets.only(top: 20),
              padding: const EdgeInsets.all(10),
              width: MediaQuery.of(context).size.width *
                  0.8, // Adjust width to avoid overflow
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Column(
                children: [
                  Text(
                    "Xem tất cả sản phẩm",
                    style: AppWidget.DarklightTextFeildStyle(),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors
                          .grey[200], // Added a background color to the circle
                    ),
                    child: Icon(Icons.search, size: 30),
                  ),
                ],
              ),
            ),
            //Xem đơn hàng
            Container(
              margin: const EdgeInsets.only(top: 20),
              padding: const EdgeInsets.all(10),
              width: MediaQuery.of(context).size.width *
                  0.8, // Adjust width to avoid overflow
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Column(
                children: [
                  Text(
                    "Xem đơn hàng ",
                    style: AppWidget.DarklightTextFeildStyle(),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors
                          .grey[200], // Added a background color to the circle
                    ),
                    child: Icon(Icons.favorite, size: 30),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
