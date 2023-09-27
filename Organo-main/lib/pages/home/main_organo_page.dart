import 'package:flutter/material.dart';
import 'package:organo/pages/home/organo_page_body.dart';
import 'package:organo/pages/auth/sign_up_page.dart';
import 'package:organo/utlis/colors.dart';
import 'package:organo/widgets/big_text.dart';
import 'package:organo/widgets/small_text.dart';

class MainOrganoPage extends StatefulWidget {
  const MainOrganoPage({super.key});

  @override
  State<MainOrganoPage> createState() => _MainOrganoPageState();
}

class _MainOrganoPageState extends State<MainOrganoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
                          SmallText(text: "Pokhara", color: Colors.black54),
                          Icon(Icons.arrow_drop_down_rounded)
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
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(
          left: 10,
          right: 10,
        ),
        height: 60,

        // ignore: prefer_const_constructors
        decoration: BoxDecoration(color: AppColors.mainColor, boxShadow: []),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                color: Colors.white,
                iconSize: 40,
                icon: const Icon(Icons.home_outlined),
                onPressed: () {},
              ),
              IconButton(
                color: Colors.white,
                iconSize: 35,
                icon: const Icon(Icons.category_outlined),
                onPressed: () {},
              ),
              IconButton(
                color: Colors.white,
                iconSize: 35,
                icon: const Icon(Icons.shopping_cart_outlined),
                onPressed: () {},
              ),
              IconButton(
                color: Colors.white,
                iconSize: 35,
                icon: const Icon(Icons.portrait_outlined),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SignUpPage()));
                },
              ),
            ]),
      ),
    );
  }
}
