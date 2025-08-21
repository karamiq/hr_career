import 'package:app/core/network/dio_models.dart';
import 'package:app/core/theme/constant_colors.dart';
import 'package:flutter/material.dart';

class ThemeSwitch extends StatefulWidget {
  final bool value;
  final ValueChanged<bool> onChanged;
  final Color activeColor;
  final Color inactiveColor;

  const ThemeSwitch({
    super.key,
    required this.value,
    required this.onChanged,
    this.activeColor = Colors.green,
    this.inactiveColor = Colors.grey,
  });

  @override
  State<ThemeSwitch> createState() => _ThemeSwitchState();
}

class _ThemeSwitchState extends State<ThemeSwitch> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => widget.onChanged(!widget.value),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: 50,

        padding: const EdgeInsets.symmetric(horizontal: 4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: widget.value ? widget.activeColor : widget.inactiveColor,
        ),
        child: AnimatedAlign(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          alignment: widget.value ? Alignment.centerRight : Alignment.centerLeft,
          child: Container(
            width: 18,
            height: 18,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: ConstantColors.white,
              boxShadow: [BoxShadow(color: Colors.black26, offset: Offset(0, 2), blurRadius: 4)],
            ),
          ).withPadding(Insets.extraSmallAll),
        ),
      ),
    );
  }
}
