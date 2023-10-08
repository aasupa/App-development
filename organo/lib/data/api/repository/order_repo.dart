import 'package:get/get.dart';
import 'package:organo/data/api/api_client.dart';
import 'package:organo/utlis/app_constants.dart';

class OrderRepo {
  final ApiClient apiClient;
  OrderRepo({required this.apiClient});

  Future<Response> getOrderList() async {
    return await apiClient.getData(AppConstants.ORDERS_LIST_URI);
  }
}
