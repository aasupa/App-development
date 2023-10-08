import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:organo/base/show_custom_snackbar.dart';
// import 'package:project/constants/utils.dart';

void httpErrorHandle(
    {required http.Response response,
    required BuildContext context,
    required VoidCallback onSuccess}) {
  print(response.statusCode);
  switch (response.statusCode) {
    case 200:
      onSuccess();
      break;
    case 400:
      showCustomSnackBar(jsonDecode(response.body)['msg']);
      // showSnackBar(context, jsonDecode(response.body)['msg']);
      break;
    case 500:
      print("Error ayoo reeeee");
      // showSnackBar(context, jsonDecode(response.body)['error']);
      showCustomSnackBar(jsonDecode(response.body)['error']);
      print(jsonDecode(response.body)['error']);
      print(jsonDecode(response.body));

      break;
    default:
      // showSnackBar(context, response.body);
      showCustomSnackBar(response.body);
      print(response.body);
  }
}
