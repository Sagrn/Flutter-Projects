import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/provider/cart_provider.dart';

class ProductDeatilpage extends StatefulWidget {
  final Map<String, Object> product;
  const ProductDeatilpage({
    super.key,
    required this.product,
  });

  @override
  State<ProductDeatilpage> createState() => _ProductDeatilpageState();
}

class _ProductDeatilpageState extends State<ProductDeatilpage> {
  int selectedSize = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Details'),
      ),
      body: Column(
        children: [
          Text(
            widget.product['title'] as String,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const Spacer(),
          Image.asset(widget.product['imageUrl'] as String, height: 250),
          const Spacer(flex: 2),
          Container(
            height: 250,
            decoration: BoxDecoration(
              color: const Color.fromRGBO(245, 247, 249, 1),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Column(
              children: [
                Text(
                  '\$${widget.product['price']}',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 50,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: (widget.product['size'] as List<int>).length,
                    itemBuilder: (context, index) {
                      final size = (widget.product['size'] as List<int>)[index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedSize = size;
                            });
                          },
                          child: Chip(
                            label: Text(
                              size.toString(),
                            ),
                            backgroundColor: selectedSize == size
                                ? Theme.of(context).colorScheme.primary
                                : null,
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ElevatedButton.icon(
                    icon: const Icon(
                      Icons.shopping_cart,
                      color: Color.fromRGBO(0, 0, 0, 1),
                    ),
                    onPressed: () {
                      if (selectedSize != 0) {
                        Provider.of<CartProvider>(context, listen: false)
                            .addProduct({
                          'id': widget.product['id'],
                          'title': widget.product['title'],
                          'price': widget.product['price'],
                          'imageUrl': widget.product['imageUrl'],
                          'company': widget.product['company'],
                          'size': selectedSize,
                        });

                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Product is added to Cart"),
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Plase select the size"),
                          ),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      minimumSize: const Size(double.infinity, 50),
                    ),
                    label: Text(
                      'Add To Cart',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
