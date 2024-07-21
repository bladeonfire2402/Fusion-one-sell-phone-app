

import 'package:flutter/material.dart';
import 'package:haha/provider/wishlist_provider.dart';
import 'package:haha/services/my_app_function.dart';
import 'package:haha/widgets/cart_widget_item.dart';
import 'package:haha/widgets/empty_widget_cart.dart';
import 'package:haha/widgets/wishlist_widget_item.dart';
import 'package:provider/provider.dart';

class WishlistScreen  extends StatelessWidget {
  const WishlistScreen ({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final wishlistProvider = Provider.of<WishListProvider>(context);
    return wishlistProvider.getwishItems.isEmpty
        ? Scaffold(
            body: EmptyWidgetCart(
              imagePath:'assets/images/noproduct.png',
              title: "Bạn chưa thích sản phẩm nào",
              subtitle: "Looks like your cart is empty",
              buttonText: "Shop now",
            ),
          )
        : Scaffold(
            appBar: AppBar(
              title: Text("Yêu Thích"),

            ),
            body: ListView.builder(
              itemCount: wishlistProvider.getwishItems.length,
              itemBuilder: (context, index) {
                final wishItem = wishlistProvider.getwishItems.values.toList()[index];
                return ChangeNotifierProvider.value(
                  value: wishItem,
                  child: const WishlistWidgetItem(),
                );
              },
            ),
            
          );
  }
  }
