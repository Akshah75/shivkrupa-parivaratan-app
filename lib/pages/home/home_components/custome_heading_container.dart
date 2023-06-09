import 'package:flutter/material.dart';
import 'package:parivartan_app/pages/home/home_components/table_name.dart';

import '../../../constant.dart';

class CustomeHedingContainer extends StatelessWidget {
  const CustomeHedingContainer({
    super.key,
    required this.w,
    required this.title,
    this.color = whiteColor,
    this.subColor = kPrimaryColor,
    this.aligment = Alignment.center,
  });
  final double w;
  final String title;
  final Color color, subColor;
  final AlignmentGeometry aligment;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: subColor,
      alignment: aligment,
      width: w,
      child: TabelName(
        name: title,
        color: color,
      ),
    );
  }
}
