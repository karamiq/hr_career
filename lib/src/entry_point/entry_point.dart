import 'package:app/common_lib.dart';
import 'package:app/src/entry_point/components/custom_bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EntryPoint extends StatefulHookConsumerWidget {
  const EntryPoint({super.key, required this.child});

  final Widget child;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _EntryPointState();
}

class _EntryPointState extends ConsumerState<EntryPoint> {
  final GlobalKey _bottomBarKey = GlobalKey();
  double _bottomBarHeight = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final RenderBox? renderBox = _bottomBarKey.currentContext?.findRenderObject() as RenderBox?;
      if (renderBox != null) {
        setState(() {
          _bottomBarHeight = renderBox.size.height + Insets.extraLarge;
          navBarHeight = _bottomBarHeight; // Update global navBarHeight
        });
      }
    });
  }

  List<String> get _navigationPages => [
    RoutesDocument.roadmap,
    RoutesDocument.requestsHistory,
    RoutesDocument.profile,
  ];
  int _getCurrentNavigationIndex() {
    final currentPath = GoRouterState.of(context).matchedLocation; // Better than fullPath here

    if (currentPath.startsWith(RoutesDocument.roadmap)) return 0;
    if (currentPath.startsWith('/requests')) return 1;
    if (currentPath.startsWith(RoutesDocument.profile)) return 2;

    return 0;
  }

  void _navigateToSection(int index) {
    if (index >= 0 && index < _navigationPages.length) {
      HapticFeedback.lightImpact();

      GoRouter.of(context).go(_navigationPages[index]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: CustomBottomNavigationBar(
        key: _bottomBarKey,
        context: context,
        getSelectedIndex: _getCurrentNavigationIndex(),
        onItemTapped: _navigateToSection,
      ),
      body: widget.child,
    );
  }
}
