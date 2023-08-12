import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/bottom_nav_localizations.dart';

class DemoBottomNav extends StatefulWidget {
  const DemoBottomNav({super.key});

  @override
  State<DemoBottomNav> createState() => _DemoBottomNav();
}

class _DemoBottomNav extends State<DemoBottomNav> with RestorationMixin {
  final RestorableInt _currentIndex = RestorableInt(0);

  @override
  Widget build(BuildContext context) {
    final localizations = BottomNavLocalizations.of(context);

    var bottomNavigationBarItems = <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: const Icon(Icons.add_comment),
        label: localizations!.appTitle,
      ),
      BottomNavigationBarItem(
        icon: const Icon(Icons.calendar_today),
        label: localizations!.appTitle,
      ),
      BottomNavigationBarItem(
        icon: const Icon(Icons.account_circle),
        label: localizations!.appTitle,
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(localizations!.appTitle),
      ),
      body: Center(
        child: PageTransitionSwitcher(
          transitionBuilder: (child, animation, secondaryAnimation) {
            return FadeThroughTransition(
              animation: animation,
              secondaryAnimation: secondaryAnimation,
              child: child,
            );
          },
          child: _NavigationDestinationView(
            key: UniqueKey(),
            item: bottomNavigationBarItems[_currentIndex.value],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: true,
        items: bottomNavigationBarItems,
        currentIndex: _currentIndex.value,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            _currentIndex.value = index;
          });
        },
      ),
    );
  }

  @override
  String? get restorationId => "";

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(_currentIndex, "bottom_navigation_tab_index");
  }

  @override
  void dispose() {
    _currentIndex.dispose();
    super.dispose();
  }
}

class _NavigationDestinationView extends StatelessWidget {
  const _NavigationDestinationView({
    super.key,
    required this.item,
  });

  final BottomNavigationBarItem item;

  @override
  Widget build(BuildContext context) {

    return Stack(
      children: [
        ExcludeSemantics(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: item.icon,
              ),
            ),
          ),
        )
      ],
    );
  }
}
