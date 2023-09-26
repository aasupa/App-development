import 'package:get/get.dart';
import 'package:organo/pages/food/popular_food_detail.dart';
import 'package:organo/pages/food/recommended_food_detail.dart';
import 'package:organo/pages/home/main_organo_page.dart';

class RouteHelper {
  static const String initial = "/";
  static const String popularFood = "/popular-food";
  static const String recommendedFood = "/recommended-food";
  static String getInitial() => '$initial';
  static String getPopularFood(int pageId) => '$popularFood?pageId=$pageId';
  static String getRecommendedFood(int pageId) =>
      '$recommendedFood?pageId=$pageId';
  static List<GetPage> routes = [
    GetPage(name: initial, page: () => MainOrganoPage()),
    GetPage(
        name: popularFood,
        page: () {
          var pageId = Get.parameters['pageId'];
          return PopularFoodDetail(pageId: int.parse(pageId!));
        },
        transition: Transition.circularReveal),
    GetPage(
        name: recommendedFood,
        page: () {
          var pageId = Get.parameters['pageId'];
          return RecommenedFoodDetail(pageId: int.parse(pageId!));
        },
        transition: Transition.circularReveal),
  ];
}
