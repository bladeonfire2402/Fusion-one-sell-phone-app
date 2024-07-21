import 'package:flutter/material.dart';

import 'package:haha/models/cart_model.dart';
import 'package:haha/models/product_model.dart';
import 'package:haha/models/wish_model.dart';
import 'package:haha/provider/product_provider.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

class WishListProvider with ChangeNotifier {
  final Map<String, WishModel> _wishItems = {};

  Map<String, WishModel> get getwishItems {
    return _wishItems;
  }

  bool isProductInWishList({required String productID}) {
    return _wishItems.containsKey(productID);
  }

  void addProductToWishList({required String productId}) {
    _wishItems.putIfAbsent(
        productId,
        () => WishModel(
            wishId: const Uuid().v4(), productId: productId, quantity: 1));
    notifyListeners();
  }

  

  double getTotal({required ProductProvider productProvider}) {
    double total = 0.0;
    _wishItems.forEach((key, value) {
      final ProductModel? getCurrProduct =
          productProvider.findByProdId(value.productId);
      if (getCurrProduct == null) {
        total += 0;
      } else {
        total += double.parse(getCurrProduct.productPrice) * value.quantity;
      }
    });
    return total;
  }

  
  void removeOneItem({required String productId}) {
    _wishItems.remove(productId);
    notifyListeners();
  }

  void clearLocalCart() {
    _wishItems.clear();
    notifyListeners();
  }
}
