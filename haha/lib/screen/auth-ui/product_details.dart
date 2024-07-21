import 'package:flutter/material.dart';
import 'package:haha/provider/product_provider.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:provider/provider.dart';

class ProductDetails extends StatefulWidget {
  static const routeName = "/ProductDetails";

  const ProductDetails({Key? key}) : super(key: key);

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final productsProvider =
        Provider.of<ProductProvider>(context, listen: false);
    final productId = ModalRoute.of(context)!.settings.arguments as String;
    final getCurrentProduct = productsProvider.findByProdId(productId);

    if (getCurrentProduct == null) {
      // Handle case where product is not found or loading
      return Scaffold(
        appBar: AppBar(
          title: Text("Product Details"),
        ),
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(getCurrentProduct.productTitle),
        leading: Padding(
          padding: const EdgeInsets.all(8),
          child: IconButton(
            onPressed: () {
              Navigator.maybePop(context); // Better handling for back navigation
            },
            icon: Icon(
              Icons.arrow_back,
              size: 18,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            FancyShimmerImage(
              imageUrl: getCurrentProduct.productImage,
              height: size.height * 0.38,
              width: double.infinity,
              boxFit: BoxFit.contain,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          getCurrentProduct.productTitle,
                          style: TextStyle(fontFamily: "Montserrat"),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      // Price
                      Text(
                        "${getCurrentProduct.productPrice}\$",
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: SizedBox(
                            height: kBottomNavigationBarHeight - 10,
                            child: ElevatedButton.icon(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.lightBlue,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                              onPressed: () {},
                              icon: Icon(Icons.add_shopping_cart_sharp),
                              label: const Text("Add to cart"),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "About this item",
                      ),
                      Text(getCurrentProduct.productCategory),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(getCurrentProduct.productDescription),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
