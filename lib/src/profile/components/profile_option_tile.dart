import 'package:flutter/material.dart';
import 'package:app/core/utils/constants/sizes.dart';

class ProfileOptionTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback? onTap;
  final Color? iconColor;
  final Color? textColor;
  final Widget? trailing;

  const ProfileOptionTile({
    super.key,
    required this.icon,
    required this.label,
    this.onTap,
    this.iconColor,
    this.textColor,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return ListTile(
      minVerticalPadding: Insets.medium,
      contentPadding: const EdgeInsets.symmetric(horizontal: Insets.medium),
      leading: Icon(icon, color: iconColor ?? colorScheme.onSurface),
      onTap: onTap,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(Insets.extraSmall)),
      trailing: trailing,
      title: Text(label, style: TextStyle(color: textColor ?? colorScheme.onSurface, fontSize: 16)),
    );
  }
}
