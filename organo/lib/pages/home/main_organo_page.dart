import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:organo/pages/home/organo_page_body.dart';
import 'package:organo/pages/auth/sign_up_page.dart';
import 'package:organo/utlis/colors.dart';
import 'package:organo/utlis/dimensions.dart';
import 'package:organo/widgets/big_text.dart';
import 'package:organo/widgets/small_text.dart';

import '../../controllers/popular_product_controller.dart';
import '../../controllers/recommended_product_controller.dart';

class MainOrganoPage extends StatefulWidget {
  const MainOrganoPage({super.key});

  @override
  State<MainOrganoPage> createState() => _MainOrganoPageState();
}

class _MainOrganoPageState extends State<MainOrganoPage> {
  Future<void> _loadResource() async {
    await Get.find<PopularProductController>().getPopularProductList();
    await Get.find<RecommendedProductController>().getRecommendedProductList();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
        child: Column(
          children: [
            Container(
              child: Container(
                margin: EdgeInsets.only(top: 45, bottom: 15),
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        BigText(text: "ORGANO", color: AppColors.mainColor),
                        Row(
                          children: [
                            BigText(
                              text: "Grains and Oils",
                              color: Colors.black,
                              size: Dimensions.font16,
                            ),
                            Icon(Icons.arrow_downward)
                          ],
                        )
                      ],
                    ),
                    Center(
                      child: Container(
                        width: 45,
                        child: Icon(Icons.search, color: Colors.white),
                        height: 45,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: AppColors.mainColor,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
                child: SingleChildScrollView(
              child: OrganoPageBody(),
            )),
          ],
        ),
        onRefresh: _loadResource);
  }
}
