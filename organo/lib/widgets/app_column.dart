import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:organo/widgets/small_text.dart';

import '../utlis/colors.dart';
import '../utlis/dimensions.dart';
import 'big_text.dart';
import 'icon_and_text_widget.dart';

class AppColumn extends StatelessWidget {
  final String text;
  const AppColumn({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BigText(text: text, size: Dimensions.font26),
        SizedBox(height: Dimensions.height10),
        Row(children: [
          Wrap(
            children: List.generate(
                5,
                (index) =>
                    Icon(Icons.star, color: AppColors.mainColor, size: 15)),
          ),
          SizedBox(width: 10),
          SmallText(text: "4.5"),
          SizedBox(width: 10),
          SmallText(text: "1287"),
          SizedBox(width: 10),
          SmallText(text: "comments"),
        ]),
        SizedBox(height: Dimensions.height20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconAndTextWidget(
                icon: Icons.circle_sharp,
                text: "Normal",
                iconColor: AppColors.iconColor1),
            IconAndTextWidget(
                icon: Icons.energy_savings_leaf,
                text: "Organic",
                iconColor: AppColors.mainColor),
            IconAndTextWidget(
                icon: Icons.check_box,
                text: "approved",
                iconColor: AppColors.iconColor2),
          ],
        )
      ],
    );
  }
}
