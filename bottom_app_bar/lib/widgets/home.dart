import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CustomBottomAppBar extends StatefulWidget {
  const CustomBottomAppBar({super.key});

  @override
  State createState() => _BottomAppBarState();
}

class _BottomAppBarState extends State<CustomBottomAppBar>
    with RestorationMixin {
  final RestorableBool _showFab = RestorableBool(true);
  final RestorableBool _showNotch = RestorableBool(true);
  final RestorableInt _currentFabLocation = RestorableInt(0);

  @override
  String get restorationId => 'bottom_app_bar';

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(_showFab, 'show_fab');
    registerForRestoration(_showNotch, 'show_notch');
    registerForRestoration(_currentFabLocation, 'current_fab_location');
  }

  @override
  void dispose() {
    _showFab.dispose();
    _showNotch.dispose();
    _currentFabLocation.dispose();
    super.dispose();
  }

  void _onShowFabChanged(bool val) {
    setState(() {
      _showFab.value = val;
    });
  }

  void _onShowNotchChanged(bool val) {
    setState(() {
      _showNotch.value = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(localization!.appTitle),
      ),
      body: ListView(
        padding: const EdgeInsets.only(bottom: 100),
        children: [
          SwitchListTile(
            title: const Text("Setting 1"),
            value: _showFab.value,
            onChanged: _onShowFabChanged,
          ),
          SwitchListTile(
            title: const Text("Setting 2"),
            value: _showNotch.value,
            onChanged: _onShowNotchChanged,
          ),
        ],
      ),
      floatingActionButton: Semantics(
        container: true,
        sortKey: const OrdinalSortKey(0),
        child: FloatingActionButton(
          onPressed: () {},
          tooltip: "Create",
          child: const Icon(Icons.add),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: _BottomAppBar(),
    );
  }
}

class _BottomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Semantics(
      sortKey: const OrdinalSortKey(1),
      container: true,
      label: "Bottom",
      child: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: IconTheme(
          data: const IconThemeData(color: Colors.deepOrange),
          child: Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.menu),
              ),
              const Spacer(),
              IconButton(onPressed: () {}, icon: const Icon(Icons.favorite))
            ],
          ),
        ),
      ),
    );
  }
}
