import 'package:flutter/material.dart';
import 'package:pasal/models/products.dart';

import 'components/body.dart';
import 'components/custom_app_bar.dart';

class DetailsScreen extends StatelessWidget {
  final ProductDetailsArguments productDetailsArguments;
  const DetailsScreen({super.key, required this.productDetailsArguments});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6F9),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(AppBar().preferredSize.height),
        child: CustomAppBar(rating: productDetailsArguments.product.rating),
      ),
      body: Body(product: productDetailsArguments.product),
    );
  }
}

class ProductDetailsArguments {
  final Product product;

  ProductDetailsArguments({required this.product});
}
