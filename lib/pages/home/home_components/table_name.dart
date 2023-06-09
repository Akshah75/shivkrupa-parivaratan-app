import 'package:flutter/material.dart';

class TabelName extends StatelessWidget {
  const TabelName({
    super.key,
    required this.name,
    required this.color,
  });
  final String name;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Text(
      name,
      style: TextStyle(
        fontSize: 12,
        color: color,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
