import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class Utils {
  static Future<bool> checkInternetConnectivity() async {
    List<ConnectivityResult> result = await Connectivity().checkConnectivity();
    return result.contains(ConnectivityResult.wifi) ||
        result.contains(ConnectivityResult.mobile);
  }

  static List<T> parseListResponse<T>(
      Response response, T Function(dynamic) converter) {
    return (jsonDecode(response.body) as List)
        .map((element) => converter(element))
        .toList();
  }

  static void showSnackbar(BuildContext context, String text) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
  }
}
