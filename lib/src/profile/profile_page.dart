import 'package:app/common_lib.dart';
import 'package:app/src/profile/components/profile_body.dart';
import 'package:flutter/material.dart';
import 'components/profile_header.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: context.theme.scaffoldBackgroundColor,
      body: SingleChildScrollView(
        child: ColumnPadded(
          crossAxisAlignment: CrossAxisAlignment.start,
          gap: Insets.medium,
          children: [const ProfileHeader(), ProfileBody()],
        ),
      ),
    );
  }
}
