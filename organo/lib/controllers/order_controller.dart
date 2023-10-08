import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:organo/helper/errorhandling.dart';
import 'package:organo/models/order_model.dart';
import 'package:organo/utlis/app_constants.dart';
import 'package:http/http.dart' as http;
import '../base/show_custom_snackbar.dart';
import '../data/api/api_client.dart';
import '../data/api/repository/order_repo.dart';

class OrderController extends GetxController implements GetxService {
  OrderRepo orderRepo;
  bool get isLoading => isLoading;
  OrderController({required this.orderRepo});
  bool _isLoading() => false;
  late List<OrderModel> _currentOrderList;
  late List<OrderModel> _historyOrderList;

  List<OrderModel> get currentOrderList => _currentOrderList;
  List<OrderModel> get historyOrderList => _historyOrderList;
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

  Future<void> getOrderList() async {
    bool _isLoading = true;

    Response response = await orderRepo.getOrderList();
    if (response.statusCode == 200) {
      _historyOrderList = [];
      _currentOrderList = [];
      response.body.forEach((order) {
        OrderModel orderModel = OrderModel.fromJson(order);
        if (orderModel.orderStatus == 'pending' ||
            orderModel.orderStatus == 'accepted' ||
            orderModel.orderStatus == 'processing') {
          _currentOrderList.add(orderModel);
        } else {
          _historyOrderList.add(orderModel);
        }
      });
    } else {
      _historyOrderList = [];
      _currentOrderList = [];
    }
    _isLoading = false;
    print("The length of the orders" + _currentOrderList.length.toString());
    print("The length of the orders" + _historyOrderList.length.toString());
    update();
  }
}
