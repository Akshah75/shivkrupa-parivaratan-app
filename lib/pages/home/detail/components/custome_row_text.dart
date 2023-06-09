import 'package:flutter/material.dart';

class CustomeRowtext extends StatelessWidget {
  const CustomeRowtext({
    super.key,
    required this.title,
    required this.subTitle,
  });

  final String title, subTitle;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 115,
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 13.5,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        SizedBox(
          width: 250,
          child: Text(
            subTitle,
          ),
        ),
      ],
    );
  }
}
