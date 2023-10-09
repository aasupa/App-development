import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:organo/controllers/auth_controller.dart';
import 'package:organo/pages/order/view_order.dart';
import 'package:organo/utlis/colors.dart';
import 'package:organo/utlis/dimensions.dart';

import '../../controllers/order_controller.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({Key? key}) : super(key: key);

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> with TickerProviderStateMixin {
  late TabController _tabController;
  late bool _isLoggedIn;

  @override
  void initState() {
    super.initState();
    _isLoggedIn = Get.find<AuthController>().userLoggedIn();
    if (_isLoggedIn) {
      _tabController = TabController(length: 2, vsync: this);

      // Get.find<OrderController>().getOrderList();
    }
    // _tabController == _isLoggedIn
    //     ? TabController(length: 2, vsync: this)
    //     : TabController(R
    //         length: 2,
    //         vsync: this); // Initialize with length 0 if not logged in

    // if (_isLoggedIn) {
    //   Get.find<OrderController>().getOrderList();
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My orders"),
        backgroundColor: AppColors.mainColor,
      ),
      body: Column(
        children: [
          Container(
            width: Dimensions.screenWidth,
            child: TabBar(
              indicatorColor: Theme.of(context).primaryColor,
              indicatorWeight: 3,
              labelColor: Colors.green,
              unselectedLabelColor: AppColors.yellowColor,
              controller: _tabController,
              tabs: const [Tab(text: "current"), Tab(text: "history")],
            ),
          ),
          Expanded(
            child: TabBarView(controller: _tabController, children: const [
              Text("Order ID: 1110,"
                  "Order amount: 28,"
                  "Payment Status: Paid, Order Status: Pending "),
              // Text("Order2"),
              // ViewOrder(isCurrent: true),
              // ViewOrder(isCurrent: false)
            ]),
          )
        ],
      ),
    );
  }
}
