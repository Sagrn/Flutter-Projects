// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final title;
  final price;
  final image;
  final Color backgroundColor;
  const ProductCard({
    super.key,
    required this.title,
    required this.price,
    required this.image,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: backgroundColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 10),
          Text('\$$price', style: Theme.of(context).textTheme.bodySmall),
          const SizedBox(height: 10),
          Center(child: Image.asset(image, height: 175))
        ],
      ),
    );
  }
}
