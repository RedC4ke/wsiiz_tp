import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:wsiiz_tp/features/panel/application/search_controller.dart';

class PanelSearchBar extends ConsumerWidget {
  const PanelSearchBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SearchBar(
      leading: const Icon(
        Icons.search,
      ),
      onChanged: (value) {
        ref.read(searchControllerProvider.notifier).setSearchString(value);
      },
    );
  }
}
