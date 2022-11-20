import 'package:flutter/material.dart';
import 'package:pasal/presentation/resources/color_manager.dart';
import 'package:pasal/presentation/resources/strings_manager.dart';

import '../../resources/size_config.dart';

class IntroScreenContent extends StatelessWidget {
  const IntroScreenContent({
    Key? key,
    this.text,
    this.image,
  }) : super(key: key);
  final String? text, image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const Spacer(),
        Text(
          AppStrings.appTitle,
          style: TextStyle(
            fontSize: getProportionateScreenWidth(36),
            color: ColorManager.kPrimaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          text!,
          textAlign: TextAlign.center,
        ),
        const Spacer(flex: 2),
        Image.asset(
          image!,
          height: getProportionateScreenHeight(265),
          width: getProportionateScreenWidth(235),
        ),
      ],
    );
  }
}
