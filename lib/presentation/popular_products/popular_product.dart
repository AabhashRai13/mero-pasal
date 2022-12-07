import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:pasal/app/constants/enums.dart';
import 'package:pasal/presentation/popular_products/controller/popular_product_controller.dart';
import 'package:pasal/presentation/resources/color_manager.dart';
import 'package:pasal/presentation/resources/size_config.dart';
import 'package:pasal/presentation/widgets/product_card.dart';

import '../../models/test_products.dart';
import '../home/components/section_title.dart';

class PopularProducts extends StatelessWidget {
  PopularProducts({super.key});
  final ProductListController productListController =
      Get.put(ProductListController());
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
        Obx(() => SizedBox(
              height: getProportionateScreenHeight(300),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: productListController.productResponse.length,
                itemBuilder: (context, index) {
                  if (productListController.state == ViewState.retrieved) {
                    return ProductCard(
                        product: productListController.productResponse[index]);
                  }

                  return const SizedBox.shrink();
                },
              ),
            )),
      ],
    );
  }
}

class TestProductCard extends StatelessWidget {
  const TestProductCard({
    Key? key,
    this.width = 140,
    this.aspectRetio = 1.02,
    required this.product,
  }) : super(key: key);

  final double width, aspectRetio;
  final TestProduct product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: getProportionateScreenWidth(20)),
      child: SizedBox(
        width: getProportionateScreenWidth(width),
        child: GestureDetector(
          onTap: () {
            // Navigator.pushNamed(
            //   context,
            //   Routes.detailScreen,
            //   arguments: ProductDetailsArguments(product: product),
            // );
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(
                aspectRatio: 1.02,
                child: Container(
                  padding: EdgeInsets.all(getProportionateScreenWidth(20)),
                  decoration: BoxDecoration(
                    color: ColorManager.kSecondaryColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Hero(
                    tag: product.id.toString(),
                    child: Image.asset(product.images[0]),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                product.title,
                style: const TextStyle(color: Colors.black),
                maxLines: 2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "\$${product.price}",
                    style: TextStyle(
                      fontSize: getProportionateScreenWidth(18),
                      fontWeight: FontWeight.w600,
                      color: ColorManager.kPrimaryColor,
                    ),
                  ),
                  InkWell(
                    borderRadius: BorderRadius.circular(50),
                    onTap: () {},
                    child: Container(
                      padding: EdgeInsets.all(getProportionateScreenWidth(8)),
                      height: getProportionateScreenWidth(28),
                      width: getProportionateScreenWidth(28),
                      decoration: BoxDecoration(
                        color: product.isFavourite
                            ? ColorManager.kPrimaryColor.withOpacity(0.15)
                            : ColorManager.kSecondaryColor.withOpacity(0.1),
                        shape: BoxShape.circle,
                      ),
                      child: SvgPicture.asset(
                        "assets/icons/Heart Icon_2.svg",
                        color: product.isFavourite
                            ? const Color(0xFFFF4848)
                            : const Color(0xFFDBDEE4),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
