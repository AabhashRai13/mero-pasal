import 'package:flutter/material.dart';
import 'package:pasal/models/cart.dart';
import 'package:pasal/presentation/resources/color_manager.dart';
import 'package:pasal/presentation/resources/size_config.dart';

class CartCard extends StatelessWidget {
  const CartCard({
    Key? key,
    required this.cart,
  }) : super(key: key);

  final Cart cart;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 88,
          child: AspectRatio(
            aspectRatio: 0.88,
            child: Container(
              padding: EdgeInsets.all(getProportionateScreenWidth(10)),
              decoration: BoxDecoration(
                color: const Color(0xFFF5F6F9),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Image.asset("cart.product.img[0]"),
            ),
          ),
        ),
        const SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "cart.cartProduct.title",
              style:  TextStyle(color: Colors.black, fontSize: 16),
              maxLines: 2,
            ),
            const SizedBox(height: 10),
            Text.rich(
              TextSpan(
                text: "\$${"cart.product.price"}",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: ColorManager.kPrimaryColor),
                children: [
                  TextSpan(
                      text: " x${"cart.numOfItem"}",
                      style: Theme.of(context).textTheme.bodyText1),
                ],
              ),
            )
          ],
        )
      ],
    );
  }
}
