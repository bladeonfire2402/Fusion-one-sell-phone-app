


import 'package:flutter/material.dart';

class WishModel with ChangeNotifier {
  final String wishId;
  final String productId;
  final int quantity;

  WishModel({required this.wishId,required this.productId,required this.quantity});
}
