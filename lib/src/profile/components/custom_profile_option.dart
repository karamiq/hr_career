import 'package:app/common_lib.dart';
import 'package:app/src/components/gradient_icon.dart';
import 'package:flutter/material.dart';

class CustomProfileOption extends StatelessWidget {
  const CustomProfileOption({
    super.key,
    required this.title,
    required this.icon,
    this.color,
    this.onPressed,
    this.trailing,
  });

  final String title;
  final String icon;
  final Color? color;
  final Widget? trailing;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderSize.extraSmallRadius,
      onTap: onPressed,

      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Insets.medium, vertical: Insets.sm),
        child: Row(
          children: [
            GradientIcon(icon),
            const Gap(Insets.small),
            Text(title),
            if (trailing != null) const Spacer(),
            if (trailing != null) trailing!,
          ],
        ),
      ),
    );
  }
}
