import 'package:flutter/material.dart';
import 'package:pasal/presentation/intro_screen/components/intro_screen_body.dart';

import '../resources/size_config.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return const Scaffold(
      body: IntroScreenBody(),
    );
  }
}
