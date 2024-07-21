import "package:flutter/material.dart";
import "package:haha/provider/cart_provider.dart";
import "package:haha/provider/product_provider.dart";
import "package:provider/provider.dart";

class CartBottomCheckout extends StatelessWidget {
  const CartBottomCheckout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    final productProvider = Provider.of<ProductProvider>(context);
    return Container(
      decoration: BoxDecoration(
          color: Colors.blue,
          border: const Border(top: BorderSide(width: 1, color: Colors.green))),
      child: SizedBox(
        height: kBottomNavigationBarHeight + 10,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FittedBox(
                        child: Text(
                            "Total (${cartProvider.getCartItems.length} product/${cartProvider.getQty()} Sản phẩm)" 
                                )),
                    Text(
                      "${cartProvider.getTotal(productProvider: productProvider)}\$",
                    )
                  ],
                ),
              ),
              ElevatedButton(onPressed: () {}, child: Text("checkout"))
            ],
          ),
        ),
      ),
    );
  }
}
