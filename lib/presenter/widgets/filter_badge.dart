import 'package:flutter/material.dart';

class FilterBadge extends StatelessWidget {
  final int count;
  final Color badgeColor;
  final Color textColor;
  final double size;

  const FilterBadge({
    super.key,
    required this.count,
    this.badgeColor = Colors.red,
    this.textColor = Colors.white,
    this.size = 18,
  });

  @override
  Widget build(BuildContext context) {
    // Se count <= 0, não exibe nada
    if (count <= 0) return const SizedBox.shrink();

    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: badgeColor,
        shape: BoxShape.circle,
      ),
      alignment: Alignment.center,
      child: Text(
        '$count',
        style: TextStyle(
          color: textColor,
          fontSize: size * 0.6,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
