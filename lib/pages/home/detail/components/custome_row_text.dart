import 'package:flutter/material.dart';

class CustomeRowtext extends StatelessWidget {
  const CustomeRowtext({
    super.key,
    required this.title,
    required this.subTitle,
    this.fontWeight = FontWeight.normal,
  });

  final String title, subTitle;
  final FontWeight fontWeight;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size.width;
    print(size * 0.639);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          // width: 115,
          width: size * 0.25,
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 13.5,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        SizedBox(
          // width: 250,
          width: size * 0.639,
          child: Text(
            subTitle,
            style: TextStyle(fontWeight: fontWeight),
          ),
        ),
      ],
    );
  }
}
