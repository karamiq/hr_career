import 'package:app/common_lib.dart';
import 'package:flutter/material.dart';

class CustomISvgStyle extends StatelessWidget {
  const CustomISvgStyle({super.key, required this.icon, this.size = 22, this.color});

  final String icon;
  final double size;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final appColors = context.appColors;
    return Container(
      padding: Insets.smallAll + Insets.extraSmallAll / 2,
      decoration: BoxDecoration(
        borderRadius: BorderSize.mediumRadius,
        color: color != null ? color!.withOpacity(0.3) : appColors.primary.withOpacity(.07),
      ),
      child: SvgPicture.asset(height: size, icon, color: color ?? appColors.primary),
    );
  }
}
