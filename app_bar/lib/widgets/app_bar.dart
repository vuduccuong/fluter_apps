import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DemoAppBar extends StatelessWidget {
  const DemoAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    var localization = AppLocalization.of(context);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(localization!.appTitle),
        leading: IconButton(
          tooltip: localization!.openAppDrawerTooltip,
          icon: const Icon(Icons.menu),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            tooltip: localization!.favorite,
            onPressed: () {},
            icon: const Icon(Icons.favorite),
          ),
          IconButton(
            tooltip: localization.search,
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
          PopupMenuButton<Text>(
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                  child: Text("${localization.option} 1"),
                ),
                PopupMenuItem(
                  child: Text("${localization.option} 2"),
                ),
                PopupMenuItem(
                  child: Text("${localization.option} 3"),
                ),
              ];
            },
            splashRadius: 5.0,
          ),
        ],
      ),
      body: Center(
        child: Text(localization!.home),
      ),
    );
  }
}
