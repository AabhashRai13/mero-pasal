import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pasal/app/constants/app_constants.dart';
import 'package:pasal/models/products.dart';

import '../local/shared_preferences/shared_preferences_manager.dart';

class ApiServiceProvider {
  final SharedPreferencesManager sharedPreferencesManager =
      SharedPreferencesManager();
  String? accesstoken;
  void _printError(error, StackTrace stacktrace) {
    debugPrint('error: $error & stacktrace: $stacktrace');
  }

  Future<List<Product>?> getProduct() async {
    try {
      accesstoken = sharedPreferencesManager.getAccessToken()!;
      final response = await http.get(
        Uri.parse('${baseUrl}products'),
        headers: <String, String>{'token': 'Bearer $accesstoken'},
      );
      if (response.statusCode == 200) {
        List jsonResponse = json.decode(response.body);

        return jsonResponse.map((data) => Product.fromJson(data)).toList();
      } else {
        log('Failed to get products.');
        return null;
      }
    } catch (e, stacktrace) {
      _printError(e, stacktrace);
    }
    log('Failed to get products.');
    return null;
  }

  /// get cart
  Future<List<Product>?> getCart(int userId) async {
    try {
      accesstoken = sharedPreferencesManager.getAccessToken()!;
      final response = await http.get(
        Uri.parse('${baseUrl}cart/find/635e97430b6ba836efdeb269'),
        headers: <String, String>{'token': 'Bearer $accesstoken'},
      );
      if (response.statusCode == 200) {
        List jsonResponse = json.decode(response.body);

        return jsonResponse.map((data) => Product.fromJson(data)).toList();
      } else {
        log('Failed to get products.');
        return null;
      }
    } catch (e, stacktrace) {
      _printError(e, stacktrace);
    }
    log('Failed to get products.');
    return null;
  }
}
