import "package:flutter/material.dart";
import "package:fluttertoast/fluttertoast.dart";
import "package:haha/screen/admin-panel/database.dart";
import "package:random_string/random_string.dart";

class Employee extends StatefulWidget {
  const Employee({super.key});

  @override
  State<Employee> createState() => _EmployeeState();
}

class _EmployeeState extends State<Employee> {
  @override
  Widget build(BuildContext context) {
    TextEditingController idCont = TextEditingController();
    TextEditingController nameCont = TextEditingController();
    TextEditingController ageCont = TextEditingController();
    TextEditingController locationCont = TextEditingController();

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Employee  ",
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              "Firebase",
              style: TextStyle(
                  color: Colors.orange,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text("Id"),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(10)),
              child: TextField(
                controller: idCont,
                decoration: InputDecoration(border: InputBorder.none),
              ),
            ),
            Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Name",
                  style: TextStyle(color: Colors.black, fontSize: 24),
                )),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(10)),
              child: TextField(
                controller: nameCont,
                decoration: InputDecoration(border: InputBorder.none),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Age",
                style: TextStyle(color: Colors.black, fontSize: 24),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(10)),
              child: TextField(
                controller: ageCont,
                decoration: InputDecoration(border: InputBorder.none),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Location",
                style: TextStyle(color: Colors.black, fontSize: 24),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(10)),
              child: TextField(
                controller: locationCont,
                decoration: InputDecoration(border: InputBorder.none),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            FloatingActionButton(
              onPressed: () async {
                String id = randomAlphaNumeric(10);
                Map<String, dynamic> employeeInfoMap = {
                  "id":id,
                  "Name": nameCont.text,
                  "Age": ageCont.text,
                  "Location": locationCont.text
                };
                await DatabaseMethods()
                    .addEmployeeDetails(employeeInfoMap, id)
                    .then((value) {
                  Fluttertoast.showToast(
                      msg: "Employee Details has been add",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                      fontSize: 16);
                });
              },
              child: Text("Add"),
            ),
          ],
        ),
      ),
    );
  }
}
