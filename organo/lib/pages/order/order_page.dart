import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:organo/controllers/auth_controller.dart';
import 'package:organo/utlis/colors.dart';
import 'package:organo/utlis/dimensions.dart';

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
    _tabController = _isLoggedIn
        ? TabController(length: 2, vsync: this)
        : TabController(
            length: 2,
            vsync: this); // Initialize with length 0 if not logged in
    //Get.find<OrderController>().getOrderList();
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
              tabs: [Tab(text: "current"), Tab(text: "history")],
            ),
          ),
          Expanded(
            child: TabBarView(
                controller: _tabController,
                children: [Text("order1"), Text("order2")]),
          )
        ],
      ),
    );
  }
}
