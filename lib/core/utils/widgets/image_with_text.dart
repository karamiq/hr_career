import 'package:app/common_lib.dart';
import 'package:flutter/material.dart';

class IconWithText extends StatelessWidget {
  const IconWithText({
    super.key,
    required this.imagePath,
    required this.text,
    this.textColor,
    this.fontSize = 14,
    this.fontWeight = FontWeight.w400,
  });

  final String imagePath, text;
  final Color? textColor;
  final double? fontSize;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(imagePath, fit: BoxFit.contain),
          const Gap(Insets.medium),
          Text(
            text,
            style: context.textTheme.bodyMedium?.copyWith(
              color: textColor ?? context.colorScheme.onSurface,
              fontSize: fontSize,
              fontWeight: fontWeight,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
