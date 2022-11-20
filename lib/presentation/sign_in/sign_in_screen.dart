import 'package:flutter/material.dart';
import 'package:pasal/presentation/resources/strings_manager.dart';

import 'components/sign_in_body.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.signIn),
      ),
      body: const SignInBody(),
    );
  }
}
