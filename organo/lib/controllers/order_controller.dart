import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:organo/helper/errorhandling.dart';
import 'package:organo/models/order_model.dart';
import 'package:organo/utlis/app_constants.dart';
import 'package:http/http.dart' as http;
import '../base/show_custom_snackbar.dart';
import '../data/api/api_client.dart';

class OrderController {
  // ApiClient? apiClient;

  // void order({
  //   required BuildContext context,
  //   required int userId,
  //   required String? txnId,
  //   required double? txnAmount,
  //   // required String? orderStatus,
  //   // required String? paymentStatus
  // }) async {
  //   OrderModel order =
  //       OrderModel(userId: userId, txnId: txnId, txnAmount: txnAmount);

  //   // await apiClient!.postData(AppConstants.ORDERS_URI, order.toJson());

  // }
  void placeOrder(
      {required BuildContext context,
      required int userId,
      required String? txnId,
      required String? txnAmount,
      String? orderStatus,
      String? paymentStatus}) async {
    // final userProvider = Provider.of<UserProvider>(context, listen: false);

    try {
      print("__________________");
      print(txnId);
      const String uri = AppConstants.BASE_URL + AppConstants.ORDERS_URI;
      print(uri);
      http.Response res = await http.post(Uri.parse(uri),
          headers: <String, String>{
            'Content-Type': "application/json; charset=UTF-8",
            // "x-auth-token": userProvider.user.token
          },
          body: jsonEncode({
            "userId": userId,
            "orderStatus": "Pending",
            "paymentStatus": "",
            "txnId": txnId,
            "txnAmount": txnAmount
          }));

      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () {
            print("place order fnnnnnnnnnnnn");
            // showSnackBar(context, "Your order has been placed!");

            // clearing cart after successful order
            // User user = userProvider.user.copyWith(cart: []);
            // userProvider.setUserFromModel(user);

            // //Navigate to  success screen after sucessful order
            // Navigator.popAndPushNamed(context, SuccessOrder.routeName);
          });
    } catch (e) {
      showCustomSnackBar(e.toString());
      print("ordrer ma eroor -------------------------");
    }
  }
}
