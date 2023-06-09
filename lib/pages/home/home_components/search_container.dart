import 'package:flutter/material.dart';
import '../../../constant.dart';

class SearchContainer extends StatelessWidget {
  const SearchContainer({
    super.key,
    required this.press,
  });
  final VoidCallback press;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.2),
          borderRadius: BorderRadius.circular(20)),
      margin: const EdgeInsets.all(kDefaultPadding),
      padding: const EdgeInsets.symmetric(
          horizontal: kDefaultPadding, vertical: kDefaultPadding / 4),
      child: TextField(
        onTap: press,
        readOnly: true,
        style: const TextStyle(color: whiteColor),
        decoration: const InputDecoration(
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            icon: Icon(
              Icons.search,
              color: whiteColor,
            ),
            hintText: "Search",
            hintStyle: TextStyle(color: whiteColor)),
      ),
    );
  }
}
