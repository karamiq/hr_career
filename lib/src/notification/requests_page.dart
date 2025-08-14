import 'package:app/common_lib.dart';
import 'package:app/src/components/custom_app_bar.dart';
import 'package:app/src/notification/components/upper_navigation_bar.dart';
import 'package:app/src/notification/components/upper_navigation_button.dart';
import 'package:flutter/material.dart';

class RequestsPage extends StatefulWidget {
  final Widget child;
  const RequestsPage({super.key, required this.child});

  @override
  State<RequestsPage> createState() => _RequestsPageState();
}

class _RequestsPageState extends State<RequestsPage> {
  List<String> get _navigationPages => [RoutesDocument.requestsHistory, RoutesDocument.requestsFormPage];

  int _getCurrentNavigationIndex() {
    final currentPath = GoRouterState.of(context).matchedLocation; // Better than fullPath here
    if (currentPath.startsWith(RoutesDocument.requestsHistory)) return 0;
    if (currentPath.startsWith(RoutesDocument.requestsFormPage)) return 1;

    return 0;
  }

  void _navigateToSection(int index) {
    if (index >= 0 && index < _navigationPages.length) {
      GoRouter.of(context).go(_navigationPages[index]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Request & Notifications"),
      body: SafeArea(
        child: Padding(
          padding: Insets.smallAll,
          child: Column(
            children: [
              UpperNavigationBar(
                selectedIndex: _getCurrentNavigationIndex(),
                onTabChanged: _navigateToSection,
                tabs: [
                  UpperNavigationBarButton(label: context.l10n.record),
                  UpperNavigationBarButton(label: context.l10n.create),
                ],
              ),
              const SizedBox(height: Insets.medium), // Space between navigation bar and content
              Expanded(child: widget.child),
            ],
          ),
        ),
      ),
    );
  }
}

// class NotificationPage extends ConsumerWidget {
//   const NotificationPage({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     return Scaffold(
//       appBar: CustomAppBar(title: 'Requests'),

//       body: Container(
//         child: true
//             ? ListView.separated(
//                 separatorBuilder: (context, index) => const Gap(Insets.small),
//                 itemCount: 10, // Example count, replace with actual data length
//                 itemBuilder: (context, index) {
//                   return NotificationCard(
//                     title: 'اشعار جديد',
//                     subtitle: 'هذا هو نص الاشعار الذي تم استلامه',
//                     time: '14:35',
//                     iconPath: Assets.assetsSvgNotification,
//                   );
//                 },
//               )
//             : EmptyNotifications(onPressed: () {}),
//       ),
//     );
//   }
// }
