import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:pasal/app/constants/enums.dart';
import 'package:pasal/data/local/shared_preferences/shared_preferences_manager.dart';
import 'package:pasal/data/network/api_auth_provider.dart';
import 'package:pasal/models/token.dart';
import 'package:pasal/presentation/base%20model/base_model.dart';
import 'package:pasal/presentation/resources/routes_manager.dart';

class SignInController extends BaseController {
  final formKey = GlobalKey<FormState>();
  final ApiAuthProvider apiAuthProvider = ApiAuthProvider();
  final SharedPreferencesManager sharedPreferencesManager =
      SharedPreferencesManager();
  Token? token;
  String? name;
  String? password;
  List errors = [].obs;
  RxBool? remember = false.obs;
  void addError({String? error}) {
    if (!errors.contains(error)) {
      errors.add(error);
    }
  }

  void removeError({String? error}) {
    if (errors.contains(error)) {
      errors.remove(error);
    }
  }

  void loginUser(Map map) async {
    setState(ViewState.busy);
    token = await apiAuthProvider.login(map);

    if (token == null) {
      Fluttertoast.showToast(
          msg: "Check your credentials",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.TOP,
          backgroundColor: Colors.blue[300],
          textColor: Colors.white,
          fontSize: 16.0);
      setState(ViewState.error);
    } else {
      await sharedPreferencesManager.putAccessToken(token!.accessToken);
      log("access token ${token!.username}");

      await sharedPreferencesManager.putBool(
          SharedPreferencesManager.keyIsLogin, true);

      Get.offAllNamed(Routes.loginSuccessScreen);

      setState(ViewState.retrieved);
    }
  }

  void mapInputsLogin() {
    Map map = {"username": name, "password": password};
    loginUser(map);
  }

  void changeRememberValue(bool value) => remember!.value = value;
}
