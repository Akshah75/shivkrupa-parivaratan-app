import 'package:flutter/material.dart';

class DetailPageDataRow extends StatelessWidget {
  const DetailPageDataRow({
    super.key,
    required this.title,
    required this.subTitle,
  });
  final String title, subTitle;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.spaceBetween,
      spacing: 50,
      runSpacing: 20,
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
          subTitle,
        ),
      ],
    );
  }
}
