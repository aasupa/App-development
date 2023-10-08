import 'package:get/get.dart';
import 'package:organo/models/order_model.dart';
import 'package:organo/pages/auth/sign_in_page.dart';
import 'package:organo/pages/food/popular_food_detail.dart';
import 'package:organo/pages/food/recommended_food_detail.dart';
import 'package:organo/pages/home/home_page.dart';
import 'package:organo/pages/home/main_organo_page.dart';
import 'package:organo/pages/order/order_page.dart';
import 'package:organo/pages/payment/payment_page.dart';
import 'package:organo/pages/splash/splash_page.dart';
import 'package:organo/pages/cart/cart_page.dart';

class RouteHelper {
  static const String splashPage = "/splash-page";
  static const String initial = "/";
  static const String popularFood = "/popular-food";
  static const String recommendedFood = "/recommended-food";
  static const String cartPage = "/cart-page";
  static const String signIn = "/signin";
  static const String orderPage = "/order_page";

  static const String payment = '/payemnt';

  static String getSplashPage() => '$splashPage';
  static String getInitial() => '$initial';
  static String getPopularFood(int pageId, String page) =>
      '$popularFood?pageId=$pageId&page=$page';
  static String getSignInPage() => '$signIn';
  static String getRecommendedFood(int pageId, String page) =>
      '$recommendedFood?pageId=$pageId&page=$page';
  static String getCartPage() => '$cartPage';
  static String getPaymentPage(String id, int userId) =>
      '$payment?id=$id&userID=&userID';
  static String getOrderPage() => '$orderPage';

  static List<GetPage> routes = [
    GetPage(name: splashPage, page: () => SplashScreen()),
    GetPage(name: initial, page: () => HomePage()),
    GetPage(
        name: signIn,
        page: () {
          return SignInPage();
        },
        transition: Transition.fade),
    GetPage(
        name: popularFood,
        page: () {
          var pageId = Get.parameters['pageId'];
          var page = Get.parameters["page"];
          return PopularFoodDetail(pageId: int.parse(pageId!), page: page!);
        },
        transition: Transition.circularReveal),
    GetPage(
        name: recommendedFood,
        page: () {
          var pageId = Get.parameters['pageId'];
          var page = Get.parameters["page"];
          return RecommenedFoodDetail(pageId: int.parse(pageId!), page: page!);
        },
        transition: Transition.circularReveal),
    GetPage(
        name: cartPage,
        page: () {
          return CartPage();
        },
        transition: Transition.circularReveal),
    //
    GetPage(
      name: orderPage,
      page: () {
        return OrderPage();
      },
    )
  ];
}
