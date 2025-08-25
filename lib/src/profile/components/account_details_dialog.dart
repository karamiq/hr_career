import 'package:flutter/material.dart';

import '../../../common_lib.dart';
import '../../notification/components/app_dialog.dart';

class AccountDetailsDialog extends StatelessWidget {
  const AccountDetailsDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return AppDialog(
      title: l10n.accountDetails,
      child: ColumnPadded(
        gap: Insets.small,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          infoFeild(context, text: 'Karam Rasheed Tawfeeq'),
          infoFeild(context, text: 'Mobile Application Developer'),
          infoFeild(context, text: 'Computer Engineer'),
          infoFeild(context, text: '2004/11/11'),
        ],
      ),
    );
  }

  Widget infoFeild(BuildContext context, {required String text}) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = context.textTheme;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: Insets.medium, vertical: Insets.sm),
      width: double.infinity,
      decoration: BoxDecoration(color: colorScheme.background, borderRadius: BorderSize.extraSmallRadius),
      child: Text(text, style: textTheme.titleLarge?.copyWith(fontSize: 18, fontWeight: FontWeight.bold)),
    );
  }
}
