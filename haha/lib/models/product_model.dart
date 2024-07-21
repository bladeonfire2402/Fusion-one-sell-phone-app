import "package:flutter/material.dart";

class ProductModel with ChangeNotifier {
  final String productId,
      productTitle,
      productPrice,
      productCategory,
      productDescription,
      productImage,
      productQuantity;
  ProductModel({
    required this.productId,
    required this.productTitle,
    required this.productCategory,
    required this.productPrice,
    required this.productDescription,
    required this.productImage,
    required this.productQuantity
     
     });
}
