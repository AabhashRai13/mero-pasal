import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pasal/presentation/resources/theme.dart';
import 'package:pasal/presentation/resources/routes_manager.dart';

import 'data/local/shared_preferences/shared_preferences_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SharedPreferencesManager.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: theme(),
      onGenerateRoute: RouteGenerator.getRoute,
      initialRoute: Routes.initialScreenRoute,
    );
  }
}
