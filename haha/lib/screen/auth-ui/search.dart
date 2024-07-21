import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:haha/components/product_widget.dart';
import 'package:haha/models/product_model.dart';
import 'package:haha/provider/product_provider.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatefulWidget {
  static const rountName = "/SearchName";
  const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late TextEditingController searchCont = TextEditingController();
  List<ProductModel> productListSearch = [];

  @override
  void initState() {
    searchCont = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    String? passedCategory =
        ModalRoute.of(context)!.settings.arguments as String?;
    final List<ProductModel> productList = passedCategory == null
        ? productProvider.getProducts
        : productProvider.findByCategory(ctgName: passedCategory);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Screen'),
      ),
      body: productList.isEmpty
          ? const Center(
              child: Text("Không tìm thấy sản phẩm"),
            )
          : Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: TextFormField(
                      controller: searchCont,
                      decoration: InputDecoration(
                          filled: true,
                          contentPadding: const EdgeInsets.all(10),
                          enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 1, color: Colors.black26),
                              borderRadius: BorderRadius.circular(10)),
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 1, color: Colors.black38),
                              borderRadius: BorderRadius.circular(10)),
                          labelText: 'Search',
                          hintText: 'Enter your search query',
                          prefixIcon: IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.search),
                          ),
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                searchCont.clear();
                              });
                            },
                            icon: Icon(
                              Icons.close_rounded,
                              color: Colors.red,
                            ),
                          )),
                      onFieldSubmitted: (value) {
                        setState(() {
                          productListSearch = productProvider.searchQuery(
                              searchText: searchCont.text,
                              passedList: productList);
                        });
                      },
                      onChanged: (value){
                        setState(() {
                          productListSearch = productProvider.searchQuery(
                              searchText: searchCont.text,
                              passedList: productList);
                        });

                      },
                    
                    ),
                  ),

                  if (searchCont.text.isNotEmpty && productList.isEmpty) ...[
                    const Center(
                      child: Text(
                        "Không tìm thấy sản phẩm",
                        style: TextStyle(fontSize: 30),
                      ),
                    )
                  ],

                  Expanded(
                    child: DynamicHeightGridView(
                      shrinkWrap: true, // Added shrinkWrap property

                      builder: (context, index) {
                        return ProductWidget(
                          ProductId: searchCont.text.isNotEmpty
                              ? productListSearch[index].productId
                              : productList[index].productId,
                        );
                      },
                      itemCount: searchCont.text.isNotEmpty
                          ? productListSearch.length
                          : productList.length,
                      crossAxisCount: 2,
                    ),
                  ),
                  // Add other widgets as needed
                ],
              ),
            ),
    );
  }
}
