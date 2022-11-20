import 'package:flutter/material.dart';
import 'package:pasal/presentation/resources/strings_manager.dart';

import 'components/body.dart';

class SignUpScreen extends StatelessWidget {
  static String routeName = "/sign_up";

  const SignUpScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.signUp),
      ),
      body: const Body(),
    );
  }
}
