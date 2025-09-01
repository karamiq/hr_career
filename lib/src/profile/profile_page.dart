
import 'package:app/common_lib.dart';
import 'package:app/data/providers/authentication_provider.dart';
import 'package:app/src/profile/components/profile_body.dart';
import 'package:flutter/material.dart';
import 'components/profile_header.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authentication = ref.read(authenticationProvider);
    return Scaffold(
      // floatingActionButton: Padding(
      //   padding: const EdgeInsets.only(bottom: 100),
      //   child: FloatingActionButton(
      //     onPressed: () async {
      //       final user = await ref.req(
      //         () => ref.read(userClientProvider).getUser(userId: authentication!.userID),
      //       );
      //       Map<String, dynamic> userMap = jsonDecode(user.data.data);
      //       print(userMap);
      //       Utils.showSuccessSnackBar(userMap.toString());
      //     },
      //   ),
      // ),
      backgroundColor: context.theme.scaffoldBackgroundColor,
      body: ColumnPadded(
        crossAxisAlignment: CrossAxisAlignment.start,
        gap: Insets.medium,
        children: [const ProfileHeader(), ProfileBody()],
      ),
    );
  }
}
