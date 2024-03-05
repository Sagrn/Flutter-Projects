import 'package:flutter/material.dart';
import 'package:shop_app/global_variable.dart';
import 'package:shop_app/widgets/product_card.dart';
import 'package:shop_app/pages/product_detail_page.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  final List<String> filters = const ['All', 'Addidas', 'Nike', 'Bata'];

  late String selectedFilter;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedFilter = filters[0];
  }

  @override
  Widget build(BuildContext context) {
    const Textborder = OutlineInputBorder(
      borderSide: BorderSide(color: Color.fromRGBO(225, 225, 225, 1)),
      borderRadius: BorderRadius.horizontal(left: Radius.circular(50)),
    );

    final size = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  "Shoes\nCollections",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              const Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Enter',
                    prefixIcon: Icon(
                      Icons.search,
                    ),
                    border: Textborder,
                    enabledBorder: Textborder,
                    focusedBorder: Textborder,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 120,
            child: ListView.builder(
              itemCount: filters.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final filter = filters[index];

                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedFilter = filter;
                      });
                    },
                    child: Chip(
                      backgroundColor: selectedFilter == filter
                          ? Theme.of(context).colorScheme.primary
                          : const Color.fromRGBO(245, 247, 249, 1),
                      label: Text(filter),
                      labelStyle: const TextStyle(fontSize: 16),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 12),
                      elevation: 1.0,
                      side: const BorderSide(
                        color: Color.fromRGBO(245, 247, 249, 1),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: (size >= 1080)
                ? GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 2, crossAxisCount: 2),
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      final product = products[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) {
                                return ProductDeatilpage(product: product);
                              },
                            ),
                          );
                        },
                        child: ProductCard(
                          title: product['title'],
                          price: product['price'] as double,
                          image: product['imageUrl'] as String,
                          backgroundColor: index.isEven
                              ? const Color.fromRGBO(216, 240, 253, 1)
                              : const Color.fromRGBO(245, 247, 249, 1),
                        ),
                      );
                    })
                : ListView.builder(
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      final product = products[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) {
                                return ProductDeatilpage(product: product);
                              },
                            ),
                          );
                        },
                        child: ProductCard(
                          title: product['title'],
                          price: product['price'] as double,
                          image: product['imageUrl'] as String,
                          backgroundColor: index.isEven
                              ? const Color.fromRGBO(216, 240, 253, 1)
                              : const Color.fromRGBO(245, 247, 249, 1),
                        ),
                      );
                    }),
          ),
          // Expanded(
          //   child: ListView.builder(
          //       itemCount: products.length,
          //       itemBuilder: (context, index) {
          //         final product = products[index];
          //         return GestureDetector(
          //           onTap: () {
          //             Navigator.of(context).push(
          //               MaterialPageRoute(
          //                 builder: (context) {
          //                   return ProductDeatilpage(product: product);
          //                 },
          //               ),
          //             );
          //           },
          //           child: ProductCard(
          //             title: product['title'],
          //             price: product['price'] as double,
          //             image: product['imageUrl'] as String,
          //             backgroundColor: index.isEven
          //                 ? const Color.fromRGBO(216, 240, 253, 1)
          //                 : const Color.fromRGBO(245, 247, 249, 1),
          //           ),
          //         );
          //       }),
          // )
        ],
      ),
    );
  }
}
