import 'package:classly_app/core/utils/extensions/build_context_extension.dart';
import 'package:classly_app/core/widgets/navigation_shell/shell_page_config_resolver.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MainNavigationShell extends StatelessWidget {
  const MainNavigationShell({required this.navigationShell, super.key});
  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    final config = ShellPageConfigResolver.resolve(
      context,
    );
    return Scaffold(
      body: navigationShell,
      floatingActionButton: config.floatingActionButton,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: navigationShell.currentIndex,
        onTap: (index) => navigationShell.goBranch(
          index,
          initialLocation: index == navigationShell.currentIndex,
        ),
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.person),
            label: context.localizations.students,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.calendar_month),
            label: context.localizations.classes,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.smart_toy_outlined),
            label: context.localizations.chat,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.checklist),
            label: context.localizations.attendances,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.attach_money),
            label: context.localizations.payments,
          ),
        ],
      ),
    );
  }
}
