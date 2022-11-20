import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInController extends GetxController {
  final formKey = GlobalKey<FormState>();
  String? email;
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

  void changeRememberValue(bool value) => remember!.value = value;
}
