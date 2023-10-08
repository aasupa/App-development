import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:khalti_flutter/khalti_flutter.dart';
import 'package:organo/controllers/popular_product_controller.dart';
import 'package:organo/controllers/recommended_product_controller.dart';
import 'package:organo/pages/food/popular_food_detail.dart';
import 'package:organo/pages/food/recommended_food_detail.dart';
import 'package:organo/pages/home/main_organo_page.dart';
import 'package:get/get.dart';
import 'package:organo/pages/home/organo_page_body.dart';
import 'package:organo/pages/splash/splash_page.dart';
import 'package:organo/routes/route_helper.dart';
import 'controllers/cart_controller.dart';
import 'helper/dependencies.dart' as dep;
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final sharedPreferences = await SharedPreferences.getInstance();
  await dep.init(sharedPreferences);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.find<CartController>().getCartData();

    return KhaltiScope(
        publicKey: "test_public_key_cad3794d7a3046fca732b5d44aed6dcd",
        enabledDebugging: true,
        builder: (context, navKey) {
          return GetBuilder<PopularProductController>(builder: (_) {
            return GetBuilder<RecommendedProductController>(builder: (_) {
              return GetMaterialApp(
                debugShowCheckedModeBanner: false,
                navigatorKey: navKey,
                localizationsDelegates: const [
                  KhaltiLocalizations.delegate,
                ],
                title: 'Flutter Demo',
                //home: SplashScreen(),
                // home: MainOrganoPage(),
                initialRoute: RouteHelper.getSplashPage(),
                getPages: RouteHelper.routes,
              );
            });
          });
        });
  }
}
