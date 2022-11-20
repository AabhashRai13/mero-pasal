import 'package:flutter/material.dart';
import 'package:pasal/models/products.dart';
import 'package:pasal/presentation/resources/size_config.dart';
import 'package:pasal/presentation/widgets/product_card.dart';

import 'section_title.dart';

class PopularProducts extends StatelessWidget {
  const PopularProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SectionTitle(title: "Popular Products", press: () {}),
        ),
        SizedBox(height: getProportionateScreenWidth(20)),
        SizedBox(
          height: getProportionateScreenHeight(300),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: demoProducts.length,
            itemBuilder: (context, index) {
              if (demoProducts[index].isPopular) {
                return ProductCard(product: demoProducts[index]);
              }

              return const SizedBox.shrink();
            },
          ),
        )
      ],
    );
  }
}
