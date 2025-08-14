import 'package:app/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import '../../common_lib.dart';

class CustomAppBar extends ConsumerWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = context.textTheme;

    return ClipRRect(
      borderRadius: BorderRadius.vertical(bottom: Radius.circular(Insets.medium)),
      child: AppBar(
        backgroundColor: Colors.transparent, // Make background transparent
        elevation: 0,
        flexibleSpace: Container(decoration: BoxDecoration(gradient: ConstantColors.primaryGradient)),
        title: Padding(
          padding: EdgeInsets.only(top: Insets.large),
          child: Text(
            title,
            style: textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: ConstantColors.white,
            ),
          ),
        ),
        centerTitle: true,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + Insets.large);
}
