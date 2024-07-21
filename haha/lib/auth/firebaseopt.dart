import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:haha/components/bottomnav.dart';
import 'package:haha/screen/admin-panel/admin.dart';
import 'package:haha/screen/auth-ui/sign_in.dart';

// Function to create user with email and password
void createUserWithEmailAndPassword(String emailAddress, String password, String name, BuildContext context) async {
  try {
    final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: emailAddress,
      password: password,
    );
    // Navigate to login screen after successful user creation
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) =>const SignInScreen()),
    );
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      print('The password provided is too weak.');
    } else if (e.code == 'email-already-in-use') {
      print('The account already exists for that email.');
      // Show alert dialog for email already in use
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Email Already in Use'),
            content: Text('The account already exists for that email.'),
            actions: <Widget>[
              ElevatedButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    } else {
      print('Error creating user: $e');
    }
  } catch (e) {
    print('Error: $e');
  }
}

// Function to sign in user with email and password
void signInWithEmailAndPassword(String emailAddress, String password, BuildContext context) async {
  try {
    final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: emailAddress,
      password: password,
    );

    if (emailAddress == 'admin@gmail.com') {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Admin()),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Bottomnav()),
      );
    }
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      print('No user found for that email.');
    } else if (e.code == 'wrong-password') {
      print('Wrong password provided for that user.');
    } else {
      print('Error signing in: $e');
    }
  } catch (e) {
    print('Error: $e');
  }
}
