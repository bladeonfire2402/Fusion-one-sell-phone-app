import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:haha/models/cart_model.dart';
import 'package:haha/provider/cart_provider.dart';
import 'package:haha/provider/product_provider.dart';
import 'package:haha/provider/wishlist_provider.dart';
import 'package:haha/screen/auth-ui/product_details.dart';
import 'package:provider/provider.dart';

class ProductWidget extends StatefulWidget {
  final String ProductId;
  const ProductWidget({Key? key, required this.ProductId}) : super(key: key);

  @override
  _ProductWidgetState createState() => _ProductWidgetState();
}

class _ProductWidgetState extends State<ProductWidget> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final productProvider = Provider.of<ProductProvider>(context);
    final wishListProvider = Provider.of<WishListProvider>(context);
    
    final getCurrentProduct = productProvider.findByProdId(widget.ProductId);
    final cartProvider = Provider.of<CartProvider>(context);


    if (getCurrentProduct == null) {
      return SizedBox.shrink();
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () async {
          await Navigator.pushNamed(
            context,
            ProductDetails.routeName,
            arguments: getCurrentProduct.productId,
          );
        },
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: FancyShimmerImage(
                height: size.height * 0.25,
                width: double.infinity,
                imageUrl: getCurrentProduct.productImage,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Flexible(
                  flex: 5,
                  child: Text(
                    getCurrentProduct.productTitle,
                    style: TextStyle(fontSize: 15),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                ),
                Spacer(),
                IconButton(
                  onPressed: () {
                     if (wishListProvider.isProductInWishList(
                          productID: getCurrentProduct.productId)) {
                        return;
                      }
                      wishListProvider.addProductToWishList(
                          productId: getCurrentProduct.productId);
                  },
                  icon: Icon(wishListProvider.isProductInWishList(
                            productID: getCurrentProduct.productId)
                        ? Icons.check
                        : Icons.favorite),
                ),
              ],
            ),
            Row(
              children: [
                Text("${getCurrentProduct.productPrice}\$"),
                Spacer(),
                Material(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.blue,
                  child: IconButton(
                    onPressed: () {
                      if (cartProvider.isProductInCart(
                          productID: getCurrentProduct.productId)) {
                        return;
                      }
                      cartProvider.addProductToCart(
                          productId: getCurrentProduct.productId);
                    },
                    splashColor: Colors.red,
                    splashRadius: 27,
                    icon: Icon(cartProvider.isProductInCart(
                            productID: getCurrentProduct.productId)
                        ? Icons.check
                        : Icons.shopping_bag),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
