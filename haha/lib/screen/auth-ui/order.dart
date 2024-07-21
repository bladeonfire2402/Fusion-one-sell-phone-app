import 'package:flutter/material.dart';
import 'package:haha/provider/cart_provider.dart';
import 'package:haha/services/my_app_function.dart';
import 'package:haha/widgets/cart_bottom_checkout.dart';
import 'package:haha/widgets/cart_widget_item.dart';
import 'package:haha/widgets/empty_widget_cart.dart';
import 'package:provider/provider.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final cartProvider = Provider.of<CartProvider>(context);
    return cartProvider.getCartItems.isEmpty
        ? Scaffold(
            body: EmptyWidgetCart(
              imagePath:'assets/images/noproduct.png',
              title: "Your cart is empty",
              subtitle: "Looks like your cart is empty",
              buttonText: "Shop now",
            ),
          )
        : Scaffold(
            appBar: AppBar(
              actions: [
                IconButton(
                  onPressed: () {
                    MyAppFunction.showErrorOrWarningDialog(
                      context: context,
                      subtitle: "Clear all items?",
                      fct: () {
                        cartProvider.clearLocalCart();
                      },
                    );
                  },
                  icon: Icon(Icons.delete),
                  color: Colors.red,
                ),
              ],
              title: Text("${cartProvider.getCartItems.length}"),
              leading: Image(
                image: AssetImage('assets/images/other/abstract.png'),
              ),
            ),
            body: ListView.builder(
              itemCount: cartProvider.getCartItems.length,
              itemBuilder: (context, index) {
                final cartItem = cartProvider.getCartItems.values.toList()[index];
                return ChangeNotifierProvider.value(
                  value: cartItem,
                  child: const CartWidgetItem(),
                );
              },
            ),
            bottomSheet: const CartBottomCheckout(),
          );
  }
}
