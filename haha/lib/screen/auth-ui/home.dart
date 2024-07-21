import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:haha/components/categoriestile.dart';
import 'package:haha/components/product_widget.dart';
import 'package:haha/provider/product_provider.dart';
import 'package:haha/widgets/Appwidget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> categories = [
    "assets/images/all.jpg",
    "assets/images/iphone.jpg",
    "assets/images/iphone2.png",
    "assets/images/airpod.jpg",
    "assets/images/ipad.jpg",
  ];

  List<String> categoriesName = [
    "Tất cả",
    "Iphone",
    "Samsung",
    "Airpod",
    "Ipad",
  ];

  final bannerImages = [
    'assets/images/banner1.jpg',
    'assets/images/banner2.jpg',
  ];

  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    return Scaffold(
      backgroundColor: Color(0xfff2f2f2),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(top: 50, left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hey, bruh',
                        style: AppWidget.boldTextFeildStyle(),
                      ),
                      Text(
                        "Good morning",
                        style: AppWidget.smlightTextFeildStyle(),
                      ),
                    ],
                  ),
                  Image.asset(
                    'assets/images/person.png',
                    height: 50,
                    width: 50,
                  ),
                ],
              ),
              // Carousel Slider
              CarouselSlider(
                options: CarouselOptions(
                  autoPlay: true,
                  enlargeCenterPage: true,
                  aspectRatio: 2.0,
                  onPageChanged: (index, reason) {
                    _pageController.animateToPage(
                      index,
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeIn,
                    );
                  },
                ),
                items: bannerImages.map((image) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: Image.asset(image, fit: BoxFit.fill),
                      );
                    },
                  );
                }).toList(),
              ),
              // Smooth Page Indicator
              Center(
                child: SmoothPageIndicator(
                  controller: _pageController,
                  count: bannerImages.length,
                  effect: WormEffect(
                    dotHeight: 8.0,
                    dotWidth: 8.0,
                    activeDotColor: Colors.orange,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              // Categories
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Nhà sản xuất",
                    style: AppWidget.DarklightTextFeildStyle(),
                  ),
                  Text(
                    "Xem hết",
                    style: AppWidget.OrangelightTextFeildStyle(),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.only(left: 5),
                height: 100,
                child: ListView.builder(
                  itemCount: categories.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Categoriestile(
                      image: categories[index],
                      categoriesName: categoriesName[index],
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 20,


                
              ),
              // Product Section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Tất cả sản phẩm",
                    style: AppWidget.DarklightTextFeildStyle(),
                  ),
                  Text(
                    "Xem ngay",
                    style: AppWidget.OrangelightTextFeildStyle(),
                  ),
                ],
              ),
              DynamicHeightGridView(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                builder: (context, index) {
                  return ChangeNotifierProvider.value(
                    value: productProvider.getProducts[index],
                    child: ProductWidget(
                      ProductId: productProvider.getProducts[index].productId,
                    ),
                  );
                },
                itemCount: productProvider.getProducts.length,
                crossAxisCount: 2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
