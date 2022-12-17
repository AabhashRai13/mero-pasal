import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:pasal/app/constants/enums.dart';
import 'package:pasal/presentation/widgets/custom_nav_bar.dart';

import 'components/body.dart';

class HomeScreen extends StatefulWidget {

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
   String message = "";
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final arguments = ModalRoute.of(context)!.settings.arguments;
    if (arguments != null) {
      Map? pushArguments = arguments as Map;

      setState(() {
        message = pushArguments["message"];
        log("message from notification $message");
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Body(),
      bottomNavigationBar:
           CustomBottomNavBar(selectedMenu: MenuState.home),
    );
  }
}
