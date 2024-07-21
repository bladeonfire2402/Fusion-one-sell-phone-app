import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class TestFetch extends StatefulWidget {
  const TestFetch({super.key});

  @override
  State<TestFetch> createState() => _TestFetchState();
}

class _TestFetchState extends State<TestFetch> {
  final CollectionReference fetchData =
      FirebaseFirestore.instance.collection("FetchData");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        title: const Text("Fetch"),
      ),
      body: StreamBuilder(
        stream: fetchData.snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
          return ListView.builder(
              itemCount: streamSnapshot.data!.docs.length,
              itemBuilder: (context, index) {
                final DocumentSnapshot documentSnapshot =
                    streamSnapshot.data!.docs[index];
                return Expanded(child: Material(child: ListTile(title: Text(documentSnapshot['name']),),));
              });
        },
      ),
    );
  }
}
