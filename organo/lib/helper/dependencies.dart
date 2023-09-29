import 'package:get/get.dart';
import 'package:organo/controllers/auth_controller.dart';
import 'package:organo/controllers/cart_controller.dart';
import 'package:organo/controllers/popular_product_controller.dart';
import 'package:organo/controllers/recommended_product_controller.dart';
import 'package:organo/controllers/user_controller.dart';
import 'package:organo/data/api/api_client.dart';
import 'package:organo/data/api/repository/auth_repo.dart';
import 'package:organo/data/api/repository/cart_repo.dart';
import 'package:organo/data/api/repository/popular_product_repo.dart';
import 'package:organo/data/api/repository/recommended_product_repo.dart';
import 'package:organo/utlis/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/api/repository/user_repo.dart';

Future<void> init() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  Get.lazyPut(() => sharedPreferences);
  //api client
  Get.lazyPut(() => ApiClient(
      appBasedUrl: AppConstants.BASE_URL, sharedPreferences: Get.find()));
  Get.lazyPut(
      () => AuthRepo(apiClient: Get.find(), sharedPreferences: Get.find()));
  Get.lazyPut(() => UserRepo(
        apiClient: Get.find(),
      ));
  //repos

  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => RecommendedProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => CartRepo());

  //controllers
  Get.lazyPut(() => AuthController(authRepo: Get.find()));
  Get.lazyPut(() => UserController(userRepo: Get.find()));
  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
  Get.lazyPut(
      () => RecommendedProductController(recommendedProductRepo: Get.find()));
  Get.lazyPut(() => CartController(cartRepo: Get.find()));
}
