import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pasal/app/constants/enums.dart';
import 'package:pasal/presentation/resources/color_manager.dart';
import 'package:pasal/presentation/resources/routes_manager.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({
    Key? key,
    required this.selectedMenu,
  }) : super(key: key);

  final MenuState selectedMenu;
  final Color inActiveIconColor = const Color(0xFFB6B6B6);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, -15),
            blurRadius: 20,
            color: const Color(0xFFDADADA).withOpacity(0.15),
          ),
        ],
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: SafeArea(
          top: false,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                  icon: SvgPicture.asset(
                    "assets/icons/Shop Icon.svg",
                    color: MenuState.home == selectedMenu
                        ? ColorManager.kPrimaryColor
                        : inActiveIconColor,
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, Routes.home);
                  }),
              IconButton(
                icon: SvgPicture.asset("assets/icons/Heart Icon.svg"),
                onPressed: () {},
              ),
              IconButton(
                icon: SvgPicture.asset(
                  "assets/icons/User Icon.svg",
                  color: MenuState.profile == selectedMenu
                      ? ColorManager.kPrimaryColor
                      : inActiveIconColor,
                ),
                onPressed: () {
                  Navigator.pushNamed(context, Routes.profileScreen);
                },
              ),
            ],
          )),
    );
  }
}
