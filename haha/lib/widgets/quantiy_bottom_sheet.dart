import 'package:flutter/material.dart';
import 'package:haha/models/cart_model.dart';
import 'package:haha/provider/cart_provider.dart';
import 'package:provider/provider.dart';

class QuantiyBottomSheet extends StatelessWidget {
  final CartModel cartModel;
  const QuantiyBottomSheet({super.key, required this.cartModel});

  @override
  Widget build(BuildContext context) {
    final cartProvide = Provider.of<CartProvider>(context);

    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        Container(
          height: 6,
          width: 50,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12), color: Colors.grey),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: 30,
            itemBuilder: (context, index) {
              return GestureDetector(
                  onTap: () {
                    cartProvide.UpdateQuantity(
                        productId: cartModel.productId, quantity: index + 1);
                    Navigator.pop(context);
                  },
                  child: Center(child: Text("${index + 1}")));
            },
          ),
        ),
      ],
    );
  }
}
