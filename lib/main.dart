import 'dart:convert';
import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pasal/presentation/resources/theme.dart';
import 'package:pasal/presentation/resources/routes_manager.dart';

import 'data/local/shared_preferences/shared_preferences_manager.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.instance
      .getToken()
      .then((value) => log("getToken :$value"));
  //If Application is in BackGround, then it will work
  FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) async {
    log("onMessageOpenedApp: $message");
    Navigator.pushNamed(navigatorKey.currentState!.context, Routes.home,
        arguments: {"message": json.encode(message.data)});
  });
  //If the application is closed or terminated
  FirebaseMessaging.instance.getInitialMessage().then((RemoteMessage? message) {
    if (message != null) {
      Navigator.pushNamed(navigatorKey.currentState!.context, Routes.home,
          arguments: {"message": json.encode(message.data)});
    }
  });
  // with out notfiying the user like updating app
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  await SharedPreferencesManager.getInstance();
  runApp(const MyApp());
}

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  log("_firebaseMessagingBackgroundHandler: $message");
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
      navigatorKey: navigatorKey,
      initialRoute: Routes.initialScreenRoute,
    );
  }
}
