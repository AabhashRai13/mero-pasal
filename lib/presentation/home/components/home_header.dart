import 'package:flutter/material.dart';
import 'package:pasal/presentation/resources/assets_manager.dart';
import 'package:pasal/presentation/resources/routes_manager.dart';
import 'package:pasal/presentation/resources/size_config.dart';

import 'icon_btn_with_counter.dart';
import 'search_field.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SearchField(),
          IconBtnWithCounter(
            svgSrc: ImageAssets.cartIcon,
            press: () {
              Navigator.pushNamed(context, Routes.cart);
            },
          ),
          IconBtnWithCounter(
            svgSrc: ImageAssets.bellIcon,
            numOfitem: 3,
            press: () {},
          ),
        ],
      ),
    );
  }
}
