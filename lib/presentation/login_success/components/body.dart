import 'package:flutter/material.dart';
import 'package:pasal/presentation/resources/assets_manager.dart';
import 'package:pasal/presentation/resources/routes_manager.dart';
import 'package:pasal/presentation/resources/size_config.dart';
import 'package:pasal/presentation/resources/strings_manager.dart';
import 'package:pasal/presentation/widgets/default_button.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: SizeConfig.screenHeight * 0.04),
        Image.asset(
          ImageAssets.success,
          height: SizeConfig.screenHeight * 0.4, //40%
        ),
        SizedBox(height: SizeConfig.screenHeight * 0.08),
        Text(
          AppStrings.loginSuccess,
          style: TextStyle(
            fontSize: getProportionateScreenWidth(30),
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const Spacer(),
        SizedBox(
          width: SizeConfig.screenWidth * 0.6,
          child: DefaultButton(
            text: "Back to home",
            press: () {
              Navigator.pushNamed(context, Routes.home);
            },
          ),
        ),
        const Spacer(),
      ],
    );
  }
}
