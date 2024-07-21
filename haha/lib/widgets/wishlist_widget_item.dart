


import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:haha/models/wish_model.dart';
import 'package:haha/provider/product_provider.dart';
import 'package:haha/provider/wishlist_provider.dart';
import 'package:provider/provider.dart';

class WishlistWidgetItem extends StatefulWidget {
  const WishlistWidgetItem({super.key});

  @override
  State<WishlistWidgetItem> createState() => _WishlistWidgetItemState();
}

class _WishlistWidgetItemState extends State<WishlistWidgetItem> {
  @override
  Widget build(BuildContext context) {
    final WishModelProvider = Provider.of<WishModel>(context);
    final productProvider = Provider.of<ProductProvider>(context);
    final wishListProvider = Provider.of<WishListProvider>(context);
    final getCurrentProduct =
        productProvider.findByProdId(WishModelProvider.productId);
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
                                        wishListProvider.removeOneItem(
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