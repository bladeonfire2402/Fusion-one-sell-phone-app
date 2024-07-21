import "package:fancy_shimmer_image/fancy_shimmer_image.dart";
import "package:flutter/material.dart";
import "package:haha/models/cart_model.dart";
import "package:haha/provider/cart_provider.dart";
import "package:haha/provider/product_provider.dart";

import "package:haha/utils/app__constant.dart";
import "package:haha/widgets/quantiy_bottom_sheet.dart";
import "package:provider/provider.dart";

class CartWidgetItem extends StatelessWidget {
  const CartWidgetItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CartModelProvider = Provider.of<CartModel>(context);
    final productProvider = Provider.of<ProductProvider>(context);
    final cartProvider = Provider.of<CartProvider>(context);
    final getCurrentProduct =
        productProvider.findByProdId(CartModelProvider.productId);
    Size size = MediaQuery.of(context).size;
    return getCurrentProduct == null
        ? const SizedBox.shrink()
        : FittedBox(
            child: IntrinsicWidth(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: FancyShimmerImage(
                          height: size.height * 0.2,
                          width: size.width * 0.2,
                          imageUrl: getCurrentProduct.productImage),
                    ),
                    IntrinsicWidth(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                  width: size.width * 0.6,
                                  child: Text(
                                    getCurrentProduct.productTitle,
                                    maxLines: 2,
                                  )),
                              Column(
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        cartProvider.removeOneItem(
                                            productId:
                                                getCurrentProduct.productId);
                                      },
                                      icon: const Icon(
                                        Icons.delete_forever,
                                        color: Colors.red,
                                      )),
                                  IconButton(
                                      onPressed: () {
                                        
                                      },
                                      icon: const Icon(
                                        Icons.favorite,
                                        color: Colors.red,
                                      ))
                                ],
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                "${getCurrentProduct.productPrice}\$",
                              ),
                              const Spacer(),
                              OutlinedButton.icon(
                                style: OutlinedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    side: const BorderSide(
                                        width: 2, color: Colors.black)),
                                onPressed: () async {
                                  showModalBottomSheet(
                                      backgroundColor: Colors.red,
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(16),
                                              topRight: Radius.circular(16))),
                                      context: context,
                                      builder: (context) {
                                        return QuantiyBottomSheet(
                                          cartModel: CartModelProvider,
                                        );
                                      });
                                },
                                icon: const Icon(Icons.abc),
                                label: Text(
                                    'Quantity:${CartModelProvider.quantity}'),
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
  }
}
