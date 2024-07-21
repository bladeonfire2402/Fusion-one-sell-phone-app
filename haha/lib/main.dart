

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:haha/components/bottomnav.dart';
import 'package:haha/provider/cart_provider.dart';
import 'package:haha/provider/product_provider.dart';
import 'package:haha/provider/theme_provider.dart';
import 'package:haha/provider/wishlist_provider.dart';
import 'package:haha/screen/admin-panel/admin.dart';
import 'package:haha/screen/admin-panel/admin_panel_main.dart';
import 'package:haha/screen/admin-panel/test_fetch.dart';
import 'package:haha/screen/auth-ui/order.dart';
import 'package:haha/screen/auth-ui/product_details.dart';
import 'package:haha/screen/auth-ui/profile.dart';
import 'package:haha/screen/auth-ui/search.dart';
import 'package:haha/screen/auth-ui/setting_pages.dart';
import 'package:haha/screen/auth-ui/sign_in.dart';
import 'package:haha/screen/auth-ui/sign_up.dart';
import 'package:haha/screen/auth-ui/spash_screen.dart';
import 'package:haha/test.dart';
import 'package:provider/provider.dart';


Future main() async {
WidgetsFlutterBinding.ensureInitialized();
try {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyAklzWM8SIEz3wRegpFpsakOMkqA16CyGQ",
        appId: "1:415152637746:android:351d0299dca873bd7d392b",
        messagingSenderId: "415152637746",
        projectId: "motminhtaolam",
      ),
    );
  } on FirebaseException catch (e) {
    if (e.code == 'duplicate-app') {
      await Firebase.initializeApp();
    }
  }
runApp(
    ChangeNotifierProvider(create: (context)=>ThemeProvider(),
    child: const MyApp(),
    ),

  );
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => ProductProvider()),
      ChangeNotifierProvider(create: (context)=>CartProvider()),
      ChangeNotifierProvider(create: (context)=>WishListProvider()),
      
      
    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FunsionOne',
      home: const Bottomnav(),
      theme: Provider.of<ThemeProvider>(context).themeData,
      routes: {
        ProductDetails.routeName: (context)=> const ProductDetails(),
        
      },

    ),
    
    
    
    
    );
  }
}

