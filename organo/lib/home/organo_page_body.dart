import 'package:flutter/material.dart';

class OrganoPageBody extends StatefulWidget {
  const OrganoPageBody({super.key});

  @override
  State<OrganoPageBody> createState() => _OrganoPageBodyState();
}

class _OrganoPageBodyState extends State<OrganoPageBody> {
  PageController pageController = PageController(viewportFraction: 0.9);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.redAccent,
      height: 300,
      child: PageView.builder(
          controller: pageController,
          itemCount: 5,
          itemBuilder: (context, position) {
            return _buildPageItem(position);
          }),
    );
  }
}

Widget _buildPageItem(int index) {
  return Stack(
    children: [
      Container(
          height: 220,
          margin: EdgeInsets.only(
              left: 5,
              right: 5), // space between two images in mainpage carousel
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: index.isEven ? Color(0xFF69c5df) : Color(0xFF9294cc),
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/image/food0.png")))),
      Align(
        alignment: Alignment.bottomCenter,
        child: Container(
            height: 140,
            margin: EdgeInsets.only(left: 25, right: 25, bottom: 15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.white,
            )),
      ),
    ],
  );
}
