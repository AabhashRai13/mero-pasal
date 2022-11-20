import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pasal/presentation/intro_screen/intro_screen_controller/intro_screen_controller.dart';
import 'package:pasal/presentation/resources/color_manager.dart';
import 'package:pasal/presentation/resources/duration_constants.dart';
import 'package:pasal/presentation/resources/routes_manager.dart';
import 'package:pasal/presentation/resources/size_config.dart';
import 'package:pasal/presentation/resources/strings_manager.dart';
import 'package:pasal/presentation/widgets/default_button.dart';
import 'intro_screen_content.dart';

class IntroScreenBody extends StatefulWidget {
  const IntroScreenBody({super.key});

  @override
  IntroScreenBodyState createState() => IntroScreenBodyState();
}

class IntroScreenBodyState extends State<IntroScreenBody> {
  final IntroScreenController introScreenController =
      Get.put(IntroScreenController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: PageView.builder(
                onPageChanged: (value) {
                  introScreenController.assignPage(value);
                },
                itemCount: introScreenController.introScreenData.length,
                itemBuilder: (context, index) => IntroScreenContent(
                  image: introScreenController.introScreenData[index].imgString,
                  text: introScreenController.introScreenData[index].text,
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(20)),
                child: Column(
                  children: <Widget>[
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        introScreenController.introScreenData.length,
                        (index) => Obx(() => buildDot(index: index)),
                      ),
                    ),
                    const Spacer(flex: 3),
                    DefaultButton(
                      text: AppStrings.continueText,
                      press: () {
                        Navigator.pushReplacementNamed(context, Routes.signIn);
                      },
                    ),
                    const Spacer(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  AnimatedContainer buildDot({int? index}) {
    return AnimatedContainer(
      duration: kAnimationDuration,
      margin: const EdgeInsets.only(right: 5),
      height: 6,
      width: introScreenController.currentPage.value == index ? 20 : 6,
      decoration: BoxDecoration(
        color: introScreenController.currentPage.value == index
            ? ColorManager.kPrimaryColor
            : ColorManager.iconGrey,
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}
